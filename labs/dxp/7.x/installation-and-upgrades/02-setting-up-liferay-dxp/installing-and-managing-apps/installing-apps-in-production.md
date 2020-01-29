# Installing Apps In Production

If you're installing an app to a production-grade environment, system stability is paramount. For this reason, deploying apps at server startup is recommended. These instructions guide you through the recommended way to download and install an app for a production-grade environment.

As a background, read [App Installation Strategies](./app-installation-strategies.md).

## Downloading Apps

For production-grade environments, always download apps using the [Marketplace website](https://web.liferay.com/marketplace).

```warning::
   In production, NEVER use Marketplace via the Control Panel---apps purchased in the Control Panel download and install using auto deploy automatically. Apps that aren't designed for auto deployment can cause class loading issues and memory leaks.
```

## Installing Apps Using Server Startup

Here are the steps for deploying an app using server startup:

1. [Stop your DXP server](../../installing-liferay-dxp-on-premises/running-liferay-dxp-for-the-first-time.md#shutdown).

1. Copy your app file (LPKG, module JAR, or plugin WAR) to your `[Liferay Home]/deploy` folder. The [Liferay Home](../../14-reference/01-liferay-home.md) folder is typically the app server's parent folder. DXP deploys apps from the `[Liferay Home]/deploy` folder.

1. [Start your DXP server](../../installing-liferay-dxp-on-premises/running-liferay-dxp-for-the-first-time.md#startup).

The app file is copied from the `[Liferay Home]/deploy` folder to one an appropriate subfolder under `[Liferay Home]/osgi`:

- `marketplace`: Marketplace LPKG packages
- `modules`: OSGi module JAR files
- `war`: WAR files

DXP listens on those subfolders, processes the file (converting it to an OSGi bundle if it is a WAR or contains a WAR), and installs the OSGi bundle(s) to the OSGi container.

```note::
   [OSGi component configurations](https://help.liferay.com/hc/en-us/articles/360029131591-System-Settings#exporting-and-importing-configurations) are also best installed while the DXP server is stopped. If you're installing a component configuration, copy its `.config` file to your `[Liferay Home]/osgi/configs` folder before starting the server.
```

## Installing Apps in Clustered Environments

If you're working in a clustered environment, see [Maintaining Clustered Installations](../../10-maintaining-clusters/01-maintaining-clustered-installations.md).
