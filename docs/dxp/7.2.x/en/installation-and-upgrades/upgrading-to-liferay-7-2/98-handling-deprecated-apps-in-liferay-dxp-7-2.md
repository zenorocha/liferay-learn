# Handling Deprecated Apps in Liferay DXP 7.2

During the development of any software product, it's sometimes necessary to stop developing or remove specific features. Liferay DXP is no different. In DXP 7.2, Liferay has deprecated several apps and features. 

There are three types of deprecated apps: 

1.  Deprecated apps that remain in DXP 7.2, but will be removed in a future release. (Availability: *Bundled*)

2.  Deprecated apps that have been removed from DXP 7.2, yet are still available for download via [Liferay Marketplace](https://web.liferay.com/marketplace) (Availability: *Marketplace*) 

3.  Deprecated apps that have been removed from DXP 7.2 and aren't available for download. (Availability: *Removed*) 

| **Note:** All apps deprecated by Liferay are no longer in active development. You should therefore plan to stop using these apps. Such apps, however, may still be available for download.

Apps deprecated in earlier versions of Liferay DXP may also need to be considered, if you are upgrading from an earlier version than 7.1. See the following deprecated apps for any versions between your version pre-upgrade and 7.2:

* Liferay DXP 7.1: [link]()
* Liferay DXP 7.0: [link]()

The deprecated apps in DXP 7.2 are as follows:

## Foundation

| App |  Availability |  Notes |
| --- | ------------- | ------ |
| AlloyUI | Bundled | Replaced by [MetalJS](https://metaljs.com/) (temporary) exposed as [ClayUI tag](/docs/7-2/reference/-/knowledge_base/r/front-end-taglibs) equivalents. |  
| CMIS Store | Removed | Migrate to another [Document Repository Store option](/docs/7-2/deploy/-/knowledge_base/d/document-repository-configuration). Before [upgrading to DXP 7.2](/docs/7-2/deploy/-/knowledge_base/d/upgrading-to-product-ver), migrate your document store data using [Data Migration in Server Administration](/docs/7-2/user/-/knowledge_base/u/server-administration). |
| JCRStore | Removed | Migrate to another [Document Repository Store option](/docs/7-2/deploy/-/knowledge_base/d/document-repository-configuration). Before [upgrading to DXP 7.2](/docs/7-2/deploy/-/knowledge_base/d/upgrading-to-product-ver), migrate your document store data using [Data Migration in Server Administration](/docs/7-2/user/-/knowledge_base/u/server-administration). |
| Legacy Search Portlet | Bundled | Will be removed in a future release. Replaced by the [Search widgets](/docs/7-2/user/-/knowledge_base/u/search). |
| Sprite framework | Bundled | Liferay's image sprite framework is deprecated and is disabled by default via the `sprite.enabled` [portal property](/docs/7-2/deploy/-/knowledge_base/d/portal-properties). You can still build image sprites using any framework you like and deploy them in your plugins. |

## Personalization

| App |  Availability |  Notes |
| --- | ------------- | ------ |
| Audience Targeting | Removed | Replaced by [Personalization](/docs/7-2/user/-/knowledge_base/u/segmentation-and-personalization). | 

## Web Experience

| App |  Availability |  Notes |
| --- | ------------- | ------ |
| RSS Publisher | Bundled | See [the article](/docs/7-1/user/-/knowledge_base/u/the-rss-publisher-widget) on enabling and using this widget. |
| User Group Pages (Copy Mode) | Bundled | See the [Legacy User Group Sites Beahavior](/docs/7-1/user/-/knowledge_base/u/user-group-sites#legacy-user-group-sites-behavior) instructions on how to enable it. |
| Resources Importer | Bundled | Deprecated as of 7.1 with no direct replacement |

## Forms

| App | Availability | Notes |
| --- | ------------------ | ----------- |
| Web Form | Removed | Final version released for 7.0. |

## Security

| App |  Availability |  Notes |
| --- | ------------------ | ----------- |
| Central Authentication Service | Bundled | Migrate to [SAML based authentication](https://help.liferay.com/hc/en-us/articles/360028711032-Introduction-to-Authenticating-Using-SAML). |
| Google Login | Marketplace | Replaced by [OpenID Connect](/docs/7-2/deploy/-/knowledge_base/d/authenticating-with-openid-connect). |
| NTLM | Marketplace | Replaced by [Kerberos](/docs/7-2/deploy/-/knowledge_base/d/authenticating-with-kerberos). |
| OAuth 1.0a | Marketplace | Replaced by OAuth 2.0, which is included in the bundle. |
| OpenAM / OpenSSO | Bundled | Migrate to [SAML based authentication](https://help.liferay.com/hc/en-us/articles/360028711032-Introduction-to-Authenticating-Using-SAML). |
| OpenID | Marketplace | Replaced by [OpenID Connect](/docs/7-2/deploy/-/knowledge_base/d/authenticating-with-openid-connect). |

## User and System Management

| App |  Availability | 
| --- | ------------------ |
| Live Users | Enabled through the [`live.users.enabled`](@platform-ref@/7.2-latest/propertiesdoc/portal.properties.html) [portal property](/docs/7-2/deploy/-/knowledge_base/d/portal-properties). | 

## Apps in Maintenance Mode

Although no action is immediately necessary, you may also want to consider apps that are put into maintenance mode in DXP 7.2. These apps are not being deprecated or removed, but will no longer receive updates other than bug fixes. See [Apps in Maintenance Mode](./99-apps-in-maintenance-mode.md) for more information.
