# Migrating Configurations and Properties

Your current DXP installation's OSGi configurations (7.0+) and properties (such as [portal properties](../../reference/portal-properties.md) and [system properties](../../reference/system-properties.md)) set up your DXP instance to fit your needs. To use these settings in your new DXP instance, you must migrate them to your new Liferay Home and update them. 

## Overview

* [Migrating Liferay Home](#migrating-liferay-home)
* [Updating Settings for the Database Upgrade](#updating-settings-used-by-the-database-upgrade)
* [Migrating Portal Properties](#migrating-portal-properties)

## Migrating Liferay Home

Set up a new [Liferay Home](../../reference/liferay-home.md) folder with the contents of your current Liferay Home, including your portal properties (e.g., `portal-ext.properties`) and OSGi configurations (`.config` files).

```bash
cp /old-version/liferay-home/ /new-version/liferay-home/
```

Alternatively if your Liferay Home is in source control, create a new branch for your new DXP instance to use.

```bash
git checkout -b new-version
```

## Updating Settings For the Database Upgrade

Upgrade processes in DXP and in some Marketplace apps use portal properties and OSGi configurations. Upgrade processes in your custom code may also require property updates and configuration updates. These settings and updates must be in place _before_ the database upgrade. Other updates can be done after the database upgrade.

Here are the settings updates DXP upgrade processes require:

* [Database driver](#database-driver)
* Document library store implementation name (See [Updating the File Store](./updating-the-file-store#updating-the-store implementation-class-name))

```important::
   Check your Marketplace apps and custom code for settings updates they require.
```

### Database Drivers

Check your database vendor documentation for the recommended database driver. If a new driver is recommended, replace the existing driver JAR file and update the `jdbc.default.driverClassName` property in your `portal-ext.properties` file with the new driver class name. 

MySQL example:

```properties 
jdbc.default.driverClassName=com.mysql.cj.jdbc.Driver
```

See the [Database Templates](../../reference/database-templates.md) for more driver examples.

## Migrating Portal Properties

The properties discussed here can be updated after database upgrade. Migrating properties involves these things:

* Special property migration considerations
* Using [Blade CLI](https://help.liferay.com/hc/en-us/articles/360029147071-Blade-CLI) to report property changes 
* Converting properties to OSGi configurations 

### Special Property Migration Considerations 

There are resources for migrating properties related to specific environments, Liferay versions, and features. They're called out here for convenience.

* Updates to file store settings are discussed in [Updating the File Store](./updating-the-file-store.md).

* If you're on Liferay Portal 6.1 or earlier, [adapt your properties to the new defaults that Liferay Portal 6.2 introduced](https://help.liferay.com/hc/en-us/articles/360017903232-Upgrading-Liferay#review-the-liferay-62-properties-defaults).

* If you have a sharded environment, [configure your upgrade to generate a non-sharded environment](../other-upgrade-scenarios/upgrading-a-sharded-environment.md).

* Examine the default settings changes in 7.0+ [here](../reference/changes-to-default-settings.md).

* Liferay's image sprite framework is deprecated as of 7.2 and is disabled by default. The framework requires scanning plugins for image sprites. If you don't use the framework, there's no need for it to scan for images sprites. If you use the framework yourself, enable it by overriding the default `sprite.enabled` portal property (since 7.2) value with the following setting in your [`portal-ext.properties`](../../reference/portal-properties.md) file:

    ```properties
    sprite.enabled=true
    ```

```note::
   You can build image sprites using any framework you like and deploy them in your plugins.
```

### Using Blade CLI to Report Incompatible Properties

The [Blade CLI](https://help.liferay.com/hc/en-us/articles/360029147071-Blade-CLI) tool's `upgradeProps` command reports changes between portal properties files. The tool reports these types of changes.

* Properties that cause exceptions, if not updated.
* Properties moved to a module `portal.properties` file.
* Properties moved to OSGi configuration.
* Properties not found in the new DXP version.

In many cases, the `upgradeProps` command explains the required update or references more information on the property change.

The `blade upgradeProps` command format:

```bash
blade upgradeProps -p {old_liferay_home_path}/portal-ext.properties -d {new_liferay_home_path}
```

Here are example output samples from running the `blade upgradeProps` command:

```
Checking the location for old properties in the new version
-----------------------------------------------------------
Following portal properties present an exception:
        asset.categories.navigation.display.templates.config has been removed.  Overwrite the method in the ADT handler. Se
e LPS-67466
        asset.publisher.display.templates.config has been removed.  Overwrite the method in the ADT handler. See LPS-67466
        ...
        
Some properties have been moved to a module portlet.properties:
        asset.publisher.search.with.index can match with the following portlet properties:
                search.with.database from osgi/marketplace/Liferay CE Web Experience - Liferay CE Asset - Impl.lpkg/com.lif
eray.asset.browser.web-4.0.4.jar/portlet.properties
        dynamic.data.lists.error.template[ftl] can match with the following portlet properties:
                dynamic.data.lists.error.template[ftl] from osgi/marketplace/Liferay CE Forms and Workflow - Liferay CE Dyn
amic Data Lists - Impl.lpkg/com.liferay.dynamic.data.lists.web-5.0.4.jar/portlet.properties
        ...

Properties moved to OSGI configuration:
        asset.publisher.check.interval can match with the following OSGI properties:
                checkInterval from com.liferay.asset.publisher.web.internal.configuration.AssetPublisherWebConfiguration
        asset.publisher.display.style.default can match with the following OSGI properties:
                defaultDisplayStyle from com.liferay.asset.publisher.web.internal.configuration.AssetPublisherPortletInstanceConfiguration
        ...

We have not found a new property for the following old properties (check if you still need them or check the documentation to find a replacement):
        admin.email.password.sent.body
        admin.email.password.sent.subject
        ...
```

### Converting Properties to OSGi Configurations

Properties in modularized features have changed and are now deployed in [OSGi configuration files](https://help.liferay.com/hc/en-us/articles/360029131591-System-Settings#exporting-and-importing-configurations) (OSGi Config Admin).

For example, in 6.2, the Simple File Store used this portal property to specify the store root directory:

```properties
dl.store.file.system.root.dir=${liferay.home}/data/document_library
```

Now the store is configured in a `.config` file called `com.liferay.portal.store.file.system.configuration.FileSystemStoreConfiguration.config` that specifies the root directory with a setting like this:

```properties
rootDir="{document_library_path}"
```

Put the `.config` files in a folder called `[Liferay Home]/osgi/configs`.

```tip::
   The Control Panel's _System Settings_ screens (under _Configuration_) manage the OSGi Config Admin values. These screens are the most accurate way to create `.config` files. Find the screen that configures the feature you want to configure, click _Save_, and then use the options button to `export the screen's configuration <https://help.liferay.com/hc/en-us/articles/360029131591-System-Settings#exporting-and-importing-configurations>`_ to a `.config` file.
```

## Next Steps

Your Liferay settings are ready to use in your new DXP instance. Next, [update the file store](./updating-the-file-store.md).