# Using the Script Engine in Workflow

Liferay's [workflow engine](../user-guide/introduction-to-workflow.md) is a robust system for reviewing and approving content in enterprise environments. Even if you don't leverage scripts, it's a powerful and robust workflow solution. Adding scripts takes it to the next level. These scripts aren't run from the [Script Console](../../../system-administration/using-the-script-engine/running-scripts-from-the-script-console.md), but are embedded in [XML workflow definitions](https://help.liferay.com/hc/en-us/articles/360029147791-Introduction-to-Crafting-XML-Workflow-Definitions) and run during workflow execution.

Here are the workflow scripting topics:

* [Adding Scripts to Workflow Nodes](#adding-scripts-to-workflow-nodes)
* [Using Predefined Variables](#predefined-variables)
* [Script Example](#script-examples)
* [Calling OSGi Services](#calling-osgi-services)

## Adding Scripts to Workflow Nodes

Workflow scripts can be invoked from actions in these workflow node types:

* `<fork>`
* `<join>`
* `<state>`
* `<task>`

Here's the format for an action that invokes a script:

```xml
<actions>
<action>
    <script>
        <![CDATA[script code goes here]]>
    </script>
    <script-language>scripting language name goes here</script-language>
</action>
...
</actions>
```

These script elements from the default workflow definition's state node, for example, set the workflow status to *approved*.

```xml
<script>
<![CDATA[
    import com.liferay.portal.kernel.workflow.WorkflowStatusManagerUtil;
    import com.liferay.portal.kernel.workflow.WorkflowConstants;

    WorkflowStatusManagerUtil.updateStatus(WorkflowConstants.getLabelStatus("approved"), workflowContext);
]]>
</script>
<script-language>groovy</script-language>
```

## Predefined Variables

Some variables are available to the node types mentioned above while others are exclusively available to `task` nodes.

### Variables that are Always Available

These variables are available from anywhere that you can run a workflow script:

`kaleoInstanceToken` ([`KaleoInstanceToken`](https://github.com/liferay/liferay-portal/blob/7.2.0-ga1/modules/apps/portal-workflow/portal-workflow-kaleo-api/src/main/java/com/liferay/portal/workflow/kaleo/model/KaleoInstanceToken.java))
: A workflow instance and corresponding instance token (the `KaleoInstanceToken`) are created each time a User clicks _Submit for Publication_. Use the injected token to retrieve its ID, by calling `kaleoInstanceToken.getKaleoInstanceTokenId()`. This is often passed as a method parameter in a script.

`userId`
: The `userId` returned is context dependent. Technically, the logic works like this: if the `KaleoTaskInstanceToke.getcompletionUserId()` is null, check `KaloeTaskInstanceToken.getUserId()`. If that's null too, call `KaleoInstanceToken.getUserId()`. It's the ID of the last User to intervene in the workflow at the time the script is run. In the `created` node, this would be the User that clicked _Submit for Publication_, whereas it's the ID of the reviewer upon exit of the `review` node of the Single Approver definition.

`workflowContext` (`Map<String, Serializable>`)
: The workflow context contains information you can use in scripts. The context is typically passed as a parameter, but all of the `WorkflowContext`'s attributes are available in the script as well. The workflow context in the script is context dependent. If a call to `ExecutionContext.getWorkflowContext()` comes back null, then the workflow context is obtained by `KaleoInstanceModel.getWorkflowContext()`.

### Variables Injected into Task Nodes

`kaleoTaskInstanceToken` ([`KaleoTaskInstanceToken`](https://github.com/liferay/liferay-portal/blob/7.2.0-ga1/modules/apps/portal-workflow/portal-workflow-kaleo-api/src/main/java/com/liferay/portal/workflow/kaleo/model/KaleoTaskInstanceToken.java))
: The task's token itself is available in the workflow script. Use it to get its ID, to use in other useful programmatic workflow activities, like programmatic assignment.

`taskName` (`String`)
: The task's own name is accessible (returns the same as `KaleoTak.getName()`).

`workflowTaskAssignees` (`List<`[`WorkflowTaskAssignee`](https://github.com/liferay/liferay-portal/blob/7.2.0-ga1/portal-kernel/src/com/liferay/portal/kernel/workflow/WorkflowTaskAssignee.java)`>`)
: Lists the task's assignees.

`kaleoTimerInstanceToken` ([`KaleoTimerInstanceToken`](https://github.com/liferay/liferay-portal/blob/7.2.0-ga1/modules/apps/portal-workflow/portal-workflow-kaleo-api/src/main/java/com/liferay/portal/workflow/kaleo/model/KaleoTimerInstanceToken.java))
: If a [task timer](https://help.liferay.com/hc/en-us/articles/360028834732-Workflow-Task-Nodes#task-timers) exists, get its ID by calling `kaleoTimerInstanceToken.getKaleoTimerInstanceTokenId()`.

## Script Example

At virtually any point in a workflow, you can use Liferay's script engine to access workflow APIs or other Liferay APIs. Here are a few practical ways you can use workflow scripts:

* Getting a list of users with a specific workflow-related role
* Sending an email to the designated content approver with a list of people to contact if he is unable to review the content
* Creating an alert to be displayed in the Alerts portlet for any user assigned to approve content

The following workflow script is written using Groovy and is used with a `Condition` statement. The script uses Liferay's [asset framework](https://help.liferay.com/hc/en-us/articles/360028725412-Introduction-to-Asset-Framework) to determine an asset's category and uses the category to determine the correct approval process automatically.  If the asset is in the `legal` category , it is sent to the `Legal Review` task upon submission. Otherwise, the asset is sent to the `Default Review` task.

```xml
<script>
    <![CDATA[
        import com.liferay.portal.kernel.util.GetterUtil;
        import com.liferay.portal.kernel.workflow.WorkflowConstants;
        import com.liferay.portal.kernel.workflow.WorkflowHandler;
        import com.liferay.portal.kernel.workflow.WorkflowHandlerRegistryUtil;
        import com.liferay.asset.kernel.model.AssetCategory;
        import com.liferay.asset.kernel.model.AssetEntry;
        import com.liferay.asset.kernel.model.AssetRenderer;
        import com.liferay.asset.kernel.model.AssetRendererFactory;
        import com.liferay.asset.kernel.service.AssetEntryLocalServiceUtil;

        import java.util.List;

        String className = (String)workflowContext.get(
            WorkflowConstants.CONTEXT_ENTRY_CLASS_NAME);

        WorkflowHandler workflowHandler =
            WorkflowHandlerRegistryUtil.getWorkflowHandler(className);

        AssetRendererFactory assetRendererFactory =
            workflowHandler.getAssetRendererFactory();

        long classPK =
            GetterUtil.getLong((String)workflowContext.get
            (WorkflowConstants.CONTEXT_ENTRY_CLASS_PK));

        AssetRenderer assetRenderer =
            workflowHandler.getAssetRenderer(classPK);

        AssetEntry assetEntry = assetRendererFactory.getAssetEntry(
            assetRendererFactory.getClassName(), assetRenderer.getClassPK());

        List<AssetCategory> assetCategories = assetEntry.getCategories();

        returnValue = "Default Review";

        for (AssetCategory assetCategory : assetCategories) {
            String categoryName = assetCategory.getName();

            if (categoryName.equals("legal")) {
                returnValue = "Legal Review";

                return;
            }
        }
       ]]>
</script>
<script-language>groovy</script-language>
```

```note::
   A script's return value determines the next task or state.
```

See [Embedded Workflows](https://help.liferay.com/hc/en-us/articles/360028721732-Introduction-to-Workflow#embedded-workflows) for more workflow script examples.

## Calling OSGi Services

[Service Trackers](https://help.liferay.com/hc/en-us/articles/360028846472-Service-Trackers-for-OSGi-Services) retrieve OSGi services that are available. If the Service Tracker returns null for the service, that service is unavailable and you can do something appropriate in response.

Here's a workflow script written in Groovy that uses a `JournalArticleLocalService` to get an article count:

```groovy
import com.liferay.journal.model.JournalArticle;
import com.liferay.journal.service.JournalArticleLocalService;
import com.liferay.portal.scripting.groovy.internal.GroovyExecutor;

import org.osgi.framework.Bundle;
import org.osgi.framework.FrameworkUtil;
import org.osgi.util.tracker.ServiceTracker;

ServiceTracker<JournalArticleLocalService, JournalArticleLocalService> st;

try {
    Bundle bundle = FrameworkUtil.getBundle(GroovyExecutor.class);

    st = new ServiceTracker(bundle.getBundleContext(), JournalArticleLocalService.class, null);
    st.open();

    JournalArticleLocalService jaService = st.waitForService(500);

    if (jaService == null) {
        _log.warn("The required service 'JournalArticleLocalService' is not available.");
    }
    else {
        java.util.List<JournalArticle>articles = jaService.getArticles();
        if (articles != null) {
            _log.info("Article count: " + articles.size());
        } else {
            _log.info("no articles");
        }
    }
}
catch(Exception e) {
    //Handle error appropriately
}
finally {
    if (st != null) {
        st.close();
    }
}
```

The script tracks the service using the OSGi bundle of the class that executes the script. Since a `com.liferay.portal.scripting.groovy.internal.GroovyExecutor` instance executes the script, the instance's bundle is used to track the service.

```groovy
Bundle bundle = FrameworkUtil.getBundle(GroovyExecutor.class);
```

Liferay's Kaleo Workflow Engine and Liferay's Script Engine makes for a powerful combination. When configuring your permissions, be aware of the potential consequences of poorly or maliciously written scripts inside a workflow definition.

## Additional Information

* [Introduction to Workflow](../user-guide/introduction-to-workflow.md)
* [Running Scripts From the Script Console](../../../system-administration/using-the-script-engine/running-scripts-from-the-script-console)
* [Script Examples](../../../system-administration/using-the-script-engine/script-examples.md)
