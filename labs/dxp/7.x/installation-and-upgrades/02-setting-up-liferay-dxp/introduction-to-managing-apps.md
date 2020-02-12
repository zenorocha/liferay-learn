# Introduction to Managing Apps

You can add all kinds of functionality to your DXP installation by purchasing and installing apps. Apps are available in the [Liferay Marketplace](./installing-and-managing-apps/using-the-liferay-marketplace.md), and tools such as the [App Manager](./installing-and-managing-apps/managing-apps.md) are also available to help you manage apps in your installation.

## Liferay Marketplace

Liferay Marketplace is a hub for sharing, browsing, and downloading apps. It can be used to browse or purchase apps to quickly add them to your installation. See [Using the Liferay Marketplace](./installing-and-managing-apps/using-the-liferay-marketplace.md) for more information.

![Use the Liferay Marketplace to quickly purchase and install apps to your DXP installation.](./introduction-to-managing-apps/images/01.png)

Once you have purchased an app, there are also a couple of options for how to download it to your installation. See [Downloading Apps](./installing-and-managing-apps/downloading-apps.md) for more information.

## Installing Apps

Apps can be installed to your DXP Installation either through the UI or through the file system. You can [use the file system](./installing-and-managing-apps/installing-apps-via-the-file-system.md) to drop an LPKG file into your deployment directory, either with a server restart or using auto deployment. Note that you should install apps through the file system with a server restart in production-grade environments.

You can also use the UI to install apps by using auto deployment, either through [the Marketplace plugin](./installing-and-managing-apps/using-the-liferay-marketplace.md), the Purchased Apps screen in the Control Panel, or the [App Manager](./installing-and-managing-apps/managing-apps.md). See [Installing Apps via the UI](./installing-apps-via-the-ui.md) for an overview of this method of installation.

## App Management

Once apps have been installed to your instance, you can manage them from there using the [App Manager](./installing-and-managing-apps/managing-apps.md) in the Control Panel. The App Manager provides an interface to browse, install, and uninstall all currently available apps.

### Blacklisting Apps and OSGi Components

The blacklisting feature allows you to designate apps or components as unavailable so they will not be used in your installation. See [Blacklisting Apps](./installing-and-managing-apps/blacklisting-apps.md) or [Blacklisting OSGi Components](./installing-and-managing-apps/blacklisting-osgi-components.md) for more information.