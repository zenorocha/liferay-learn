# Invoking Liferay Services From Scripts

Many scripting scenarios require invoking Liferay services. [Liferay `*ServiceUtil` classes](https://docs.liferay.com/dxp/portal/7.2-latest/javadocs/portal-kernel/) are the fastest and most convenient way to invoke Liferay services in the [Script Console](./running-scripts-from-the-script-console.md). Use Groovy to invoke Liferay services the same way you would use Java. Groovy's syntax facilitates writing concise, elegant scripts.

We'll demonstrate by comparing Java code and Groovy code that uses `UserLocalServiceUtil` to retrieve a list of users and print their names to Liferay's log.

## Java

You can execute this Java code in a module deployed to DXP or you can execute the code in the [Script Console](./running-scripts-from-the-script-console.md):

```groovy
import com.liferay.portal.kernel.model.User;
import com.liferay.portal.kernel.service.UserLocalServiceUtil;
import java.util.List;

...

int userCount = UserLocalServiceUtil.getUsersCount();
List<User> users = UserLocalServiceUtil.getUsers(0, userCount);

for (User user:users) {
    System.out.println("User Name: " + user.getFullName());
}

...
```

## Groovy

Or you could use Groovy code in the Script Console:

```groovy
import com.liferay.portal.kernel.service.UserLocalServiceUtil

userCount = UserLocalServiceUtil.getUsersCount()
users = UserLocalServiceUtil.getUsers(0, userCount)

for (user in users){
    System.out.println("User Name: " + user.getFullName())
}
```

Importing `com.liferay.portal.kernel.model.User` and `java.util.List` isn't necessary because the Script Console makes them available. And the Groovy syntax is simpler than the Java syntax.

## Next Steps

* [Running Scripts From the Script Console](./running-scripts-from-the-script-console.md)
* [Using the Script Engine in Workflow](../../process-automation/workflow/developer-guide/using-the-script-engine-in-workflow.md)
* [Script Examples](./script-examples.md)
