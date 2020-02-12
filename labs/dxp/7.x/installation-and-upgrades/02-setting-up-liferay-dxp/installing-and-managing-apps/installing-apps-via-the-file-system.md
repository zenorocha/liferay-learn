# Installing Apps via the File System

Installing apps via the file system is the best method for most administrators. Installing via the file system with a system restart is the optimal way to install apps in production-grade environments, as it avoids potential issues that may arise when deploying apps with auto deployment.

```important::
   For production-grade environments, always download apps using the [Marketplace website](https://web.liferay.com/marketplace). Never use the Control Panel for this purpose; apps purchased in the Control Panel download and automatically install using auto deployment.
```

Follow these steps to install an app with a server restart:

1. [Stop your DXP server](../../installing-liferay-dxp-on-premises/running-liferay-dxp-for-the-first-time.md#shutdown).

1. Copy your app file (LPKG, module JAR, or plugin WAR) to your `[Liferay Home]/deploy` folder. The [Liferay Home](../../14-reference/01-liferay-home.md) folder is typically the app server's parent folder. DXP deploys apps from the `[Liferay Home]/deploy` folder.

1. [Start your DXP server](../../installing-liferay-dxp-on-premises/running-liferay-dxp-for-the-first-time.md#startup).

The app file is copied from the `[Liferay Home]/deploy` folder to one an appropriate subfolder under `[Liferay Home]/osgi`:

- `marketplace`: Marketplace LPKG packages
- `modules`: OSGi module JAR files
- `war`: WAR files

DXP listens on those subfolders, processes the file (converting it to an OSGi bundle if it is a WAR or contains a WAR), and installs the OSGi bundle(s) to the OSGi container.

```note::
   You can also leverage auto deployment while installing apps via the file system, by omitting the steps to stop and start your server. This can be helpful to quickly install an app, but it should be avoided in production-grade environments.
```