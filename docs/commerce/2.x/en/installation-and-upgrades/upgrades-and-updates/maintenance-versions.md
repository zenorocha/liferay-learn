# Maintenance Versions

Periodically, Liferay will release updates (maintenance versions) to Liferay Commerce for both open source and enterprise subscribers. In particular, Maintenance Versions refer to the change in the third digit of the version number. Each maintenance version includes the latest bug fixes and provides an improved level of security and reliability. Customizations are generally safe, but reviewing the customizations are highly recommended before implementation. No new features are included.

Updating to a new maintenance version is very similar to upgrading to a new major or minor version of Liferay Commerce.

## Roadmap

1. [Download and Deploy](#download-and-deploy)
1. [Clear Stale Data and Restart the Server](#clear-stale-data-and-restart-the-server)
1. [Additional Information](#additional-information)

## Download and Deploy

1. Download the latest Liferay Commerce `LPKG`.
    * Enterprise subscribers can download the latest `LPKG` from [Help Center](https://customer.liferay.com/downloads?p_p_id=com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet&_com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet_productAssetCategoryId=118190997&_com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet_fileTypeAssetCategoryId=118191001).
      * Subscribers also need an order number or activation key for Liferay Commerce. See [Activating a Marketplace App Through a Proxy Server](https://help.liferay.com/hc/en-us/articles/360018427391).
    * The latest open source `LPKG` may be obtained from the [Liferay Commerce Community Site](https://commerce.liferay.dev/download).

1. Deploy the `LPKG` to the `${liferay.home}/deploy` folder.
1. Verify that that the following message appears in the application server console:

    ```log
    2019-08-12 21:53:43.847 INFO  [com.liferay.portal.kernel.deploy.auto.AutoDeployScanner][AutoDeployDir:261] Processing Liferay Commerce Enterprise 2.0.5.lpkg
    2019-08-13 18:12:56.713 INFO  [fileinstall-/../../liferay-commerce-enterprise-1.1.6/osgi/marketplace][LPKGArtifactInstaller:202] The portal instance needs to be restarted to complete the installation of file:/../../liferay-commerce-enterprise-1.1.6/osgi/marketplace/Liferay%20Commerce%20-%20API.lpkg
    2019-08-13 18:12:56.715 INFO  [fileinstall-/../../liferay-commerce-enterprise-1.1.6/osgi/marketplace][LPKGArtifactInstaller:202] The portal instance needs to be restarted to complete the installation of file:/../../liferay-commerce-enterprise-1.1.6/osgi/marketplace/Liferay%20Commerce%20-%20Impl.lpkg
    ```

1. Shut down the application server.

## Clear Stale Data and Restart the Server

1. Delete the `${liferay.home}/osgi/state` folder.
    > To learn more about OSGi folders, see [Installing Apps Manually](https://help.liferay.com/hc/en-us/articles/360017895412-Installing-Apps-Manually#using-your-file-system-to-install-apps).
1. Start the application server.
1. Verify that the the upgrade process has begun by looking for messages similar to this in your application server console logs:

    ```log
    2019-08-13 18:26:26.082 INFO  [main][UpgradeProcess:93] Upgrading com.liferay.commerce.account.internal.upgrade.v1_2_0.CommerceAccountGroupCommerceAccountRelUpgradeProcess
    2019-08-13 18:26:26.106 INFO  [main][UpgradeProcess:107] Completed upgrade process com.liferay.commerce.account.internal.upgrade.v1_2_0.CommerceAccountGroupCommerceAccountRelUpgradeProcess in 24 ms
    2019-08-13 18:26:26.116 INFO  [main][UpgradeProcess:93] Upgrading com.liferay.commerce.account.internal.upgrade.v1_2_0.CommerceAccountGroupRelUpgradeProcess
    2019-08-13 18:26:26.124 INFO  [main][UpgradeProcess:107] Completed upgrade process com.liferay.commerce.account.internal.upgrade.v1_2_0.CommerceAccountGroupRelUpgradeProcess in 8 ms
    2019-08-13 18:26:26.130 INFO  [main][UpgradeProcess:93] Upgrading com.liferay.commerce.account.internal.upgrade.v1_2_0.CommerceAccountGroupUpgradeProcess
    2019-08-13 18:26:26.142 INFO  [main][UpgradeProcess:107] Completed upgrade process com.liferay.commerce.account.internal.upgrade.v1_2_0.CommerceAccountGroupUpgradeProcess in 12 ms
    2019-08-13 18:26:26.148 INFO  [main][UpgradeProcess:93] Upgrading com.liferay.commerce.account.internal.upgrade.v1_3_0.CommerceAccountNameUpgradeProcess
    2019-08-13 18:26:26.160 INFO  [main][LoggingTimer:83] Starting com.liferay.portal.kernel.upgrade.UpgradeProcess#alter
    2019-08-13 18:26:26.200 INFO  [main][LoggingTimer:43] Completed com.liferay.portal.kernel.upgrade.UpgradeProcess#alter in 40 ms
    2019-08-13 18:26:26.208 INFO  [main][UpgradeProcess:107] Completed upgrade process com.liferay.commerce.account.internal.upgrade.v1_3_0.CommerceAccountNameUpgradeProcess in 60 ms
    2019-08-13 18:26:26.246 INFO  [main][LoggingTimer:83] Starting com.liferay.portal.upgrade.internal.index.updater.IndexUpdaterUtil#updateIndexes#Updating database indexes for com.liferay.commerce.account.service
    2019-08-13 18:26:26.346 INFO  [main][BaseDB:812] Dropping stale indexes
    2019-08-13 18:26:26.400 INFO  [main][BaseDB:84] Adding indexes
    ```

    ```log
    2019-08-13 18:28:19.439 INFO  [main][VerifyProcess:65] Verifying com.liferay.commerce.product.internal.verify.CommerceCatalogServiceVerifyProcess
    2019-08-13 18:28:19.443 INFO  [main][LoggingTimer:83] Starting com.liferay.commerce.product.internal.verify.CommerceCatalogServiceVerifyProcess#verifyMasterCommerceCatalog
    2019-08-13 18:28:19.445 INFO  [main][LoggingTimer:43] Completed com.liferay.commerce.product.internal.verify.CommerceCatalogServiceVerifyProcess#verifyMasterCommerceCatalog in 2 ms
    2019-08-13 18:28:19.446 INFO  [main][VerifyProcess:80] Completed verification process com.liferay.commerce.product.internal.verify.CommerceCatalogServiceVerifyProcess in 7 ms
    2019-08-13 18:28:32.471 INFO  [main][ThemeHotDeployListener:108] 1 theme for admin-theme is available for use
    2019-08-13 18:28:34.296 INFO  [main][ThemeHotDeployListener:108] 1 theme for classic-theme is available for use
    2019-08-13 18:28:38.667 INFO  [main][ThemeHotDeployListener:108] 1 theme for minium-theme is available for use
    ```

The Liferay Commerce instance has been updated. There is no need to reindex and all the data remains unchanged.

## Additional Information

Liferay Commerce is built on Liferay Digital Experience Platform. Occasionally, it is necessary to update the core Liferay DXP platform, are a requirement to updating to the latest major, minor, or maintenance version. Fixes to Liferay Commerce are independent from Liferay.

* [Liferay Commerce Fix Delivery Method](../../get-help/commerce-enterprise-support/liferay-commerce-fix-delivery-method.md)
* [Upgrading from Liferay Commerce 1.1.x](./upgrading-from-liferay-commerce-1.1.x.md)
* [End of Life](https://www.liferay.com/subscription-services/end-of-life/commerce)
