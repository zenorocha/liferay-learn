# Managing Apps

The App Manager is a Control Panel screen where you can install and uninstall apps, and examine installed apps, modules, and OSGi components.

Access the App Manager by selecting *Control Panel* &rarr; *Apps* &rarr; *App Manager*. The App Manager lists installed apps and modules and provides app upload functionality.

## The App Listing

The *Filter and Order* menu filters items and orders them by category, status, or title. Click the up or down arrows to sort items in ascending or descending order, respectively. To search for an app or module, use the search bar. This is often the quickest way to find items.

![The App Manager manages apps, modules, and components installed in your DXP instance.](./managing-apps/images/01.png)

Each item listed in the table contains the item's description, version, and status. Here are the statuses:

* *Installed:* The item is installed to DXP.
* *Resolved:* The item's dependencies are active. Resolved items can typically be activated. Some items, however, can't be  activated and are intended to remain in the Resolved state (e.g., WSDD modules containing SOAP web services).
* *Active:* The item is running on DXP.

Clicking each item's Actions button (![Actions](./managing-apps/images/02.png)) brings up a menu in which you can activate, deactivate, or uninstall that item.

To view an item's contents, click its name in the table.

* If you click an app, the app's modules are listed.
* If you click a module, the module's OSGi components and portlets are listed.

The component/portlet level is the farthest you can go without getting into the source code. At any level in the App Manager, there's a link trail above the listing that shows the item's hierarchical context.

## Installing Apps

The App Manager is a convenient way to install a [downloaded app](./downloading-apps.md) from your local machine to a local or remote DXP server.

```important::
   For installing and uninstalling apps in production-grade environments, install apps [using server startup](./installing-apps-in-production.md) instead of using the App Manager.
```

Here are steps for using the App Manager to install an app:

1. Select *Upload* from the options button (![Options](./managing-apps/images/03.png)). The Upload dialog appears.

1. Browse to and select the app on your machine

1. Click *Install*.

The app installs via [auto deploy](./app-installation-strategies.md#auto-deployment). When the install completes, close the dialog and you're ready to roll!

## Disabling Apps

To disable an installed app, use an app blacklist to do so. This will mark the app as unavailable, so it is no longer used. See [Blacklisting Apps](./blacklisting-apps.md) for more information.

Congratulations! You can use the App Manager to examine and manage application deployments.

## Additional Information

* [Blacklisting Apps](./blacklisting-apps.md)

* [Blacklisting OSGi Components](./blacklisting-osgi-components.md)

* [Maintaining a Clustered Installation](../../10-maintaining-a-liferay-dxp-installation/10-maintaining-clusters/01-maintaining-clustered-installations.md)
