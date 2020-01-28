# Deploying Liferay Commerce to an Existing Liferay Installation

This article documents how to deploy Liferay Commerce to an existing Liferay DXP instance. Because Liferay Commerce is built on Liferay DXP, it is necessary to have an existing DXP 7.1 instance running. Prior to following this guide, please review System Requirements.

To begin using Liferay Commerce:

1. Download the latest Liferay Commerce `LPKG`.
    * Enterprise subscribers can download the latest `LPKG` from [Help Center](https://customer.liferay.com/downloads?p_p_id=com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet&_com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet_productAssetCategoryId=118190997&_com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet_fileTypeAssetCategoryId=118191001).
      * Subscribers also need an order number or activation key for Liferay Commerce. See [Activating a Marketplace App Through a Proxy Server](https://help.liferay.com/hc/en-us/articles/360018427391).
    * The latest open source `LPKG` may be obtained from the [Liferay Commerce Community Site](https://commerce.liferay.dev/download).

1. Deploy the `LPKG` to the `${liferay.home}/deploy` folder.
    > To learn more about deploying applications to Liferay DXP, see [Liferay Home](https://help.liferay.com/hc/en-us/articles/360028712272-Liferay-Home).
1. (_Subscribers only_) Deploy the activation key to the `${liferay.home}/deploy` folder.
1. Verify the following message appears in the application server console:

    ```
    2019-08-09 00:25:10.662 INFO  [fileinstall-/../../liferay-dxp-7.1.10.1-sp1/osgi/marketplace][LPKGArtifactInstaller:202] The portal instance needs to be restarted to complete the installation of file:/../../liferay-dxp-7.1.10.1-sp1/osgi/marketplace/Liferay%20Commerce%20-%20API.lpkg
    2019-08-09 00:25:10.664 INFO  [fileinstall-/../..//liferay-dxp-7.1.10.1-sp1/osgi/marketplace][LPKGArtifactInstaller:202] The portal instance needs to be restarted to complete the installation of file:/../../liferay-dxp-7.1.10.1-sp1/osgi/marketplace/Liferay%20Commerce%20-%20Impl.lpkg
    ```

1. Shut down the application server completely.
1. Start the application server.
1. Verify that the `LPKG` has begun installation by looking for this message:

    ```
    2019-08-09 00:32:48.850 INFO  [main][BaseDeployer:877] Deploying minium-theme.war
    ```

1. On the **first** deployment, there are a series of commands followed by this message:

    ```
    2019-08-09 00:34:51.753 INFO  [main][ThemeHotDeployListener:108] 1 theme for minium-theme is available for use
    ```

Liferay Commerce has been deployed and is ready for use. Store administrators can begin building a storefront and populating their catalog.

## Additional Information

Note that if the application server is restarted, Liferay Commerce will not execute the `VerifyProcess` commands a second time.

* [Liferay Commerce 2.0 Compatibility Matrix](https://web.liferay.com/documents/14/21598941/Liferay+Commerce+2.0+Compatibility+Matrix/0ed97477-f5a7-40a6-b5ab-f00d5e01b75f)
* [Installation Overview](./installation-overview.md)
* [Using the Liferay Commerce Tomcat Bundle](./using-the-liferay-commerce-tomcat-bundle.md)
