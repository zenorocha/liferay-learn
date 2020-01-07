# Documents and Media Configuration with Clustering

When Liferay DXP is clustered, Documents and Media must use the same [document repository configuration](https://help.liferay.com/hc/en-us/articles/360028810112-Document-Repository-Configuration) on all nodes.

For example, if you are using the `Advanced File System` store for for your document repository, then you may have this line in your `portal-ext.properties` file for your DXP instance:

```properties
dl.store.impl=com.liferay.portal.store.file.system.AdvancedFileSystemStore
```

You would then need to copy this line to the `portal-ext.properties` file for all nodes to be able to share documents between them.

Note that if you are using the `File System` or `Advanced File System` stores, the file system must be accessible from all nodes (i.e., a network share), support concurrent requests, and file locking.
