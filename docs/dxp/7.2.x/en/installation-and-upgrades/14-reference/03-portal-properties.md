# Portal Properties

All the configurations that DXP requires to run out-of-the-box are specified using *Portal Properties*. The properties are a set of name/value pairs that DXP reads from properties files on server startup. The property defaults are specified in the DXP installation's `portal-impl.jar/portal.properties` file. The [Portal Properties](https://docs.liferay.com/dxp/portal/7.2-latest/propertiesdoc/portal.properties.html) reference lists all of the properties and includes descriptions, example values, and default values.

While some properties can be changed through the user interface (UI) once application server startup completes, other properties must be changed in a property file before the server is started. Some examples of configurations that _must_ be done through a properties file include but are not limited to: connecting to and switching databases, declaring the location of the [`[LIFERAY_HOME]`](./01-liferay-home.md) folder, changing how users authenticate (by screen name instead of by email address), and increasing the size limit for file uploads.

> **Warning:** Never directly modify the `portal-impl.jar/portal.properties` file; rather, use another properties file (an extension file) to override properties you want to change. The typical extension file to create is called `portal-ext.properties`, in your [`[LIFERAY_HOME]`](./01-liferay-home.md) or `[USER_HOME]` folder.

Using Portal Properties to configure a DXP installation is the most common and recommended method of configuring Liferay DXP and also provides the following benefits:

* A single configuration file that can be easily distributed to other Liferay DXP environments and server nodes.
* The ability to check configurations into a version control system to simplify configuration management.
* Setting all your custom properties in a file before initial startup is the quickest way to configure DXP.

## Using Portal Properties

`[LIFERAY_HOME]/portal-ext.properties` is the most common extension file to use. It there is no `portal-ext.properties` file and you apply changes using the Setup Wizard, DXP sets those properties in a file called `portal-setup-wizard.properties`.

Here are a few examples of configurations that can be set in a `portal.properties` file.

### Setting a Database Connection

Database connection properties are most commonly set in a `portal-ext.properties` file. If you want to change the database connection, for example, create a `portal-ext.properties` file and set the [database connection properties](./05-database-templates.md) to the values you want:

```properties
jdbc.default.driverClassName=org.mariadb.jdbc.Driver
jdbc.default.url=jdbc:mariadb://localhost/lportal?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false
jdbc.default.username=joe.bloggs
jdbc.default.password=123456
```

> For more database configuration details, see [Connecting to a Database](../01-installing-liferay-dxp/04-connecting-a-database.md) and [Database Templates](./05-database-templates.md).

### Setting Liferay Home

Some application servers (e.g., WebLogic) require customizing the [`[LIFERAY_HOME]`](https://help.liferay.com/hc/en-us/articles/360028831932-Installing-Liferay-DXP-on-WebLogic-12c-R2) location before deploying the DXP WAR file. The [`liferay.home`](https://docs.liferay.com/dxp/portal/7.2-latest/propertiesdoc/portal.properties.html#Liferay%20Home) property lets you set the location.

## Configuration Prioritization

It is possible to create multiple Portal Properties override files - in this circumstance, Liferay DXP will prioritize the order in which the property values are read and applied with 1. taking highest priority:

1. `${LIFERAY_HOME}/portal-setup-wizard.properties`
1. `${USER_HOME}/portal-setup-wizard.properties`
1. `${LIFERAY_HOME}/portal-ext.properties`
1. `${USER_HOME}/portal-ext.properties`
1. `${LIFERAY_HOME}/portal-bundle.properties`
1. `${USER_HOME}/portal-bundle.properties`
1. `${LIFERAY_HOME}/portal.properties`
1. `portal-impl.jar/portal.properties`

This ordering itself can be changed and configured by setting DXP's [`include-and-override`](https://docs.liferay.com/dxp/portal/7.2-latest/propertiesdoc/portal.properties.html#Properties%20Override) Portal Property.

> **Note:** We recommend using as few properties files as necessary to simplify configuration management for a DXP installation.

### UI Configuration and Portal Properties

Some Portal Properties are available to change as [System Settings](https://help.liferay.com/hc/en-us/articles/360029131591-System-Settings), at *Control Panel* &rarr; *Configuration* &rarr; *System Settings* or in `.config` files. These properties are stored in the DXP database. The SAML authentication properties, for example, are Portal Properties available in System Settings.

> **Important:** Properties set in the UI (discussed next) are prioritized over properties set in Portal Properties files.

## Additional Information

* [Portal Properties](https://docs.liferay.com/dxp/portal/7.2-latest/propertiesdoc/portal.properties.html)
* [System Settings](https://help.liferay.com/hc/en-us/articles/360029131591-System-Settings)
