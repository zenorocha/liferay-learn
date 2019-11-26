# Upgrading from Liferay Commerce 1.1.x

This article documents how to upgrade Liferay Commerce to the latest Commerce 2.x version. Store administrators should consider regularly updating to the latest available product version to receive bug fixes and new features.

## Roadmap

1. Download and Deploy.
1. Apply the Latest Fix Pack (Subscribers Only).
1. Clear Stale Data and Verify the Upgrade Process.
1. Execute Post-Upgrade Reindex.

## Download and Deploy

1. Download the latest Liferay Commerce Enterprise `LPKG` from [Help Center](https://customer.liferay.com/downloads?p_p_id=com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet&_com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet_productAssetCategoryId=118190997&_com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet_fileTypeAssetCategoryId=118191001).
    >The latest Liferay Commerce `LPKG` may be obtained from the [Liferay Commerce Community Download Page](https://commerce.liferay.dev/download).

1. Deploy the `LPKG` to the `${liferay.home}/deploy` folder.
    > To learn more about deploying applications to Liferay DXP, see [Liferay Home](https://help.liferay.com/hc/en-us/articles/360028712272-Liferay-Home).
1. Verify that the messages similar to those shown below appear in the application server console:

    ```
    Processing Liferay Commerce Enterprise x.x.x.lpkg
    ```

    ```
    The portal instance needs to be restarted to complete the installation of file:/../../liferay-commerce-enterprise-1.1.6/osgi/marketplace/Liferay%20Commerce%20-%20API.lpkg
    ```

    ```
    The portal instance needs to be restarted to complete the installation of file:/../../liferay-commerce-enterprise-1.1.6/osgi/marketplace/Liferay%20Commerce%20-%20Impl.lpkg
    ```

1. Shut down the application server.

## Apply the Latest Fix Pack (Subscribers Only)

Before upgrading Liferay Commerce, update Liferay Digital Experience Platform (DXP) to the latest available fix pack release. For example, if upgrading to Liferay Commerce Enterprise 2.0.6 - upgrading Liferay DXP to Fix Pack 14 is required. The latest fix pack releases are available from [Help Center](https://customer.liferay.com/downloads).

Fix Packs are applied to a Liferay DXP installation using the Liferay Patching Tool. See [Using the Patching Tool](https://help.liferay.com/hc/articles/360018176551-Using-the-Patching-Tool) and [Configuring the Patching Tool](https://help.liferay.com/hc/articles/360018176611-Configuring-the-Patching-Tool) for more information.

Next, apply the fix pack. See [Installing Patches](https://help.liferay.com/hc/en-us/articles/360028810512-Installing-Patches) for more information. If Liferay DXP was [installed manually](https://help.liferay.com/hc/articles/360017896672-Installing-Liferay-DXP-Manually-) (for example, on WebLogic), see [Installing Patches on the Liferay DXP 7.1 WAR](https://help.liferay.com/hc/articles/360018176651-Installing-patches-on-the-Liferay-DXP-7-1-WAR).

To verify Fix Pack installation do the following:

1. Run `patching-tool info` in this `${liferay.home}/patching-tool`

1. Verify that the fix pack has been applied:

    ```
    Detailed patch list:
       [ -] dxp-12-7110 :: Currently not installed; Won't be installed: dxp-14 contains the fixes included in this one :: Built for LIFERAY
       [*I] dxp-14-7110 :: Installed; Will be installed. :: Built for LIFERAY
    ```

Fix Packs are cumulative in nature and include all previously release fix packs. After patching, remove Liferay DXP's cache of deployed code by deleting the contents of the `${liferay.home}/work` folder. See the next section on how to remove other stale data.

## Clear Stale Data and Verify the Upgrade Process

1. Delete the `${liferay.home}/osgi/state` folder.
    > To learn more about OSGi folders, see [Installing Apps Manually](https://help.liferay.com/hc/en-us/articles/360017895412-Installing-Apps-Manually#using-your-file-system-to-install-apps).
1. Start the application server.
1. Verify that the the upgrade process has begun by looking for messages similar to this in your application server console logs:

    ```
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
    ```
    2019-08-13 18:28:19.439 INFO  [main][VerifyProcess:65] Verifying com.liferay.commerce.product.internal.verify.CommerceCatalogServiceVerifyProcess
    2019-08-13 18:28:19.443 INFO  [main][LoggingTimer:83] Starting com.liferay.commerce.product.internal.verify.CommerceCatalogServiceVerifyProcess#verifyMasterCommerceCatalog
    2019-08-13 18:28:19.445 INFO  [main][LoggingTimer:43] Completed com.liferay.commerce.product.internal.verify.CommerceCatalogServiceVerifyProcess#verifyMasterCommerceCatalog in 2 ms
    2019-08-13 18:28:19.446 INFO  [main][VerifyProcess:80] Completed verification process com.liferay.commerce.product.internal.verify.CommerceCatalogServiceVerifyProcess in 7 ms
    2019-08-13 18:28:32.471 INFO  [main][ThemeHotDeployListener:108] 1 theme for admin-theme is available for use
    2019-08-13 18:28:34.296 INFO  [main][ThemeHotDeployListener:108] 1 theme for classic-theme is available for use
    2019-08-13 18:28:38.667 INFO  [main][ThemeHotDeployListener:108] 1 theme for minium-theme is available for use
    ```

The Liferay Commerce instance has been upgraded.

## Execute Post-Upgrade Reindex

After upgrading from Liferay Commerce 1.1.x to the latest version, it is necessary to execute a full search reindex because of product changes between major versions.

To execute a search reindex:

1. Navigate to the _Control Panel_ → _Configuration_ → _Search_.
1. Click _Execute_ next to _Reindex all search indexes_.
1. Wait for the reindex to finish.
1. Navigate to the _Control Panel_ → _Commerce_ → _Products_.
1. Verify all the products are displayed again.

Once reindexing is complete, the new Liferay Commerce instance is ready for use.

## Additional Information

* [Installing Apps Manually](https://help.liferay.com/hc/en-us/articles/360017895412-Installing-Apps-Manually#using-your-file-system-to-install-apps)
* [Liferay Commerce Fix Delivery Method](../../get-help/commerce-enterprise-support/liferay-commerce-fix-delivery-method.md)
