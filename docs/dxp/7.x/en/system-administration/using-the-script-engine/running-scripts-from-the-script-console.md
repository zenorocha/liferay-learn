# Running Scripts From the Script Console

The Script Console provides a single view for executing Groovy scripts and printing their output. It has predefined variables that facilitate working with widgets and users. The following topics get you started with the Script Console:

* [Running a Sample Script in the Script Console](#running-a-sample-script-in-the-script-console)
* [Predefined variables available in the Script Console](#predefined-variables)
* [Tips for running scripts in the Script Console](#tips)

```important::
   The Script Console is for system operations and maintenance---it's not for end users. Limit Script Console access to portal administrators.
```

Start with running the Script Console's sample script.

## Running a Sample Script in the Script Console

Here's how to run the sample script in the Script Console:

1. Sign in as an administrator.
1. In the Product Menu, navigate to *Control Panel* and select *Configuration* &rarr; *Server Administration*.
1. Click on *Script*. This is the Script Console. The default sample script prints the User count to the console output.

    ```groovy
    // ### Groovy Sample ###

    number = com.liferay.portal.kernel.service.UserLocalServiceUtil.getUsersCount();

    out.println(number);
    ```

1. Click *Execute* and check the Script Console *Output* for the User count.

    ![The Script Console's sample Groovy script prints the User count to Script Console output.](./running-scripts-from-the-script-console/images/01.png)

The Groovy sample invokes the Liferay service utility [`UserLocalServiceUtil`](https://docs.liferay.com/dxp/portal/7.2-latest/javadocs/portal-kernel/com/liferay/portal/kernel/service/UserLocalServiceUtil.html) to get the user count. Then it uses `out` (a built-in `PrintWriter`) to write the count to the Script Console.

```note::
   If you use *System.out.println* instead of *out.println*, your output is printed to Liferay's log file rather than to the Script Console.
```

## Predefined Script Console Variables

Here are the predefined variables available to scripts in the Script Console:

| Variable | Class |
| :------- | :---- |
| `out` | `java.io.PrintWriter` |
| `actionRequest` | `javax.portlet.ActionRequest` |
| `actionResponse` | `javax.portlet.ActionReponse` |
| `portletConfig` | `javax.portlet.PortletConfig` |
| `portletContext` | `javax.portlet.PortletContext` |
| `preferences` | `javax.portlet.PortletPreferences` |
| `userInfo` | `java.util.Map<String, String>` |

### Variable Usage

This script demonstrates using the `actionRequest` variable to get the portal instance's `Company`:

```groovy
import com.liferay.portal.kernel.util.*

company = PortalUtil.getCompany(actionRequest)
out.println("Current Company:${company.getName()}\n")

out.println("User Info:")
userInfo.each {
        k,v -> out.println("${k}:${v}")
}
```

![Here's an example of invoking a Groovy script that uses the predefined out, actionRequest, and userInfo variables to print information about the Company and User.](./running-scripts-from-the-script-console/images/02.png)

## Tips

Keep these things in mind when using the Script Console:

* There is no undo.
* There is no preview.
* Permissions checking is not enforced for local services.
* Scripts are executed synchronously. Avoid executing scripts that might take a long time.

Use the Script Console cautiously and test your scripts on non-production systems before running them on production.

The script engine can be used outside of the Script Console, such as in a Kaleo Workflow. Using the script engine in workflows is next.

## Additional Information

* [Invoking Liferay services](./invoking-liferay-services-from-scripts.md)
* [Using the Script Engine in Workflow](./using-the-script-engine-in-workflow.md)
* [Script Examples](./script-examples.md)
