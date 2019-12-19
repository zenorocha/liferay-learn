# Document Repository Overview

 All files uploaded into Liferay DXP (usually through the [Documents and Media](placeholder) widget) are stored in a document repository. The document repository's files can be hosted on the local machine, in the database, or in the cloud. This overview discusses the four file storage options that are supported in DXP.

* **[Simple File System Store](./using-the-simple-file-system-store.md)**: this uses the file system (local or a mounted share) to store [documents and media](https://help.liferay.com/hc/articles/360029040531-Managing-Documents-and-Media) files. This is the *default* file storage. By default, documents are stored in the default root folder `${Liferay Home}/data/document_library`.

* **[Advanced File System Store](./using-the-advanced-file-system-store.md)**: In addition to using the file system (local or a mounted share) to store files, the Advanced File System Store nests the files into folders by version, for faster performance and the ability to store more files.

* **[S3 Store (Amazon Simple Storage Service)](./using-amazon-s3-store.md)**: This uses Amazon's cloud-based storage solution. Administrator must create an Amazon account and obtain S3 credentials first.

* **[DBStore (Database Storage)](./using-the-dbstore.md)**: Using this store puts the files in the database. DBStore's file (stored as a blob) size is 1 gigabyte. To store files larger than 1 gigabyte, use the Simple File System Store or the Advanced File System Store.

## Configuring the File Store

Each option is a *store* which can be configured through the [`portal-ext.properties`](https://help.liferay.com/hc/articles/360028712292-Portal-Properties) file by setting the [`dl.store.impl=`property](https://docs.liferay.com/dxp/portal/7.2-latest/propertiesdoc/portal.properties.html#Document%20Library%20Service).

## Migrating Documents Across Repositories

**Important Note**: The Simple File System Store binds documents very closely to Liferay DXP. If subscribers have been using the Simple File System Store for a while and need to migrate documents, use the migration utility in the Control Panel in _Server Administration_ → _Data Migration_. The utility facilitates moving documents from one store implementation to another.

## Document Repositories in a Clustered Environment

To propagate store configuration in a [cluster](https://help.liferay.com/hc/articles/360029123831-Liferay-DXP-Clustering), [export](https://help.liferay.com/hc/articles/360029131591-System-Settings#exporting-and-importing-configurations) your store settings from your store's *File Storage* screen in System Settings to a `.config` file and copy the file to the `[Liferay-Home]/osgi/config` folder in each node.

## Rollback Limitations

Database administrators should be aware of the following issue: when using a file system based store (Simple, Advanced, or S3), if a database transaction rollback occurs in a Document Library, file system changes that have occurred since the start of the transaction are not reversed. Inconsistencies between Document Library files and those in the file system store can occur and may require manual synchronization. All stores except DBStore are vulnerable to this limitation.
