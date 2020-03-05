# Migrating Configurations and Properties

Your current DXP installation's OSGi configurations (7.0+) and properties (such as [portal properties](../../reference/portal-properties.md) and [system properties](../../reference/system-properties.md)) set up your DXP instance to fit your needs. To use these settings in your new DXP instance, you must migrate them to your new Liferay Home and update them. 

## Overview

* [Migrating Liferay Home](#migrating-liferay-home)
* [Updating Settings Used by the Database Upgrade](#updating-settings-used-by-the-database-upgrade)
* [Updating Settings for Run Time](#updating-settings-for-run-time)

## Migrating Liferay Home

Set up a new [Liferay Home](../../reference/liferay-home.md) folder with the contents of your current Liferay Home, including your portal properties (e.g., `portal-ext.properties`) and OSGi configurations (`.config` files).

```bash
cp /old-version/liferay-home/ /new-version/liferay-home/
```

Alternatively if your Liferay Home is in source control, create a new branch for your new DXP instance to use.

```bash
git checkout -b new-version
```

## Updating Settings Used by the Database Upgrade

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

## Updating Settings for Run Time

The properties discussed here can be updated after database upgrade. Here are the kinds of property changes you'll see:

* Property updates: Property removal/replacement and new default values
* Properties converted to an OSGi configurations

```note:
   Updates to file store settings are discussed in` Updating the File Store <./updating-the-file-store.md>`_.
```

### Property Updates

New versions of Liferay introduce new and modified properties.

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

## Using Blade CLI to Report Incompatible Properties

The [Blade CLI](https://help.liferay.com/hc/en-us/articles/360029147071-Blade-CLI) tool's `upgradeProps` command checks your portal properties file for removed properties and properties that have migrated to OSGi configurations.

The `blade upgradeProps` command is used in the following format:

```bash
blade upgradeProps -p {old_liferay_home_path}/portal-ext.properties -d {new_liferay_home_path}
```

This command reports the names of modified properties, as well as how they must be migrated to the new DXP version. Here is a command output example:

```
ERROR [main][VerifyProperties:161] Portal property "layout.first.pageable[link_to_layout]" is obsolete
ERROR [main][VerifyProperties:136] Portal property "journal.article.check.interval" was modularized to com.liferay.journal.web as "check.interval"
```

## Next Steps

Your Liferay settings are ready to use in your new DXP instance. Next, [update the file store](./updating-the-file-store.md).