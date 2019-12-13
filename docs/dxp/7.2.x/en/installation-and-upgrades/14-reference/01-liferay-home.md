# Liferay Home

*Liferay Home* is the folder from which Liferay DXP launches applications, reads and applies configurations, loads JAR files, and generates logs.

* *In a DXP bundle*, Liferay Home is the installation's top-level folder and it contains the application server.

* *In a manual installation,* the Liferay Home folder varies by application server. If you're doing a manual installation, please refer to the article covering that app server (e.g., *Installing DXP on [app server]*) for the Liferay Home location.

DXP installations contain this folder structure regardless of application server:

```
[LIFERAY_HOME]
    ├── [application server]
    ├── data
    ├── deploy
    ├── license
    ├── logs
    ├── osgi
    │   └── configs
    │   └── core
    │   └── marketplace
    │   └── modules
    │   └── portal
    │   └── state
    │   └── target-platform
    │   └── test
    │   └── war
    ├── patching-tool
    ├── tools
    └── work
```

## Liferay Home Reference

Here is a breakdown of each directory with a brief description of its purpose:

* **[Application Server]**: This folder is named after the application server where DXP is installed.
* `data` (if HSQL database is selected): Stores an embedded HSQL database, Liferay Portal's file repository, and search indexes. The embedded HSQL database is configured by default, but it's intended for demonstration and trial purposes only. The [Portal property `jdbc.default.url`](https://docs.liferay.com/dxp/portal/7.2-latest/propertiesdoc/portal.properties.html#JDBC) sets the Hypersonic embedded HSQL database location.
* `deploy`: By default, this directory is used to auto-deploy plugins. Auto-deploy supports application `.lpkg` files from Liferay Marketplace, plugin `.war` files, and plugin `.jar` files. Administrators can configure an alternative path for the `deploy` directory by setting the [Portal property `auto.deploy.deploy.dir`](https://docs.liferay.com/dxp/portal/7.2-latest/propertiesdoc/portal.properties.html#Auto%20Deploy).
* `license`: DXP's copyright and version files are here.
* `logs`: Log files go here. Examine them as you diagnose problems. `portal-impl.jar`'s `portal-impl/src/META-INF/portal-log4j.xml` file sets the log file location. To override the log file location, you must [use an `ext-impl/src/META-INF/portal-log4j-ext.xml` file in an Ext plugin](/docs/7-2/customization/-/knowledge_base/c/customization-with-ext).
* `osgi`: All the JAR files and a few configuration files for the OSGi runtime belong in this folder. The [Portal property `module.framework.base.dir`](https://docs.liferay.com/dxp/portal/7.2-latest/propertiesdoc/portal.properties.html#Module%20Framework) sets the OSGi folder location. Here are its subfolders:
  * `configs`: Component configuration files.
  * `core`: Liferay Portal's core modules.
  * `marketplace`: Marketplace applications and application suites.
  * `modules`: Modules you've deployed.
  * `portal`: Liferay Portal's non-core modules.
  * `state`: Contains OSGi internal state files for such things as OSGi bundle installation, bundle storage, and more.
  * `target-platform`: Target platform index.
  * `test`: Modules that support test integration.
  * `war`: WAR plugins you've deployed.
* `patching-tool`: (Liferay DXP subscribers only) This folder holds patches and a utilities for installing the patches.
* `tools`: For DXP upgrade and target platform indexer.
* `work`: Module Jasper work files.

> **Note:** If DXP cannot create resources in the Liferay Home folder or if it finds itself running on certain application servers, it creates a folder called `liferay` in the home folder of the operating system user that is running DXP. In this case, that `liferay` folder becomes [Liferay Home]. For example, if the operating system user's name is jbloggs, the `liferay` folder path is `/home/jbloggs/liferay` or `C:\Users\jbloggs\liferay`.
