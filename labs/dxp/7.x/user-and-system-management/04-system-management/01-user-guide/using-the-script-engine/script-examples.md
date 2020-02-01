# Script Examples

Here are some examples to help you use scripts in DXP. Most of the examples originated from the Liferay blog post [5 Tips to Improve Usage of the Liferay Script Console](https://liferay.dev/blogs/-/blogs/5-tips-to-improve-usage-of-the-liferay-script-console).

## Example 1: Presenting New Terms of Use to Users

This example retrieves user information from the database, modifies Users, and then saves the changes to the database. Suppose that your company updates its [terms of use](https://help.liferay.com/hc/en-us/articles/360031899692-Instance-Configuration-Instance-Settings#terms-of-use) and wants present them to the users. When a user agrees to the terms of use, a Boolean field called `agreedToTermsOfUse` is set in the User record associated with that user. As long as the field value is `true`, the user isn't presented with the terms of use. If you set the field `false` for all users, they must agree to the terms of use again before they can sign in.

1.  Enter and execute this script in the Script Console:

    ```groovy
    import com.liferay.portal.kernel.service.UserLocalServiceUtil

    userCount = UserLocalServiceUtil.getUsersCount()
    users = UserLocalServiceUtil.getUsers(0, userCount)

    for (user in users) { println("User Name: " + user.getFullName() + " -- " +
    user.getAgreedToTermsOfUse()) }
    ```

    This script prints each User's `agreedToTermsOfUse` field value.

2.  Replace the script with this:

    ```groovy
    import com.liferay.portal.kernel.service.UserLocalServiceUtil

    userCount = UserLocalServiceUtil.getUsersCount()
    users = UserLocalServiceUtil.getUsers(0, userCount)

    long currentUserId = Long.parseLong(userInfo.get("liferay.user.id"))

    for (user in users){

        if(!user.isDefaultUser() && (user.getUserId() != currentUserId)) {

                user.setAgreedToTermsOfUse(false)
                UserLocalServiceUtil.updateUser(user)

        }

    }
    ```

    The script sets each User's `agreedToTermsOfUse` field to `false`. It skips the default User as well as the default admin User that's currently signed in and running the script.

3.  Click *Execute*.
 
4.  Verify the script updated the records by running the first script again.

All Users (except the default User and your User) are updated. You've enabled the new terms of use agreement for all users to accept.

## Example 2: Embedding HTML Markup in Script Output

The Script Console renders output as HTML content. Thus, you can embed HTML markup in script output to change its look and feel. Here's an example:

```groovy
import com.liferay.portal.kernel.service.*

number = com.liferay.portal.kernel.service.UserLocalServiceUtil.getUsersCount();
out.println(
        """	
                <div style="background-color:black; text-align: center">
                        <h1 style="color: #37A9CC; font-size:xx-large">${number}</h1>
                </div>
        """);
```

![This script styles its output using HTML.](./script-examples/images/01.png)

## Example 3: Showing Exceptions in the Script Console

The Script Console's standard error message is this:

```
Your request failed to complete.
```

The message doesn't describe the error or provide any details. Getting error information requires examining the logs. You can, however, use a try / catch block to capture exceptions and print the exception information in the console.

```groovy
try {
        nullVar = null
        out.println(nullVar.length())
} catch(e) {
        out.println("""<div class="portlet-msg-error">${e}</div>""")
        e.printStackTrace(out)
}
```

![Here's an example of a Groovy script that catches exceptions and prints exception information to the Script Console.](./script-examples/images/02.png)

## Example 4: Logging Output to a Files

A script's output only shows in the Script Console when the script completes. If you want to see a script's progress, you can log messages to a file.

```groovy
import com.liferay.portal.kernel.service.*
import com.liferay.portal.kernel.dao.orm.*

// Output management

final def SCRIPT_ID = "MYSCRIPT"
outputFile = new File("""${System.getProperty("liferay.home")}/scripting/out-${SCRIPT_ID}.txt""")
outputFile.getParentFile().mkdirs()

def trace(message) {
        out.println(message)
        outputFile << "${message}\n"
}

// Main code

users = UserLocalServiceUtil.getUsers(QueryUtil.ALL_POS, QueryUtil.ALL_POS)
users.each { u ->
        trace(u.getFullName())
} 
```

This script creates a subfolder in [Liferay Home](../../../../installation-and-upgrades/installing-liferay-dxp-on-premises/14-reference/01-liferay-home.md) called `scripting` and saves the script output to a file in this folder. 

If you don't have direct access to the file system, you can use this code to print the file content to the Script Console:

```groovy
final def SCRIPT_ID = "MYSCRIPT"
outputFile = new File("""${System.getProperty("liferay.home")}/scripting/out-${SCRIPT_ID}.txt""")
out.println(outputFile.text)
```

Congratulations! You've executed various scripts in the Script Console.

## Additional Information

[Running Scripts From the Script Console](./running-scripts-from-the-script-console.md)

[Using the Script Engine in Workflow](./using-the-script-engine-in-workflow.md)

[Using thes Script Engine](./using-the-script-engine.md)
