# Blacklisting Apps

The *bundle blacklist* is a convenient way to manage multiple apps, OSGi bundles (modules), and plugin WAR installations. The list is an [OSGi configuration](https://help.liferay.com/hc/en-us/articles/360029131591-System-Settings#exporting-and-importing-configurations) that DXP uses to uninstall apps. You can set the list in the Control Panel or by using a `.config` file. It saves you the trouble of managing app, module, and plugin installations individually with the [Application Manager](./managing-apps.md) or [Gogo shell](https://help.liferay.com/hc/en-us/articles/360029070351-Using-the-Felix-Gogo-Shell).

The blacklist can be exported from the Control Panel, so that you have the correct file name and syntax. Modifying the file and deploy it to DXP has these additional effects:

- Persists the changes across DXP server startups
- Propagates the changes from a local cluster node to all the other nodes.

Blacklisting modules using the UI and a config file is demonstrated. 

## Blacklisting

DXP removes any installed app, module, or plugin on the blacklist. While they're blacklisted they can't be installed. The log reports each uninstallation.

Follow these steps to blacklist an app, module, and plugin:

1.  In the Control Panel, navigate to *Configuration* &rarr; *System Settings* &rarr; *Module Container*. The Bundle Blacklist screen appears.

1.  In the Bundle Blacklist screen, add the bundle symbolic names (see the table below) for the [module](https://help.liferay.com/hc/en-us/articles/360035467532-OSGi-and-Modularity#modules) JARs, LPKG files, or WARs to uninstall. Click the *Save* button when you're finished. DXP uninstalls the blacklisted modules immediately.
 
    ![Figure 1: This blacklist uninstalls the `com.liferay.docs.greeting.api` module, Liferay Marketplace app LPKG, and `classic-theme` plugin WAR.](./blacklisting-apps/images/02.png)

1.  To export the blacklist, click its Actions button (![Actions](./blacklisting-apps/images/03.png)) and then click *Export*. The blacklist config file then downloads (`com.liferay.portal.bundle.blacklist.internal.BundleBlacklistConfiguration.config`). Here are file contents from exporting the example blacklist:

    ```properties
    blacklistBundleSymbolicNames=["com.liferay.docs.greeting.api","Liferay\ Marketplace","classic-theme"]
    ```

1.  Add the bundle symbolic names of any apps, modules, or plugins not already listed that you want to uninstall and prevent from installing in subsequent DXP server startups.

    **Important**: Configuration values can't contain extra spaces. Extra spaces can short-circuit lists or invalidate the configuration entry.

1.  To deploy the configuration file, copy it into the folder `[Liferay Home]/osgi/configs`. The [Liferay Home](../../14-reference/01-liferay-home.md) folder is typically the app server's parent folder.

**Note**: Blacklisting an LPKG uninstalls all of its internal modules.

**Blacklist Bundle Symbolic Names**

| Type       | Bundle Symbolic Name |
| ---------- | --------------|
| LPKG       | LPKG file name without the `.lpkg` extension |
| Bundle/Module JAR | `Bundle-SymbolicName` in `bnd.bnd` or `MANIFEST.MF` file |
| WAR        | Servlet context name in `liferay-plugin-package.properties` file or the WAR file name (minus `.war`), if there is no servlet context name property |

## Reinstalling Blacklisted Items

To reinstall blacklisted items, follow these steps:

1.  Open the configuration file `com.liferay.portal.bundle.blacklist.internal.BundleBlacklistConfiguration.config`.

1.  Remove the symbolic names of the LPKGs, module JARs, or WARs from the `blacklistBundleSymbolicNames` list and save the file.

To reinstall *all* the blacklisted items execute one of these options:

- Remove the configuration file.
- Uninstall the module `com.liferay.portal.bundle.blacklist` using the [Application Manager](./managing-apps.md) or [Felix Gogo Shell](https://help.liferay.com/hc/en-us/articles/360029070351-Using-the-Felix-Gogo-Shell).

```tip::
   To temporarily reinstall an item that's been blacklisted, you can remove its symbolic name from the Bundle Blacklist module in *System Settings* and click the *Update* button. If you're using a blacklist config file (in the `[Liferay Home]/osgi/configs` folder) and want the item to install on subsequent server startup, make sure to remove the item's symbolic name from the file.
```

The log reports each item installation.

Congratulations! Now you can manage multiple app, module, and plugin installations using a simple list.

## Additional Information

[Managing Apps](./managing-apps.md)

[Using the Felix Gogo shell](https://help.liferay.com/hc/en-us/articles/360029070351-Using-the-Felix-Gogo-Shell)

[Blacklisting OSGi Components](./blacklisting-osgi-components.md)

[Configuring Portlets, Themes, and Layout Templates](./configuring-portlets-themes-and-layout-templates.md)
