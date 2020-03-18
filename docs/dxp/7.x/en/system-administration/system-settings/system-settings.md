# System Settings

The System Settings application in Liferay DXP serves as the centralized location for System Scoped configurations. Open it from Control Panel &rarr; Configuration &rarr; System Settings.

System Settings is organized into sections (for example, Content and Data) and categories (for example, Workflow) based on the functionality being configured. There's also a Search bar to make finding configuration entries easier. Search for the name of a specific configuration entry, or even a specific field within an entry.

![This script styles its output using HTML.](./system-settings/images/01.png)

Navigate to the configuration you need by finding a section (e.g., Content and Data) of interest, then browse its categories (e.g., Workflow).
![This script styles its output using HTML.](./system-settings/images/01.png)

If you can't locate a System Settings entry by browsing, search for it using the search bar.
![This script styles its output using HTML.](./system-settings/images/01.png)

```note::
   Other system-scoped configurations can be made in properties files and in the Server Administration application. However, expect to find these increasingly within System Settings.
```

Liferay DXP is composed of many applications. The applications and their services can be configurable at several scopes, as defined by the application's developers. Any configuration made in System Settings serves for making system scoped configuration changes or setting system-wide default configurations that can be overridden at another scope.

## Editing System Configurations

Once you find the configuration to modify,

1. Open the configuration form for the entry.

1. Make any changes you'd like, then click *Save*. Your configuration changes are saved and applied throughout the system. 

```important::
   Content generated using templates (e.g., FreeMarker templates and Application Display Templates) is cached. Cached content might not reflect configuration changes until the cache is invalidated (cleared). The [Server Administration &rarr; Resources tab](/docs/7-2/user/-/knowledge_base/u/server-administration-resources) provides cache clearing options.
```

![After saving changes to a configuration, the actions Reset Default Values and Export are available for it.](./system-settings/images/system-settings-actions.png)

## Resetting a System Settings Entry

If you make some regrettable configuration decisions and can't recall exactly what you did, start over by clicking the actions button (![Actions](../../images/icon-actions.png)), then clicking *Reset Default Values*. 

## Exporting and Importing Configurations

What if you change many default configurations in System Settings, and then need to make the same changes in another installation? Don't worry, you don't need to remember and duplicate every choice you made. The System Settings application lets you export configurations, either a single configuration entry or all the entries that you changed. The exported files are deployable to any other installation of the same version.

To export a single entry's configurations, click the actions button (![Actions](../../images/icon-actions.png)), then click *Export*. A `.config` file containing your configuration downloads to your system. 

To export all the configuration changes you've made in System Settings, click the System Settings options button (![Options](../../images/icon-options.png)), then click *Export All Settings*. The `.config` files for all the entries you edited then download in a ZIP file. 

To make these configurations active in the destination system, unzip and place the `.config` files in the `[Liferay_Home]/osgi/configs` folder. 

If you aren't sure what a configuration option does, check the documentation for the feature you're interested in. 
