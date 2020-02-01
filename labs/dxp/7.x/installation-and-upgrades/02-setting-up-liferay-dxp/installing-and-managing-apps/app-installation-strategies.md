# App Installation Strategies 

Liferay provides several ways to install Marketplace apps. Each way (strategy) has benefits for particular server environments and situations. Understanding app deployment and your DXP server environment is essential to choosing an installation strategy that's right for you. 

The strategies are introduced in the context of the app deployment mechanism they use. For your convenience, we provide an [installation strategy comparison table](#installation-strategy-comparison) too.

## Understanding Deployment

Marketplace apps can be deployed on server startup or while the server is running (aka auto deployment). Auto deployment is convenient because it doesn't require shutting down the server and it can be done via DXP's UI. However, auto deploying an app that is not designed for auto deployment can cause class loading issues and memory leaks. The safest way to deploy an app is at server startup.

### Deployment at Server Startup

Deployment at server startup is the recommended way to deploy apps in production or production-grade environments. It involves stopping the server (if it's currently running), installing the app, and restarting the server. It's the safest way to deploy and app, especially if the app isn't designed for auto deployment. For more details on deploying in production-grade environments, see [Installing Apps in Production](./installing-apps-in-production.md).

If stopping the server is infeasible of if you're using your DXP instance for informal purposes, you may want to leverage auto deployment.

### Auto Deployment

Auto deployment is deploying an app (LPKG, module JAR, or plugin WAR) or [OSGi `.config` file](https://help.liferay.com/hc/en-us/articles/360029131591-System-Settings#exporting-and-importing-configurations) while the DXP server is running.

Auto deployment copies the app (or [Configuration file](https://help.liferay.com/hc/en-us/articles/360029131591-System-Settings#exporting-and-importing-configurations)) to the appropriate subfolder in `[Liferay Home]/osgi`, converts it to an OSGi bundle (LPKGs and WARs need converting), and deploys the bundle to the OSGi container. By default, the following `[Liferay Home]/osgi` subfolders are used per type:

- `marketplace`: Marketplace LPKG packages
- `modules`: OSGi module JAR files
- `war`: WAR files
- `configs`: [Configuration files](https://help.liferay.com/hc/en-us/articles/360029131591-System-Settings#exporting-and-importing-configurations)

```important::
   Avoid repeatedly auto deploying new versions of apps that aren't designed for auto deployment.
```

```warning::
   LPKG packages that have the restart-required=true property in their liferay-marketplace.properties file (inside the LPKG file) require restarting the server to complete installation. If you inadvertently auto deploy such an LPKG package, the installation hangs and reports a message like this: Processing xxx.lpkg
```

## Installation Strategies

### Server Startup 

Installing apps on Server Startup involves shutting down the server (if it's running), copying the app to the `[Liferay Home]/deploy` folder, and starting the server. It's the recommended way to install apps in production-grade environments. For more details, see [Installing Apps in Production](./installing-apps-in-production.md).

### Strategies that Use Auto Deployment

Auto deployment is a convenient way to deploy apps and is used by several installation strategies.

#### Marketplace via the Control Panel

The DXP Control Panel accesses the Marketplace. You browse the Marketplace the same way you would from the Marketplace website. Purchasing an app in the Control Panel downloads the app and installs it to the DXP instance automatically. See [Using the Liferay Marketplace]((../using-the-liferay-marketplace.md)) for more information.

#### Purchased Apps Screen

The Purchased page in the Control Panel at *Apps* &rarr; *Purchased* lists apps that you've previously purchased. Apps that aren't installed have an *Install* button for installing the app on the DXP instance.

#### Application Manager

In DXP's App Manager, you can upload and install Marketplace apps. See [Managing Apps](./managing-apps.md) for details.

#### File System

To install an app using the DXP server file system, copy the app file to your DXP server's `[Liferay Home]/deploy` folder. DXP copies the app file to the appropriate subfolder under `[Liferay Home]/osgi` and deploys the app.

## Installation Strategy Comparison

The following table compares all of the installation strategies by listing their benefits, requirements, and limitations.

| Installation Strategy | Benefits | Requirements / Limitations | Uninstallation |
| :-------------------- | :------- | :------------------------- | :--------------- |
| [Server startup](#deployment-at-server-startup) |* Maximum stability<br/>* No UI needed | * Server shutdown required<br/>* File system access required | Remove the app from the `[Liferay Home]/osgi` subfolder |
| [Marketplace via the Control Panel](../using-the-liferay-marketplace.md) | * Convenience<br/>* Automatic installation on app purchase<br/> | * Uses auto deploy (1)<br/>* You must be ready for install on app purchase | Purchased Apps screen |
| [Purchased Apps Screen](#purchased-apps-screen) | * User interface<br/>* Install purchased apps when you want | Uses auto deploy (1) | Purchased Apps screen |
| [App Manager](./managing-apps.md) | * User interface<br/>* Install purchased apps when you want | Uses auto deploy (1) | [Blacklisting the app](./blacklisting-apps.md) |
| [File system](#file-system) | * No UI needed | * Uses auto deploy (1)<br/>* File system access required | Remove the app from the `[Liferay Home]/osgi` subfolder |

(1) Auto deploying apps that aren't designed for auto deploy may cause class loading issues or memory leaks.

## Downloading Apps

Unless you want to use [Marketplace via the Control Panel](../using-the-liferay-marketplace.md) to download and install an app automatically on purchase (not recommended in production-grade environments), download the app from the [Marketplace website](https://web.liferay.com/marketplace) so that you can deploy it using one of the other installation strategies. See [Downloading Apps](./downloading-apps.md) for details.

## Additional Information

Now that you have a basic understanding of the app installation strategies, you can explore ones that fit your projects.

* [Using Server Startup](./installing-apps-in-production.md)
* [App Manager](./managing-apps.md)
* [Marketplace via the Control Panel](../using-the-liferay-marketplace.md)

## Related Topics

* [Downloading Apps](./downloading-apps.md)
* [Configuring Portlets, Themes, and Layout Templates](./configuring-portlets-themes-and-layout-templates.md)
* [Maintaining a Clustered Installation](../../10-maintaining-a-liferay-dxp-installation/10-maintaining-clusters/01-maintaining-clustered-installations.md)
* [Blacklisting Apps](./blacklisting-apps.md)
* [Blacklisting OSGi Components](./blacklisting-osgi-components.md)
* [Renewing Apps](./renewing-apps.md)
