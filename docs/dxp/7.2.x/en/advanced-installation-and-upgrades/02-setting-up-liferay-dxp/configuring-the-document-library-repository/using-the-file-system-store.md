# Using the File System Store

The simple file storage implementation is the default storage method for the Document Library. It uses a local folder to store files. File System Store can be used for a clustered configuration, but the folder that is used **must** be able to be shared to all cluster nodes, handle concurrent requests, and support file locking. We recommend using a [Storage Area Network](https://en.wikipedia.org/wiki/Storage_area_network) or a clustered file system when using this storage method.

The simple file system store is heavily bound to the Liferay DXP database. By default, documents are stored in a `document_library` subfolder of the `data` folder.

The Simple File System store uses this folder path format for storing documents:

<!-- Is this folder path an extension of [LIFERAY_HOME]? -->

```
/companyId/folderId/numericFileEntryName/versionNumber
```

The first folder name is the site’s company ID. The second folder name is the Documents and Media folder’s ID where the document resides. The third folder name is the document’s numeric file entry name. Finally, the fourth name is a version number used for storing multiple versions of the document.

> **Important:** A document's numeric file entry name is distinct from the document ID. Each has an independent counter.
>
> * The numeric file entry name is used in the folder path for storing the document but the document ID is not.
> * The numeric file entry name is in the name column of the `DLFileEntry` table in Liferay DXP's database; the document ID is in the `fileEntryId` column of the same table.

## Changing the Root Storage Directory

1. Click the _Menu_ (![Menu](./using-the-file-system-store/images/02.png)) button to access the _Control Panel_.
1. Navigate to _Control Panel_ &rarr; _Configuration_ &rarr; _System Settings_.
1. In the _Platform_ section, click _File Storage_.
1. Click _Simple File System Store_.

    ![Figure 1: The File Storage page in System Settings lets you configure document repository storage.](./using-the-file-system-store/images/01.png)

1. For the store's _Root directory_ value, specify its absolute path or its path relative to [Liferay Home](https://help.liferay.com/hc/articles/360028712272-Liferay-Home).
1. Click the _Save_ button.

The document library store switches immediately to the new folder.
