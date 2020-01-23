# Preparing a New Application Server for Liferay DXP

To upgrade your Liferay DXP database, prepare a new application server for hosting Liferay DXP. You'll use this server to run the data upgrade and then run Liferay DXP.

> **Note:** If you are upgrading from a version prior to DXP 7.0 and using a sharded environment, you must migrate your shards to multiple application servers, because sharding is no longer supported. Prepare one new application server for each shard.

## Install Liferay DXP 7.2

Install Liferay DXP 7.2 using a bundle or to an application server of choice. See the [Installation Overview](../installing-liferay-dxp-on-premises/02-installation-overview.md) for more information.

> **Warning:** Do not start your application server with your database yet. Wait until after you have completed the data upgrade to DXP 7.2.

## Install the Latest Upgrade Patch or Fix Pack
> Subscription Required

An *upgrade patch* contains the latest fix pack and hot fixes planned for the next service pack. Upgrade patches provide the latest fixes available for your data upgrade.

Get the latest fixes for Liferay DXP by requesting an upgrade patch. Request the patch in advance to ensure you will have it ready when you need it.

Install the upgrade patch (if you requested it from Liferay Support) or the [latest Fix Pack](https://help.liferay.com/hc/en-us/articles/360028810452-Patching-Liferay-DXP).

## Migrate Your OSGi Configurations (7.0+)

Copy any [OSGi configuration files](https://help.liferay.com/hc/en-us/articles/360029131651-Understanding-System-Configuration-Files) (i.e., `.config` files) to your new application server's `[LIFERAY_HOME]/osgi/configs` folder.

## Update Your Portal Properties

Update any portal properties files that you may have configured for DXP 7.2 (e.g., `portal-setup-wizard.properties` and `portal-ext.properties`).

For features that use OSGi Config Admin in DXP 7.2, you must [convert your properties to OSGi configurations](#convert-applicable-properties-to-osgi-configurations). As you do this, you must account for property changes in all versions of Liferay DXP since your current version up to and including 7.2.

### Migrating Existing Portal Properties

If you're coming from a version prior to Liferay Portal 6.2, start with these
property-related updates:

* If you're on Liferay Portal 6.1, [adapt your properties to the new defaults that Liferay Portal 6.2 introduced](https://help.liferay.com/hc/en-us/articles/360017903232-Upgrading-Liferay#review-the-liferay-62-properties-defaults).

* If you have a sharded environment, [configure your upgrade to generate a non-sharded environment](./97-upgrading-a-sharded-environment.md).

* Liferay's image sprite framework is deprecated as of 7.2 and is disabled by default. The framework requires scanning plugins for image sprites. If you don't use the framework, there's no need for it to scan for images sprites. If you use the framework yourself, enable it by overriding the default `sprite.enabled` portal property (new in 7.2) value with the following setting in your [`portal-ext.properties`](https://help.liferay.com/hc/en-us/articles/360028712292-Portal-Properties) file:

    ```properties
    sprite.enabled=true
    ```

> **Note:** You can build image sprites using any framework you like and deploy them in your plugins.

### Changes to Default Settings

As with most new versions of Liferay DXP, 7.2 includes changes to the default settings. If you rely on the defaults from your old version, you should review the changes and decide to keep the defaults from your old version or accept the defaults of the new.

No existing properties have changed between versions 7.1 and 7.2. However, here are some properties that have changed since version 6.2:

| **Portal Property** | **Old Default** | **Default in DXP 7.2** |
| --- | --- | --- |
| blogs.trackback.enabled | true | false |
| dl.file.entry.thumbnail.max.height | 128 | 300 |
| dl.file.entry.thumbnail.max.width | 128 | 300 |
| layout.set.prototype.propagate.logo | true | false |
| web.server.servlet.check.image.gallery | true | false |

The following properties have been removed:

```properties
organizations.children.types[location]
organizations.children.types[regular-organization]
organizations.country.enabled[location]
organizations.country.enabled[regular-organization]
organizations.country.required[location]
organizations.country.required[regular-organization]
organizations.rootable[location]
organizations.rootable[regular-organization]
organizations.types
users.image.check.token
```

The latest [portal properties reference](https://docs.liferay.com/dxp/portal/7.2-latest/propertiesdoc/portal.properties.html) provides property details and examples. Many properties are now replaced by OSGi configurations, which are accessible through the UI in [System Settings](https://help.liferay.com/hc/en-us/articles/360029131591-System-Settings).

### Convert Applicable Properties to OSGi Configurations

Properties in modularized features have changed and must now be deployed separately in [OSGi configuration files](https://help.liferay.com/hc/en-us/articles/360029131591-System-Settings#exporting-and-importing-configurations) (OSGi Config Admin).

For example, use these steps to create a `.config` file specifying a root file location for a Simple File Store or Advanced File Store:

1. Create a `.config` file named after your store implementation class.

    Simple File Store:
    `com.liferay.portal.store.file.system.configuration.FileSystemStoreConfiguration.config`

    Advanced File Store:
    `com.liferay.portal.store.file.system.configuration.AdvancedFileSystemStoreConfiguration.config`

1. Set the following `rootDir` property and replace `{document_library_path}` with your file store's path.

    ```properties
    rootDir="{document_library_path}"
    ```

1. Copy the `.config` file to your `[LIFERAY_HOME]/osgi/configs` folder.

> **Tip:** The Control Panel's _System Settings_ screens (under _Configuration_) are the most accurate way to create `.config` files. Use them to [export a screen's configuration](https://help.liferay.com/hc/en-us/articles/360029131591-System-Settings#exporting-and-importing-configurations) to a `.config` file.

#### Using Blade CLI to Find Migrated Properties

The [Blade CLI](https://help.liferay.com/hc/en-us/articles/360029147071-Blade-CLI) is a tool that can be used to analyze your `portal-ext.properties` file to check for removed properties, or properties that have migrated to OSGi configurations. It is helpful to use this tool when upgrading from older versions for this purpose.

The `blade upgradeProps` command is used in the following format:

```cmd
blade upgradeProps -p {old_liferay_home_path}/portal-ext.properties -d {7.2_liferay_home_path}
```

Running this command will provide the names of migrated (or removed) properties, as well as where they were migrated to. The command will provide output like the following:

```
2019-03-09 17:05:17.678 ERROR [main][VerifyProperties:161] Portal property "layout.first.pageable[link_to_layout]" is obsolete
2019-03-09 17:05:17.679 ERROR [main][VerifyProperties:136] Portal property "journal.article.check.interval" was modularized to com.liferay.journal.web as "check.interval"
```

## Update Your Database Driver

Install the recommended database driver and update your database connection driver specified in your `portal-ext.properties`. See the [Database Templates](../14-reference/05-database-templates.md) for more information.

## Configure Your Documents and Media File Store

General document store configuration (e.g., `dl.store.impl=[File Store Impl Class]`) continues to be done using `portal-ext.properties`. But here's what's changed for document storage:

* Store implementation class package names changed from `com.liferay.portlet.documentlibrary.store.*` in Liferay Portal 6.2 to `com.liferay.portal.store.*` in DXP 7.0+. Make sure your `portal-ext.properties` file sets `dl.store.impl` in one of these ways:

    ```properties
    dl.store.impl=com.liferay.portal.store.file.system.FileSystemStore
    dl.store.impl=com.liferay.portal.store.db.DBStore
    dl.store.impl=com.liferay.portal.store.file.system.AdvancedFileSystemStore
    dl.store.impl=com.liferay.portal.store.s3.S3Store
    ```

* JCR Store was deprecated in DXP 7.0. The [Document Repository Configuration](https://help.liferay.com/hc/en-us/articles/360028810112-Document-Repository-Configuration) documentation describes other store options. [Migrate to a supported document store](https://help.liferay.com/hc/en-us/articles/360029131691-Server-Administration) before upgrading your data.

* CMIS Store was deprecated in 7.0.10 Fix Pack 14 and was removed in DXP 7.2. The [Document Repository Configuration](https://help.liferay.com/hc/en-us/articles/360028810112-Document-Repository-Configuration) documentation describes other store options. [Migrate to a supported document store](https://help.liferay.com/hc/en-us/articles/360029131691-Server-Administration) before upgrading your data.

* Since DXP 7.0, document store type-specific configuration (e.g., specific to Simple File Store, Advanced File Store, S3, etc.) is done in the Control Panel at _Configuration_ → _System Settings_ → _File Storage_, or using OSGi configuration files (`.config` files). Type specific configuration is no longer done using `portal-ext.properties`.

The [Document Repository Configuration](https://help.liferay.com/hc/en-us/articles/360028810112-Document-Repository-Configuration) provides more document store configuration details.

## Configure Kerberos in Place of NTLM

If you're using NTLM to authenticate Microsoft Windows™ accounts with Liferay DXP, switch to using [Kerberos](https://help.liferay.com/hc/en-us/articles/360029031831-Authenticating-with-Kerberos). Security vulnerabilities persist with NTLM. NTLM has been deprecated and removed from the bundle, but you can still [build and deploy the module](https://github.com/liferay/liferay-portal/tree/7.2.x/modules/apps/portal-security-sso-ntlm).

## Additional Information

* [Blade CLI](https://help.liferay.com/hc/en-us/articles/360029147071-Blade-CLI)
* [Configuring the Data Upgrade Tool](./07-configuring-the-data-upgrade-tool)
