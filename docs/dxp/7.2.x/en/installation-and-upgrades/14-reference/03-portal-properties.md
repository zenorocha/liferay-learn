# Portal Properties

The `portal.properties` file is the file that stores all the configurations required to run Liferay DXP out-of-the-box. Administrators can change the portal properties to modify DXP according to their requirements.

While some changes can be made through the user interface (UI) once the instance has started, other configurations have to be set before the application server has started. These changes include but not limited to, switching databases, declaring the _Liferay Home_ folder, changing how users authenticate (by screen name instead of by email address), and increasing the file sizes for uploads.

As best practice, administrators should **not** modify the `portal.properties` file directly because this can cause loss of functionalities or performance degradation. Rather, create a file that contains the only desired properties (also known as an extension file), usually the `portal-ext.properties` file.

## Example: Setting MySQL as the Database

As noted above, administrators can change the database by declaring the new properties in a `${Liferay Home}/portal-ext.properties` file:

```properties
jdbc.default.driverClassName=com.mysql.cj.jdbc.Driver
jdbc.default.url=jdbc:mysql://localhost/lportal?characterEncoding=UTF-8&dontTrackOpenResources=true&holdResultsOpenOverStatementClose=true&serverTimezone=GMT&useFastDateParsing=false&useUnicode=true
jdbc.default.username=jbloggs
jdbc.default.password=pass123
```

For more information, see the [Connecting to a Database](../01-installing-liferay-dxp/04-connecting-a-database.md) and [Database Templates](./05-database-templates.md) articles.

## Setting Liferay Home

When installing DXP manually on an application server, sometimes it is necessary to declare the location of the `${liferay.home}` folder before deploying the WAR file. (See _[Installing Liferay DXP on Weblogic](placeholder)_.) This is usually done in the `portal-ext.properties` which overrides the default location specified in the `portal.properties`.

See [Liferay Home](./01-liferay-home.md) for more information about how the `${liferay.home}` folder is used.

## Properties File Prioritization

Normally, the `${Liferay Home}/portal-ext.properties` file is the most commonly used file for overriding the defaults. However, there is also the `portal-setup-wizard.properties` file which is usually created when the portal starts for the first time but only if it does not detect a preexisting `portal-ext.properties` file. As best practice, limit the number of extension files.

If there are multiple extension files, the [`include-and-override`](https://docs.liferay.com/dxp/portal/7.2-latest/propertiesdoc/portal.properties.html#Properties%20Override) property specifies which portal property files override the defaults. This property specifies the order the files are read, ranked from highest to lowest:

1. `${Liferay Home}/portal-setup-wizard.properties`
1. `${user home}/portal-setup-wizard.properties`
1. `${Liferay Home}/portal-ext.properties`
1. `${user home}/portal-ext.properties`
1. `${Liferay Home}/portal-bundle.properties`
1. `${user home}/portal-bundle.properties`
1. `${Liferay Home}/portal.properties`
1. `portal-impl.jar/portal.properties`

> \* `${user home}` refers your user's home folder on each operating system (Linux/Unix: `/usr/Liferay`; Windows: `/Users/Liferay`)

### Portal Properties and the GUI

There are some settings that can be made in the Control Panel or the `portal-ext.properties`; one example is enabling SAML for authentication. In this case, the settings made in the Control Panel are prioritized over those made in the `portal-ext.properties`.

## Additional Information

A DXP installation's `portal-impl.jar` contains the default properties file: see [portal.properties](https://docs.liferay.com/dxp/portal/7.2-latest/propertiesdoc/portal.properties.html) to view the full contents of the file.
