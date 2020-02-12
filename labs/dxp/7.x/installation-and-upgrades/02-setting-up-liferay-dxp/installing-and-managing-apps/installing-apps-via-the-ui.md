# Installing Apps via the UI

Installing apps via the UI leverages auto deployment; the app will install (from the LPKG, module JAR, or plugin WAR) while the DXP server is running. Auto deployment copies the app to the appropriate subfolder in `[Liferay Home]/osgi`, converts it to an OSGi bundle (LPKGs and WARs need converting), and deploys the bundle to the OSGi container.

```warning::
   LPKG packages that have the restart-required=true property in their liferay-marketplace.properties file (inside the LPKG file) require restarting the server to complete installation. If you auto deploy such an LPKG package, the installation hangs and reports a message like this: Processing xxx.lpkg
```

```important::
   If you are installing to a production-grade environment, you should instead install via the file system with a server restart. See `Installing Apps via the File System <./installing-apps-via-the-file-system.md>` for more information.
```

The sections below describe the interfaces you can  use to install apps via the UI with auto deployment.

## Marketplace via the Control Panel

The DXP Control Panel accesses the Marketplace. You browse the Marketplace the same way you would from the Marketplace website. Purchasing an app in the Control Panel downloads the app and installs it to the DXP instance automatically. See [Purchasing Apps on Liferay Marpletace](./purchasing-apps-on-liferay-marketplace.md) for more information.

``` note::
   If you are using the Marketplace screen to install your apps, the easiest way to uninstall them would be through the Purchased Apps screen in the Control Panel.
```

## Purchased Apps Screen

The Purchased page in the Control Panel at *Apps* &rarr; *Purchased* lists apps that you've previously purchased. Apps that aren't installed have an *Install* button for installing the app on the DXP instance.

![The Purchased Apps screen as it appears in the Control Panel.])(./installing-apps-via-the-ui/images/01.png)

## Application Manager

In DXP's App Manager, you can upload and install Marketplace apps. See [Managing Apps](./managing-apps.md) for more information.