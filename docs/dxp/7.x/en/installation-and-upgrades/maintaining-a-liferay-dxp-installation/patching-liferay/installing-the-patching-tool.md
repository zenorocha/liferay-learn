# Installing the Patching Tool

Patching DXP on an application server and updating the Patching Tool are done manually.

## Installation

1.  Download the Patching Tool from the [Customer Portal](https://customer.liferay.com/downloads?p_p_id=com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet&_com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet_productAssetCategoryId=118191019&_com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet_fileTypeAssetCategoryId=118191066).

2.  Unzip the Patching Tool to your [Liferay Home](../../reference/liferay-home.md) folder (recommended) or to another folder.

The Patching Tool folder `patching-tool` includes the `patching-tool.sh` script.

To print the Patching Tool help message, execute this command in the `patching-tool` folder:

```bash
cd patching-tool
./patching-tool.sh help
```

## Updating the Patching Tool

The Patching Tool reports when a patch you're installing requires a newer Patching Tool version. Here's how to update the Patching Tool:

1. Download the latest [Patching Tool](https://customer.liferay.com/downloads?p_p_id=com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet&_com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet_productAssetCategoryId=118191019&_com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet_fileTypeAssetCategoryId=118191066).

1. Back up your existing Patching Tool `.properties` files.

1. Overwrite the existing Patching Tool by unzipping the new one to the `patching-tool` folder's parent folder (typically Liferay Home).

The Patching Tool is ready to configure with your DXP installation.

## Additional Information

* [Configuring the Patching Tool](./configuring-the-patching-tool.md)

* [Installing Patches](./installing-patches.md)

* [Patching a DXP WAR](./patching-dxp-on-an-application-server.md)

* [Comparing Patch Levels](./comparing-patch-levels.md)