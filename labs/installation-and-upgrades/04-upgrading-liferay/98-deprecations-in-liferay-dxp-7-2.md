# Deprecations in Liferay DXP 7.2

Liferay DXP will sometimes stop developing or archive features with new versions. In DXP 7.2, Liferay has deprecated several apps and features.

Features in Liferay DXP that have been deprecated may still be present either in the core product, or as a [Marketplace download](https://web.liferay.com/marketplace). Deprecated features may be archived in a future release. Archived apps are no longer maintained or released with new versions of Liferay DXP.

> **Note:** All applications deprecated by Liferay are no longer in active development. You should therefore plan to stop using these applications.

Features deprecated in earlier versions of Liferay DXP may also need to be considered, if you are upgrading from an earlier version than 7.1. See the following deprecations for any versions between your version pre-upgrade and 7.2:

* [Liferay DXP 7.1](https://help.liferay.com/hc/en-us/articles/360018403151-Digital-Experience-Platform-7-1-Deprecated-and-Removed-Items)
* [Liferay DXP 7.0](https://help.liferay.com/hc/en-us/articles/360018123832-Digital-Experience-Platform-7-0-Deprecated-and-Removed-Items)

The deprecations in DXP 7.2 are as follows:

## Foundation

| Feature |  Availability |  Notes |
| --- | ------------- | ------ |
| AlloyUI | Bundled | Replaced by [MetalJS](https://metaljs.com/) (temporary) exposed as [ClayUI tag](https://help.liferay.com/hc/en-us/articles/360028832192-Front-End-Taglibs) equivalents. |
| CMIS Store | Archived | Migrate to another [Document Repository Store option](https://help.liferay.com/hc/en-us/articles/360028810112-Document-Repository-Configuration). Before [upgrading to DXP 7.2](./01-introduction-to-upgrading-to-liferay-dxp-7-2.md), migrate your document store data using [Data Migration in Server Administration](https://help.liferay.com/hc/en-us/articles/360029131691-Server-Administration). |
| JCRStore | Archived | Migrate to another [Document Repository Store option](https://help.liferay.com/hc/en-us/articles/360028810112-Document-Repository-Configuration). Before [upgrading to DXP 7.2](./01-introduction-to-upgrading-to-liferay-dxp-7-2.md), migrate your document store data using [Data Migration in Server Administration](https://help.liferay.com/hc/en-us/articles/360029131691-Server-Administration). |
| Legacy Search Portlet | Bundled | Will be archived in a future release. This will be replaced by the [Search widgets](https://help.liferay.com/hc/en-us/articles/360029133791-Introduction-to-Search). |
| Sprite framework | Bundled | Liferay's image sprite framework is deprecated and is disabled by default via the `sprite.enabled` [portal property](https://help.liferay.com/hc/en-us/articles/360028712292-Portal-Properties). You can still build image sprites using any framework you like and deploy them in your plugins. |

## Personalization

| Feature |  Availability |  Notes |
| --- | ------------- | ------ |
| Audience Targeting | Archived | Replaced by [Personalization](https://help.liferay.com/hc/en-us/articles/360028721372-Introduction-to-Segmentation-and-Personalization) (see [Migrating from Audience Targeting](./96-migrating-from-audience-targeting/01-migrating-from-audience-targeting.md)). |

## Web Experience

| Feature |  Availability |  Notes |
| --- | ------------- | ------ |
| RSS Publisher | Bundled | See [the article](https://help.liferay.com/hc/en-us/articles/360028820672-The-RSS-Publisher-Widget) on enabling and using this widget. |
| User Group Pages (Copy Mode) | Bundled | See the [Legacy User Group Sites Behavior](https://help.liferay.com/hc/en-us/articles/360028819172-User-Group-Sites#legacy-user-group-sites-behavior) instructions on how to enable it. |
| Resources Importer | Bundled | Deprecated as of 7.1 with no direct replacement |

## Forms

| Feature | Availability | Notes |
| --- | ------------------ | ----------- |
| Web Form | Archived | Final version released for 7.0. |

## Search

| Feature | Availability | Notes |
| --- | ------------- | ------ |
| Search Portlet | Archived | Replaced by multiple Search widgets |

## Security

| Feature |  Availability |  Notes |
| --- | ------------------ | ----------- |
| Central Authentication Service | Bundled | Migrate to [SAML based authentication](https://help.liferay.com/hc/en-us/articles/360028711032-Introduction-to-Authenticating-Using-SAML). |
| Google Login | Marketplace | Replaced by [OpenID Connect](https://help.liferay.com/hc/en-us/articles/360028711312-Authenticating-with-OpenID-Connect). |
| NTLM | Marketplace | Replaced by [Kerberos](https://help.liferay.com/hc/en-us/articles/360029031831-Authenticating-with-Kerberos). |
| OAuth 1.0a | Marketplace | Replaced by OAuth 2.0, which is included in the bundle. |
| OpenAM / OpenSSO | Bundled | Migrate to [SAML based authentication](https://help.liferay.com/hc/en-us/articles/360028711032-Introduction-to-Authenticating-Using-SAML). |
| OpenID | Marketplace | Replaced by [OpenID Connect](https://help.liferay.com/hc/en-us/articles/360028711312-Authenticating-with-OpenID-Connect). |

## User and System Management

| Feature |  Availability |
| --- | ------------------ |
| Live Users | Enabled through the [`live.users.enabled`](https://docs.liferay.com/dxp/portal/7.2-latest/propertiesdoc/portal.properties.html) [portal property](https://help.liferay.com/hc/en-us/articles/360028712292-Portal-Properties). |

## Applications in Maintenance Mode

Although no action is immediately necessary, you may also want to consider applications that are put into maintenance mode in DXP 7.2. These applications are not being deprecated or archived, but will no longer receive updates other than bug fixes. See [Features in Maintenance Mode](./99-features-in-maintenance-mode.md) for more information.
