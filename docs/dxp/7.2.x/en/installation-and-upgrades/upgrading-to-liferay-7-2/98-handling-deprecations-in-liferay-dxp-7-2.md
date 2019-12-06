# Handling Deprecations in Liferay DXP 7.2

As with any software product, Liferay DXP will sometimes stop developing or remove features with new versions. In DXP 7.2, Liferay has deprecated several apps and features. 

There are three types of deprecations: 

1. Deprecated features that remain in DXP 7.2, but will be removed in a future release. (Availability: *Bundled*)

2. Deprecated features that have been removed from DXP 7.2, yet are still available for download via [Liferay Marketplace](https://web.liferay.com/marketplace) (Availability: *Marketplace*) 

3. Deprecated features that have been removed from DXP 7.2 and aren't available for download. (Availability: *Removed*) 

**Note:** All applications deprecated by Liferay are no longer in active development. You should therefore plan to stop using these applications. Such applications, however, may still be available for download.

Features deprecated in earlier versions of Liferay DXP may also need to be considered, if you are upgrading from an earlier version than 7.1. See the following deprecations for any versions between your version pre-upgrade and 7.2:

* Liferay DXP 7.1: [link]()
* Liferay DXP 7.0: [link]()

The deprecations in DXP 7.2 are as follows:

## Foundation

| Feature |  Availability |  Notes |
| --- | ------------- | ------ |
| AlloyUI | Bundled | Replaced by [MetalJS](https://metaljs.com/) (temporary) exposed as [ClayUI tag](https://help.liferay.com/hc/en-us/articles/360028832192-Front-End-Taglibs) equivalents. |  
| CMIS Store | Removed | Migrate to another [Document Repository Store option](https://help.liferay.com/hc/en-us/articles/360028810112-Document-Repository-Configuration). Before [upgrading to DXP 7.2](./01-introduction-to-upgrading-to-liferay-dxp-7-2.md), migrate your document store data using [Data Migration in Server Administration](https://help.liferay.com/hc/en-us/articles/360029131691-Server-Administration). |
| JCRStore | Removed | Migrate to another [Document Repository Store option](https://help.liferay.com/hc/en-us/articles/360028810112-Document-Repository-Configuration). Before [upgrading to DXP 7.2](./01-introduction-to-upgrading-to-liferay-dxp-7-2.md), migrate your document store data using [Data Migration in Server Administration](https://help.liferay.com/hc/en-us/articles/360029131691-Server-Administration). |
| Legacy Search Portlet | Bundled | Will be removed in a future release. This will be replaced by the [Search widgets](https://help.liferay.com/hc/en-us/articles/360029133791-Introduction-to-Search). |
| Sprite framework | Bundled | Liferay's image sprite framework is deprecated and is disabled by default via the `sprite.enabled` [portal property](https://help.liferay.com/hc/en-us/articles/360028712292-Portal-Properties). You can still build image sprites using any framework you like and deploy them in your plugins. |

## Personalization

| Feature |  Availability |  Notes |
| --- | ------------- | ------ |
| Audience Targeting | Removed | Replaced by [Personalization](https://help.liferay.com/hc/en-us/articles/360028721372-Introduction-to-Segmentation-and-Personalization) (see [Migrating from Audience Targeting](./96-migrating-from-audience-targeting/01-migrating-from-audience-targeting.md)). | 

## Web Experience

| Feature |  Availability |  Notes |
| --- | ------------- | ------ |
| RSS Publisher | Bundled | See [the article](https://help.liferay.com/hc/en-us/articles/360028820672-The-RSS-Publisher-Widget) on enabling and using this widget. |
| User Group Pages (Copy Mode) | Bundled | See the [Legacy User Group Sites Behavior](https://help.liferay.com/hc/en-us/articles/360028819172-User-Group-Sites#legacy-user-group-sites-behavior) instructions on how to enable it. |
| Resources Importer | Bundled | Deprecated as of 7.1 with no direct replacement |

## Forms

| Feature | Availability | Notes |
| --- | ------------------ | ----------- |
| Web Form | Removed | Final version released for 7.0. |

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

Although no action is immediately necessary, you may also want to consider applications that are put into maintenance mode in DXP 7.2. These applications are not being deprecated or removed, but will no longer receive updates other than bug fixes. See [Features in Maintenance Mode](./99-features-in-maintenance-mode.md) for more information.
