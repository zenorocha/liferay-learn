# DBStore

DBStore stores files to the DXP database as blobs. DBStore doesn't have the transaction rollback vulnerabilities that the file-based store types (Simple, Advanced, S3) have.

DBStore's file size limit is 1 gigabyte. To store files larger than 1 gigabyte, use the [Simple File System Store](./simple-file-system-store.md) or [Advanced File System Store](../configuring-file-storage.md#configuring-advanced-file-system-store).

## Configuring the Store

1. Configure [`portal-ext.properties`](../../../installation-and-upgrades/reference/portal-properties.md) with this property:

    ```properties
    dl.store.impl=com.liferay.portal.store.db.DBStore
    ```

1. Restart DXP.

DXP is now saving files to DBStore.

## Additional Information

* [Configuring File Storage](../configuring-file-storage.md)
* [File Store Migration](../file-store-migration.md)