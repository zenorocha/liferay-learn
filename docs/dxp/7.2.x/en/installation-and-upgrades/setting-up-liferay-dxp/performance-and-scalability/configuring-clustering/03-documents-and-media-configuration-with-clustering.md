# Documents and Media Configuration with Clustering

When Liferay DXP is clustered, Documents and Media must use the same [document repository configuration](https://help.liferay.com/hc/en-us/articles/360028810112-Document-Repository-Configuration) on all nodes.

Note that if you are using the `File System` or `Advanced File System` stores, the file system must be accessible from all nodes (i.e., a network share), support concurrent requests, and file locking.

**Checkpoint**: Verify sharing works between two nodes by executing these steps:

1.  On Node 1, upload a document to the Documents and Media.

2.  On Node 2, download the document. The download should be successful.

3.  Repeat the test with reversed roles.
