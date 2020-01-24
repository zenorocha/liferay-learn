# Invoking Liferay Services From Scripts

Many scripting scenarios require invoking Liferay services. [Liferay `*ServiceUtil` classes](https://docs.liferay.com/dxp/portal/7.2-latest/javadocs/portal-kernel/) are the fastest and most convenient way to invoke Liferay services in the [Script Console](./08-running-scripts-from-the-script-console.md). Use Groovy to invoke Liferay services the same way you would use Java. Groovy's syntax facilitates writing concise, elegant scripts. 

This first example illustrates correct syntax for interacting with Liferay services. It uses `UserLocalServiceUtil` to retrieve a list of users and print their names to Liferay's log. To do this, you could deploy a module with Java code like this:

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

Or you could use Groovy---based on Java---and do the whole thing right from the [Script Console](./08-running-scripts-from-the-script-console.md) with the same code:

```groovy
import com.liferay.portal.kernel.model.User;
import com.liferay.portal.kernel.service.UserLocalServiceUtil;
import java.util.List;

int userCount = UserLocalServiceUtil.getUsersCount();
List<User> users = UserLocalServiceUtil.getUsers(0, userCount);

for (User user:users) {
    System.out.println("User Name: " + user.getFullName());
}
```

You can even make the code somewhat Groovier:

```groovy
import com.liferay.portal.kernel.service.UserLocalServiceUtil

userCount = UserLocalServiceUtil.getUsersCount()
users = UserLocalServiceUtil.getUsers(0, userCount)
for (user in users){
    System.out.println("User Name: " + user.getFullName())
}
```

Groovy scripts that invoke Liferay services are easy to write and execute in the Script Console. 

Running scripts in the Script Console is next.

## Additional Information

[Running Scripts From the Script Console](./08-running-scripts-from-the-script-console.md)

[Using the Script Engine in Workflow](./09-using-the-script-engine-in-workflow.md)

[Script Examples](./10-script-examples.md)
