# Document Repository Overview

 All files uploaded into Liferay DXP (usually through the [Documents and Media](placeholder) widget) are stored in a document repository. The document repository's files can be hosted on the local machine, a network mounted file system, in a database, or in the cloud. This overview discusses the four file storage options that are supported in DXP.

* [File System Store](./using-the-file-system-store.md) uses the file system (local or a mounted share) to store [documents and media](https://help.liferay.com/hc/articles/360029040531-Managing-Documents-and-Media) files. This is the *default* file storage method. By default, documents are stored in the default root folder `${Liferay Home}/data/document_library`.

* [Advanced File System Store](./using-the-advanced-file-system-store.md) is similar to File System Store but with improved scalability and performance. Files are nested files into folders by version to for faster performance and improved scalability.

* [S3 Store (Amazon Simple Storage Service)](./using-amazon-s3-store.md) uses Amazon's cloud-based storage solution. An Administrator must create an Amazon account and obtain S3 credentials first.

* [DBStore (Database Storage)](./using-the-dbstore.md) stores files in the database. DBStore's file (stored as a blob) size limit is 1 gigabyte. To store files larger than 1 gigabyte, use the Simple File System Store or the Advanced File System Store.

## Configuring the System File Store

Each option is a type of store, or storage method, which can be configured through the [`portal-ext.properties`](../14-reference/03-portal-properties.md) file by setting the [`dl.store.impl=`property](https://docs.liferay.com/dxp/portal/7.2-latest/propertiesdoc/portal.properties.html#Document%20Library%20Service).

## Document Repositories in a Clustered Environment

To propagate store configuration in a [cluster](https://help.liferay.com/hc/articles/360029123831-Liferay-DXP-Clustering), [export](https://help.liferay.com/hc/articles/360029131591-System-Settings#exporting-and-importing-configurations) your store settings from your store's *File Storage* screen in System Settings to a `.config` file and copy the file to the `[Liferay-Home]/osgi/config` folder in each node.

## Migrating Documents Across Repositories

<!-- The header for this section is relatively general, but the content here is very specific to migrating from File System Store to something else. This guidance feels too specific to sit at the overview level. Talking about Migration Considerations overall does make sense to have here. -->

The Simple File System Store binds documents very closely to Liferay DXP. If subscribers have been using the Simple File System Store for a while and need to migrate documents, use the migration utility in the Control Panel in _Server Administration_ → _Data Migration_. The utility facilitates moving documents from one store implementation to another.

## Rollback Limitations

<!-- This also feels like kind of random information. -->

Database administrators should be aware of the following issue: when using a file system based store (Simple, Advanced, or S3), if a database transaction rollback occurs in a Document Library, file system changes that have occurred since the start of the transaction are not reversed. Inconsistencies between Document Library files and those in the file system store can occur and may require manual synchronization. All stores except DBStore are vulnerable to this limitation.
