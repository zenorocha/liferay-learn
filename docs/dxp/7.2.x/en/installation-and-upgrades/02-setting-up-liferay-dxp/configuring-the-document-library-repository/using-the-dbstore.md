# Using the DBStore

You can store Documents and Media files in Liferay DXP's database using DBStore. DBStore's maximum file (stored as a blob) size is 1 gigabyte. To store files larger than that, use [Simple File System Store](./using-the-file-system-store.md) or [Advanced File System Store](./using-the-advanced-file-system-store.md).

## Configuring DXP to Use DBStore

1. Set the following property in a [`portal-ext.properties`](https://help.liferay.com/hc/articles/360028712292-Portal-Properties) file in your [Liferay Home](../../14-reference/01-liferay-home.md) folder:

    ```properties
    dl.store.impl=com.liferay.portal.store.db.DBStore
    ```

1. Restart DXP.

Documents and Media now uses DXP's database via DBStore.

## Additional Information

* [Document Repository Overview](./configuring-the-document-library-repository/document-repository-overview.md)
