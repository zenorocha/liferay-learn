# Configuring the Data Upgrade

The data upgrade tool provides the easiest way to upgrade the core and installed modules. You can use text files or the tool's command line interface to configure your upgrade. The upgrade tool can upgrade everything (the core and all the modules) together or separately.

Liferay DXP bundles include the upgrade tool. If you installed Liferay DXP manually, you can download the upgrade tool separately:

- _Liferay DXP 7.2_: Go to the [*Downloads* page](https://customer.liferay.com/group/customer/downloads) and select the _DXP 7.2_ product and the _Product/Service Packs_ file type. In the listing that appears, click _Download_ for the _Liferay DXP Upgrade Client_. 

- _Liferay Portal CE 7.2_: Go to the [_Downloads_ page](https://www.liferay.com/downloads-community) and select _Download_ for _Liferay Portal Tools for 7.2_.

Before starting the data upgrade process, configure the upgrade tool for the core upgrade and specify whether the upgrade tool should upgrade non-core module data automatically. 

## Configuring Non-Core Module Data Upgrades

You can allow the upgrade tool to upgrade all installed modules automatically or to open a Gogo shell (after core upgrade completes) for you to execute module upgrades manually. 

If the upgrade tool's `autoUpgrade` property is set to `true` (the default setting), upgrade processes for all installed modules are run after the core upgrade completes. 

You can also prevent the upgrade tool from automatically running the module upgrades and run them individually afterward. Set `autoUpgrade="false"` in a file named `com.liferay.portal.upgrade.internal.configuration.ReleaseManagerConfiguration.config` and copy the file into the `[Liferay Home]/osgi/configs` folder for the upgrade tool to instead open Gogo shell after the core upgrade. In the Gogo shell, you can [manually administer module upgrades](./09-upgrading-modules-using-gogo-shell.md).

**Note:** Configuring the core upgrade at run-time with the upgrade tool does not provide an option to disable automatically running module upgrades. To prevent module upgrades from running automatically you must disable it (using the configuration above) *before* running the upgrade tool. 

## Configuring with the Upgrade Tool

The core upgrade requires configuration. The simplest way is to use the upgrade tool to create your configuration files. Here's an example interaction with the upgrade tool's command line interface:

```
Please enter your application server (tomcat): 
tomcat

Please enter your application server directory (../../tomcat-8.0.32): 

Please enter your extra library directories (../../tomcat-8.0.32/bin): 

Please enter your global library directory (../../tomcat-8.0.32/lib): 

Please enter your portal directory (../../tomcat-8.0.32/webapps/ROOT): 

[ db2 mariadb mysql oracle postgresql sqlserver sybase ]
Please enter your database (mysql): 
mariadb

Please enter your database host (localhost):

(etc.)
```

> Note that the omitted values are using the defaults displayed in the parentheses.

## Manually Configuring the Core Upgrade

You can also pre-configure the upgrade tool to set more values than the tool generates. Use these files in `[Liferay Home]/tools/portal-tools-db-upgrade-client/` to manually configure the core upgrade:

- `app-server.properties`: Specifies the server location and libraries.
- `portal-upgrade-database.properties`: Configures the database connection.
- `portal-upgrade-ext.properties`: Sets the rest of the portal properties that the upgrade requires. To replicate your current DXP server, you can copy your current portal properties (except your database properties) into this file. Before using your current properties, make sure to [update them for DXP 7.2](./06-preparing-a-new-application-server-for-liferay-dxp.md#migrate-your-portal-properties).

### Configuring app-server.properties

Specify the following information to configure DXP's application server: 

`dir`: the absolute path of the application server folder.

`extra.lib.dirs`: a comma delimited list of extra directories containing any binaries or resources to add to the class path. Use all absolute paths or all paths relative to `dir`.

`global.lib.dir`: the application server's global library directory. Use the absolute path or a path relative to `dir`.

`portal.dir:` the directory where portal is installed in your app server. Use the absolute path or a path relative to `dir`.

`server.detector.server.id:` ID of a supported application server. Here are the supported IDs:

- `jboss`
- `jonas`
- `resin`
- `tomcat`
- `weblogic`
- `websphere`
- `wildfly`

Relative paths must use Unix style format. For example, the following properties are for Windows and use relative paths:

```properties
dir=D:\
extra.lib.dirs=Liferay/liferay-portal-master/tomcat-9.0.10/bin
global.lib.dir=Liferay/liferay-portal-master/tomcat-9.0.10/lib
portal.dir=Liferay/liferay-portal-master/tomcat-9.0.10/webapps/ROOT
server.detector.server.id=tomcat
```

As another example, the following properties are for Linux and use all absolute paths:

```properties
dir=/
extra.lib.dirs=/home/user/liferay/liferay-portal-master/tomcat-9.0.10/bin
global.lib.dir=/home/user/liferay/liferay-portal-master/tomcat-9.0.10/lib
portal.dir=/home/user/liferay/liferay-portal-master/tomcat-9.0.10/webapps/ROOT
server.detector.server.id=tomcat
```

### Configuring portal-upgrade-database.properties

Specify the following information to configure the database you're upgrading. Note that these properties correspond exactly to the [JDBC portal properties](https://docs.liferay.com/dxp/portal/7.2-latest/propertiesdoc/portal.properties.html#JDBC) you'd use in a `portal-ext.properties` file.

- `jdbc.default.driverClassName`

- `jdbc.default.url`

- `jdbc.default.username`

- `jdbc.default.password`

See the latest [portal properties reference](https://docs.liferay.com/dxp/portal/7.2-latest/propertiesdoc/portal.properties.html) for a reference on these values.

### Configuring portal-upgrade-ext.properties

Specify the following information to configure the upgrade: 

- `liferay.home`: The [Liferay home folder](/docs/7-2/deploy/-/knowledge_base/d/liferay-home).

- `dl.store.impl`: The implementation for persisting documents to the document library store. This property is only mandatory if you're using a `*FileSystemStore` implementation. If you [updated this property in your `portal-ext.properties`](./06-preparing-a-new-application-server-for-liferay-dxp.md#configure-your-documents-and-media-file-store), copy the new value here. Otherwise, set the property one of these ways:

```properties
dl.store.impl=com.liferay.portal.store.file.system.FileSystemStore
dl.store.impl=com.liferay.portal.store.db.DBStore
dl.store.impl=com.liferay.portal.store.file.system.AdvancedFileSystemStore
dl.store.impl=com.liferay.portal.store.s3.S3Store
```

- `hibernate.jdbc.batch_size`: The JDBC batch size used to improve performance (set to _250_ by default). _This property may improve upgrade performance, but it is not required._

### Example Upgrade Configurations

Here are example upgrade configuration files that you can customize and copy into `[Liferay Home]/tools/portal-tools-db-upgrade-client/`: 

- `app-server.properties`:

    ```properties
    dir=../../tomcat-8.0.32
    global.lib.dir=/lib
    portal.dir=/webapps/ROOT
    server.detector.server.id=tomcat
    extra.lib.dirs=/bin
    ```

- `portal-upgrade-database.properties`:

    ```properties
    jdbc.default.url=jdbc:mysql://lportal62?characterEncoding=UTF-8&dontTrackOpenResources=true&holdResultsOpenOverStatementClose=true&useFastDateParsing=false&useUnicode=true
    jdbc.default.driverClassName=com.mysql.cj.jdbc.Driver
    jdbc.default.username=root
    jdbc.default.password=
    ```

- `portal-upgrade-ext.properties`:

    ```properties
    liferay.home=/home/user/servers/liferay7
    module.framework.base.dir=/home/user/servers/liferay7/osgi
    dl.store.impl=com.liferay.portal.store.file.system.FileSystemStore
    ```
