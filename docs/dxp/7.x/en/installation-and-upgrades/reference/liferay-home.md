# Liferay Home

*Liferay Home* is the folder from which Liferay DXP launches applications, reads and applies configurations, loads JAR files, generates logs, and more.

Liferay Home's location varies depending on installation type:

* *In a DXP bundle*, Liferay Home is the installation's top-level folder and it contains the application server.
* *In an installation on an application server*, the Liferay Home folder varies by application server. If you're installing on an application server, please refer to the article covering that app server (e.g., *Installing DXP on [app server]*) for the Liferay Home location.

## Liferay Home Structure

DXP installations contain this folder structure regardless of application server:

```
[LIFERAY_HOME]
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
    │   └── static
    │   └── war
    ├── patching-tool
    ├── tools
    └── work
```

## Liferay Home Reference

Here is a breakdown of each folder with a brief description of its purpose:

* `data` (if HSQL database is selected): Stores an embedded HSQL database, DXP's file repository, and search indexes. The embedded HSQL database is configured by default, but it's intended for demonstration and trial purposes only. The [portal property `jdbc.default.url`](https://docs.liferay.com/dxp/portal/7.2-latest/propertiesdoc/portal.properties.html#JDBC) sets the Hypersonic embedded HSQL database location.
* `deploy`: By default, this folder auto-deploys plugins. Auto-deploy supports application `.lpkg` files from Liferay Marketplace, plugin `.war` files, and plugin `.jar` files. You can configure an alternative path for the `deploy` folder by setting the [portal property `auto.deploy.deploy.dir`](https://docs.liferay.com/dxp/portal/7.2-latest/propertiesdoc/portal.properties.html#Auto%20Deploy).
* `license`: DXP's copyright and version files are here.
* `logs`: DXP creates this folder and writes log files here. Examine them as you diagnose problems. `portal-impl.jar`'s `portal-impl/src/META-INF/portal-log4j.xml` file sets the log file location. To override the log file location, you must [use an `ext-impl/src/META-INF/portal-log4j-ext.xml` file in an Ext plugin](https://help.liferay.com/hc/articles/360029030791-Customizing-Core-Functionality-with-Ext).
* `osgi`: All the JAR files and a few configuration files for the OSGi runtime belong in this folder. The [portal property `module.framework.base.dir`](https://docs.liferay.com/dxp/portal/7.2-latest/propertiesdoc/portal.properties.html#Module%20Framework) sets the OSGi folder location. Here are its subfolders:
  * `configs`: Component [configuration files](../../system-administration/system-settings/system-settings.md#exporting-and-deploying-configurations).
  * `core`: DXP's core modules.
  * `marketplace`: Marketplace applications and application suites.
  * `modules`: Modules you've deployed.
  * `portal`: DXP's non-core modules.
  * `state`: Contains OSGi internal state files for such things as OSGi bundle installation, bundle storage, and more.
  * `static`: Deploy customizations as JAR files here.
  * `war`: WAR plugins you've deployed.
* `patching-tool`: (Subscription) This folder holds patches and utilities for installing the patches.
* `tools`: For the database upgrade tool and target platform indexer.
* `work`: Module Jasper work files.

```note::
   If DXP cannot create resources in the Liferay Home folder or when DXP runs on certain application servers, it creates a folder called `liferay` in the home folder of the operating system user that is running DXP. In this case, that ``liferay`` folder becomes the Liferay Home. For example, if your operating system user name is *jbloggs*, the `liferay` folder path is ``/home/jbloggs/liferay`` or ``C:\Users\jbloggs\liferay``.
```
