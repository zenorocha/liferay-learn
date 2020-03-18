# System Settings: Configuration Files

The [System Settings application](./system-settings.md) is convenient for making system-scoped configuration changes and setting default configurations for other [scopes](./system-settings-and-configuration-scope.md). The same configurations available in the user interface are available to customize via configuration file. You can use configuration files to transfer configurations from pre-production systems to production systems or between any other Liferay DXP systems, as long as the version is identical. Sometimes developers choose to distribute the default configuration for their applications via configuration file. Whatever the reason, configuration files offer another configuration approach.

Configuration files use the `.config` property value format defined by the [Apache Felix Configuration Admin framework](http://felix.apache.org/documentation/subprojects/apache-felix-config-admin.html). 

```important::
   Content generated using templates (e.g., FreeMarker templates and Application Display Templates) is cached. Cached content might not reflect configuration changes until the cache is invalidated (cleared). The Server Administration &rarr; Resources tab provides cache clearing options.
```

```note::
   The `.cfg` file format is common in OSGi environments, and it's a supported format, but `.config` files are preferable since they allow specifying a property value's type, and allow multi-valued properties. The syntax described in these articles is for `.config` files.
```

## Creating Configuration Files

System Settings provides an [*Export*](./system-settings.md#exporting-and-deploying-configurations) option that becomes available once you modify a configuration entry. Exporting is the best way to create `.config` files: you download a `.config` file containing the entry's settings in a `key=value` format, then modify or distribute as you have need. All available configuration keys and values are exported, even if only one value was changed.

You can export a single configuration entry or the entire set of modified configurations. 

Configuration files are named after the backing Java class. For example, the Journal Service entry, which backs Web Content functionality, has this file name: 

```bash
com.liferay.journal.configuration.JournalServiceConfiguration.config
```

![The Web Content System Settings entry has the back-end ID com.liferay.journal.configuration.JournalServiceConfiguration.](./system-settings-configuration-files/images/01.png)

The system enforces the configuration file's name. If you edit the name, the link to the configuration entry is broken and further customization will never take effect. The only exception is for [Factory Configuration](./factory-configuration.md), where a unique subname can be provided in some cases.

## Key/Value Syntax

The syntax for all keys and values in a `.config` file is the same: 

```properties
configurationName="value"
```

For single value configurations without special characters, that's all there is to know. Settings with multiple values and certain characters require slight modifications. 

### Multi-Value Settings

Configuration entries can have properties that accept multiple values. For example, a configuration property for specifying supported file extensions needs more than one value. Here's how to write a multi-value setting in a `.config` file: 

```properties
multiValueSetting=["Value 1","Value 2", ...]
```

Do not use a space character between values (after the comma). The property won't be loaded.

Open the Web Content category in System Settings (under the Content section), and select *Web Content* for the virtual instance scope. You'll see what looks like multiple single value entries for *Characters Blacklist*: 

![The Web Content System Settings entry has many Characters Blacklist fields.](./system-settings-configuration-files/images/02.png)

In the configuration file, this is represented by single key with an array of comma-separated values: 

```properties
charactersblacklist=["&","'","@","\\","]","}",":","\=",">","/","<","[","{","%","+","#","`","?","\"",";","*","~"]
```

### Escaping Characters

Double quotes (`"`) and equals signs (`=`) must be *escaped* in `.config` files.  Escaping is using another character to denote that a character shouldn't be used in its normal way. Since double quotes and equals signs are already used in `.config` files, escaping them tells the system not to read them the normal way, but to pass them through as part of the value. Use a backslash to escape characters in the `.config` file: 

```properties
charactersblacklist=["&","\"","\="]
```

This setting illustrates a multi-value setting with a regular, unescaped character (`&`), and two escaped ones (`\"` and `\=`). 

Along with the mandatory escaping of double quotes and equals characters, it's beneficial to escape spaces inside values to avoid problems. In this example, a backslash is used before each space character to ensure it's read and processed properly: 

```properties
blacklistBundleSymbolicNames=["Liferay\ Marketplace","Liferay\ Sharepoint\ Connector"]
```

If you don't escape spaces yourself, the system adds the backslash for you after deployment. 

## Typed Values

The `.config` file format supports specifying the type of a configuration value by inserting a special type marker character. Because the system already knows the correct type for each configuration property, the type characters are only useful for informational purposes. For example, a configuration with a boolean type has *B* just before the value to mark it as a boolean type:

```properties
addDefaultStructures=B"true"
```

If you see type markers in `.config` files, you can safely ignore them. The example included above functions identically without the type marker: 

```properties
addDefaultStructures="true"
```

## Deploying a Configuration File

Once you have a configuration file, deploy it. It's registered and the targeted configuration values are updated automatically. 

To deploy the `.config` file, place it in your [Liferay Home's](https://help.liferay.com/hc/en-us/articles/360028712272-Liferay-Home) `osgi/configs` folder. To change the configuration further, you can edit the `.config` file directly or use System Settings. 

## Configuration Files and Clustering

In a clustered environment, each node needs the same configuration values for each entry. For example, all nodes should use the same Blogs configuration settings. To accomplish this, deploy a `.config` file. For transparency and maintainability, deploy the `.config` file to all nodes in the cluster. However, an internal system applies the change to all nodes in the cluster even if the configuration file is only deployed to a single node.

```important::
   If storing your Liferay DXP configuration (e.g., Liferay Home) in a source control system, make sure to include the OSGi configuration files (.config files).
```
