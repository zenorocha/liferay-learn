# Simple File System Store

Simple File System Store is the default file store type. It uses a file system (local or a mounted share) to store files. If Simple File System Store is used in a clustered environment, its the folder must be accessible to all cluster nodes, handle concurrent requests, and support file locking. We recommend using a [Storage Area Network](https://en.wikipedia.org/wiki/Storage_area_network) or a clustered file system.

## Simple File System Store Details

The simple file system store is bound to the Liferay DXP database. The default root folder is `[Liferay Home]/data/document_library`. The Simple File System Store saves files using this file path format:

```
[Liferay Home]/data/document_library/companyId/folderId/numericFileEntryName/versionNumber
```

![Example Simple File System Store file structure.](./simple-file-system-store/images/01.png)

Here's an explanation of the file hierarchy in the `[Liferay Home]/data/document_library` folder:

`companyId`: The site's company ID.

`folderId`: The ID of the app's folder (e.g., Documents and Media folder) containing the file entry.

`numericFileEntryName`: The file entry's numeric name.

`versionNumber`: The file entry's version number.

**Note:** A document's numeric file entry name and document ID differ in these ways:

* They have independent counters.
* The numeric file entry name is used in the storage file path but the document ID is not.
* They're stored in different `DLFileEntry` table columns. The numeric file entry name is stored in the `name` column and the document ID is stored in the `fileEntryId` column.

## Changing the Root Storage Directory

To use the store, follow these steps:

1. Click the _Menu_ (![Menu](./simple-file-system-store/images/02.png)) button to access the _Control Panel_.
1. Navigate to _Control Panel_ &rarr; _Configuration_ &rarr; _System Settings_.
1. In the _Platform_ section, click _File Storage_.
1. In the _Simple File System Store_ screen, set the _Root directory_ to your [Liferay Home](../../../installation-and-upgrades/reference/liferay-home.md) path (absolute or relative).

    ![The File Storage page in System Settings lets you configure document repository storage.](./simple-file-system-store/images/03.png)

1. Click _Save_.

The file store switches immediately to the new folder.

## Using the Store in a Clustered Environment

In a [clustered environment](../../../installation-and-upgrades/setting-up-liferay-dxp/configuring-clustering-for-high-availability/01-introduction-to-clustering-liferay-dxp.md), point the store to a network mounted file system that all the nodes can access. The networked file system must be accessible to all nodes, support concurrent requests, and support file locking. If Simple File System Store is used without such a file system and multiple users attempt writing to the same file concurrently, data corruption can occur.

## Database Rollback Limitation

**Warning:** If a database transaction rollback occurs in a Document Library, the transaction's file system changes are **not** reversed. Inconsistencies between Document Library files and those in the file system store can occur and may require manual synchronization. All of the DXP stores except [DBStore](./dbstore.md) are vulnerable to this limitation.

## Additional Information

* [File Storage Overview](./file-storage.md)
* [Advanced File System Store](./advanced-file-system-store.md)
* [Amazon S3 Store](./amazon-s3-store.md)
* [DBStore](./dbstore.md)
* [File Store Migration](./file-store-migration.md)