# Managing Workflows

The _Workflow_ application allows users to manage their workflow processes; they can upload a new workflow definition, and make changes to the definitions. Lastly, they can delete workflows.

## Uploading a New Workflow Definition

If you are not [building a new workflow process](./building-workflows.md), you can upload one in `XML` format. All DXP workflow definitions are written in `XML` format; see the [Introduction to Crafting XML Workflow Definitions](https://help.liferay.com/hc/articles/360029147791-Introduction-to-Crafting-XML-Workflow-Definitions) to learn more.

To upload a new definition:

1. Navigate to the _Control Panel_ &rarr; _Workflow_ &rarr; _Process Builder_.
1. Click the _New Workflow_ button (![Add](../../../images/icon-add.png)).
1. If you have a local XML definition file based on an embedded workflow, you can upload it to DXP. Click the _Source_ tab.
1. Enter a name for the new definition.
1. Copy the content of the XML file and and overwrite the sample code or click _import a file_ to upload the file.

    ![Adding a new definition by uploading one](./managing-workflows/images/01.png)

1. Click the _Save_ button.
1. Click the _Publish_ button.

The newly added definition is ready to be used as a workflow process.

## Editing a Workflow Definition

Users can edit the workflow definitions and all changes are tracked in the _Details_ and _Revision History_ menus. To edit a workflow:

1. Navigate to the _Control Panel_ &rarr; _Workflow_ &rarr; _Process Builder_.
1. Click the _Actions_ button (![Actions](../../../images/icon-actions.png)) for the workflow then _Edit_.

    ![Editing a definition](./managing-workflows/images/03.png)

### Viewing Workflow Versions

To view the workflow definition details and the revision history:

1. Click the *Information* button (![Information](../../../images/icon-information.png))
1. Next to a previous version on the _Revision History_ tab, click the *Actions* button (![Actions](../../../images/icon-actions.png)) and select either *Preview* or *Restore*.

    ![View and restore prior versions of a workflow.](./managing-workflows/images/02.png)

1. When you click *Restore* and see the success message, the prior version is the current version of the workflow. You can now edit the restored version of the workflow.
1. If edits are necessary, edit and click *Update*. This creates another version of the workflow.

## Deleting a Workflow Definition

Only Unpublished workflows can be deleted.

There are two statuses for a workflow:

* **Published:** Validation is complete, and the workflow can be assigned to assets.
* **Unpublished:** Validation is not performed on the unpublished workflow, and it cannot be assigned to assets until it is published.

_Published_ workflow definitions cannot be deleted if they are current associated with an asset type. Users have to first deactivate the workflow process and then place the workflow in the _Unpublished_ status.

1. To deactivate an asset type's workflow, reverse the steps found in the [Activating Workflow](./activating-workflow.md) article for each asset type and select _No Workflow_.
1. Navigate to the _Control Panel_ &rarr; _Workflow_ &rarr; _Process Builder_.
1. Click the _Actions_ button (![Actions](../../../images/icon-actions.png)) for the workflow then _Unpublish_.

    ![Unpublishing a Workflow](./managing-workflows/images/04.png)

1. The selected definition is now in the _Unpublished_ section. Click the _Actions_ button (![Actions](../../../images/icon-actions.png)) for the workflow then _Delete_.

    ![Deleting a Workflow](./managing-workflows/images/05.png)

## Configuring Workflow Definition Permissions

In the _System Settings_, you can enable or disable permissions for site administrators to publish workflows and scripts.

![Explicit permission must be granted before administrators are allowed to publish and edit workflow definitions.](./managing-workflows/images/06.png)

## Additional Information

* [Introduction to Crafting XML Workflow Definitions](https://help.liferay.com/hc/articles/360029147791-Introduction-to-Crafting-XML-Workflow-Definitions)
* [Workflow Designer (DXP only)](https://help.liferay.com/hc/articles/360028821892-Workflow-Designer)
