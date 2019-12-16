# Portal Properties

All the configurations that DXP requires to run out-of-the-box are specified using *Portal Properties*. The properties are a set of name/value pairs DXP reads from properties files on first startup and reads from the DXP database and properties files on subsequent startups. The property defaults are specified in the DXP installation's `portal-impl.jar/portal.properties` file. The [Portal Properties](https://docs.liferay.com/dxp/portal/7.2-latest/propertiesdoc/portal.properties.html) reference lists all of the properties and includes descriptions, example values, and default values.

All properties can be changed using a properties file; the standard file to create is `[LIFERAY_HOME]/portal-ext.properties`). Some properties can be changed using [System Settings](https://help.liferay.com/hc/en-us/articles/360029131591-System-Settings) in the Control Panel.

Here are the main portal properties topics:

- [Portal Properties Files](#portal-properties-files)
- [Example: Setting a Database Connection](#example-setting-a-database-connection)
- [Setting Liferay Home](#setting-liferay-home)
- [Properties File Prioritization](#properties-file-prioritization)
- [Setting Portal Properties in the UI](#setting-portal-properties-in-the-ui)

## Portal Properties Files

Portal Properties files offer these conveniences:

- They can be propagated to cluster nodes and customized for each node.
- They can be saved to a repository.
- Setting all your custom properties in a file before initial startup is the quickest way to configure DXP.

The default properties in your `portal-impl.jar/portal.properties` file can be overridden by one or more portal properties files in your [`[LIFERAY_HOME]`](./01-liferay-home.md) folder or `[USER_HOME]` folder. A properties file should only specify the properties it is changing. The most common file to create and use for overriding properties is `[LIFERAY_HOME]/portal-ext.properties`.

> **Important:** Never modify the `portal-impl.jar/portal.properties` file. Preserve the default values in case you need to revert to them.

If there is no `portal-ext.properties` on initial server startup, DXP stores values entered in the [Setup Wizard](../01-installing-liferay-dxp/05-using-the-setup-wizard.md) to a file called `portal-setup-wizard.properties`.

> `[USER_HOME]` is your user's home folder on your operating system (e.g., `/user/liferay` on Linux/UNIX, `/Users/liferay` on Windows).

## Example: Setting a Database Connection

Database connection properties are most commonly set in a `portal-ext.properties` file. If you want to change the database connection, for example, create a  `portal-ext.properties` file and set the [database connection properties](./05-database-templates.md) to the values you want:

```properties
jdbc.default.driverClassName=org.mariadb.jdbc.Driver
jdbc.default.url=jdbc:mariadb://localhost/lportal?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false
jdbc.default.username=joe.bloggs
jdbc.default.password=123456
```

> For more database configuration details, see [Connecting to a Database](../01-installing-liferay-dxp/04-connecting-a-database.md) and [Database Templates](./05-database-templates.md).


## Setting Liferay Home

Some application servers (e.g., WebLogic) require customizing the [`[LIFERAY_HOME]`](https://help.liferay.com/hc/en-us/articles/360028831932-Installing-Liferay-DXP-on-WebLogic-12c-R2) location before deploying the DXP WAR file. The [`liferay.home`](https://docs.liferay.com/dxp/portal/7.2-latest/propertiesdoc/portal.properties.html#Liferay%20Home) property lets you set the location.

## Properties File Prioritization

DXP's [`include-and-override`](https://docs.liferay.com/dxp/portal/7.2-latest/propertiesdoc/portal.properties.html#Properties%20Override) Portal Property specifies the order that properties files are read and prioritized, with 1. taking highest priority:

1. `${Liferay Home}/portal-setup-wizard.properties`
1. `${user home}/portal-setup-wizard.properties`
1. `${Liferay Home}/portal-ext.properties`
1. `${user home}/portal-ext.properties`
1. `${Liferay Home}/portal-bundle.properties`
1. `${user home}/portal-bundle.properties`
1. `${Liferay Home}/portal.properties`
1. `portal-impl.jar/portal.properties`

**Important:** Properties set in the UI (discussed next) are prioritized over properties set in Portal Properties files.

## Setting Portal Properties in the UI

Some Portal Properties are available to change as [System Settings](https://help.liferay.com/hc/en-us/articles/360029131591-System-Settings) at *Control Panel* &rarr; *Configuration* &rarr; *System Settings*. These properties are stored in the DXP database. The SAML authentication properties are an example of Portal Properties available in System Settings.

## Additional Information

[Portal Properties](https://docs.liferay.com/dxp/portal/7.2-latest/propertiesdoc/portal.properties.html)

[System Settings](https://help.liferay.com/hc/en-us/articles/360029131591-System-Settings)
