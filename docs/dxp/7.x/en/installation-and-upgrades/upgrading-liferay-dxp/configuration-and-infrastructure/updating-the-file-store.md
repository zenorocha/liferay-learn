# Updating the File Store

File store options and configuration values changed in Liferay DXP 7.0. If you're on 7.0 or earlier and are affected by these changes, you must update your file store _before_ upgrading your DXP database.

This table lists the required updates per Liferay version.

| Current Liferay Version | Required Updates |
| :---------------------- | :--------------- |
| Liferay DXP 7.0 | 1. Migrate from CMIS Store and JCR Store. |
| Liferay Portal 6.2 and earlier | 1. Update your store implementation class name.<br>2. Migrate from CMIS Store and JCR Store.<br>3. Configure the file store in System Settings. |

The following sections explain how to update your file store.

## Updating the Store Implementation Class Name

The store implementation class package names changed from `com.liferay.portlet.documentlibrary.store.*` in Liferay Portal 6.2 to `com.liferay.portal.store.*` in DXP 7.0. Set your `dl.store.impl` property in [`portal-ext.properties`](../../reference/portal-properties.md) one of these ways:

```properties
dl.store.impl=com.liferay.portal.store.file.system.FileSystemStore
dl.store.impl=com.liferay.portal.store.db.DBStore
dl.store.impl=com.liferay.portal.store.file.system.AdvancedFileSystemStore
dl.store.impl=com.liferay.portal.store.s3.S3Store
```

## Migrating from JCR Store

JCR Store was deprecated in DXP 7.0. The [Document Repository Configuration](https://help.liferay.com/hc/en-us/articles/360028810112-Document-Repository-Configuration) documentation describes other store options. [Migrate to a supported file store](https://help.liferay.com/hc/en-us/articles/360029131691-Server-Administration) before upgrading your database.

## Migrating from CMIS Store

CMIS Store was deprecated in 7.0.10 Fix Pack 14 and was removed in DXP 7.2. The [Document Repository Configuration](https://help.liferay.com/hc/en-us/articles/360028810112-Document-Repository-Configuration) documentation describes other store options. [Migrate to a supported file store](https://help.liferay.com/hc/en-us/articles/360029131691-Server-Administration) before upgrading your database.

## Configuring the File Store in System Settings

Since DXP 7.0, document store type-specific configuration (e.g., specific to Simple File Store, Advanced File Store, S3, etc.) is done in the Control Panel at _Configuration_ → _System Settings_ → _File Storage_, or using OSGi configuration files (`.config` files). Type-specific configuration is no longer done using `portal-ext.properties`. After upgrading your database, configure your file store in [System Settings](https://help.liferay.com/hc/en-us/articles/360028810112-Document-Repository-Configuration).

See [Document Repository Configuration](https://help.liferay.com/hc/en-us/articles/360028810112-Document-Repository-Configuration) for more store configuration details.