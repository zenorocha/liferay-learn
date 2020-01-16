# Using the Advanced File System Store

The advanced file system store is similar to the [simple file system store](./using-the-file-system-store.md) (the default store). Like that store, it saves files to a file system path (local or on a network). The advanced file system store uses a slightly different folder structure to store files which is pictured below.

![Figure 1: The advanced file system store creates a more nested folder structure than the file system store.](./using-the-advanced-file-system-store/images/01.png)

One strong reason to use the Advanced File System Store is because several operating systems have limitations on the number of files that can be stored in a particular folder. The Advanced File System Store overcomes this limitation by programmatically creating a structure that can expand to millions of files, by alphabetically nesting the files in folders. This not only allows for more files to be stored, but also improves performance as there are fewer files stored per folder.

## Configuring Liferay DXP to Use the Advanced File System Store

To use the advanced file system store, follow these steps:

1. Configure [`portal-ext.properties`](../../14-reference/03-portal-properties.md) with this property:

    ```properties
    dl.store.impl=com.liferay.portal.store.file.system.AdvancedFileSystemStore
    ```

1. Restart DXP.

1. In the Control Panel, navigate to *Configuration* &rarr; *System Settings* &rarr; *File Storage*.

1. In the *Advanced File System Store* screen, configure the store's **Root Directory** settings:

    ![Advanced File System Store Configuration Page](././using-the-advanced-file-system-store/images/02.png)

1. Click _Save_.

### Configuration for a Clustered Environment

1. Copy the `portal-ext.properties` to each node's [`[Liferay Home]` folder](../../14-reference/01-liferay-home.md).
1. Export the configuration from the *Advanced File System Store* screen to a [`.config` file](https://help.liferay.com/hc/articles/360029131651-Understanding-System-Configuration-Files).
1. Copy the `.config` file to each node's `[Liferay Home]/osgi/configs` folder.
1. Restart DXP on the nodes.

DXP is now using the Advanced File System Store.

## Using the Advanced File System Store in a Clustered Environment

<!-- Fix links to point to the learn articles where possible -->
In a [clustered environment](https://help.liferay.com/hc/articles/360029123831-Liferay-DXP-Clustering), point the store to a network mounted file system that all the nodes can access. The networked file system must be accessible to all nodes, support concurrent requests, and support file locking. Otherwise, you may experience data corruption issues if two users attempt to write to the same file at the same time from two different nodes.

## Database Rollback Limitation

**Warning:** If a database transaction rollback occurs in the Document Library, file system changes that have occurred since the start of the transaction are **not** reversed. Inconsistencies between Document Library files and those in the file system store can occur and may require manual synchronization.

## Additional Information

* [Document Repository Overview](./document-repository-overview.md)
* [Using Amazon S3 Store](./using-amazon-s3-store.md)
* [Using the DBStore](./using-the-dbstore.md)
