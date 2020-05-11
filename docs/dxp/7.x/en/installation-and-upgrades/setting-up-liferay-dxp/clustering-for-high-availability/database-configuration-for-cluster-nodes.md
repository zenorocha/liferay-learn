# Database Configuration for Cluster Nodes

At minimum, nodes in a DXP cluster must be [configured to share the same database](./example-creating-a-simple-dxp-cluster.md#configure-cluster-link-and-the-other-server-connections) (or database cluster) in order to function. Optimizations discussed here can further improve database performance for a DXP cluster and should be considered with consideration for your usage of DXP and expected transaction volume.

```warning::
   Clustering will not work with the embedded HSQL database.
```

## Read-Writer Database Configuration

To improve database performance, you can use a read-writer database configuration. Instead of using the same data source for read and read-write operations, this strategy uses a separate data source for each operation type. DXP's Aspect Oriented Programming (AOP) transaction infrastructure directs read transactions to the read data source and read-write transactions to the write data source.

![Read-Writer Database Interaction](./database-configuration-for-cluster-nodes/images/01.png)

Connections to separate read and read-write [data sources](https://docs.liferay.com/portal/7.3-latest/propertiesdoc/portal.properties.html#JDBC) are configured using JDBC or JNDI [Portal Properties](../../reference/portal-properties.md) (e.g., in a [`portal-ext.properties` file](../../reference/portal-properties.md)), as explained in the following sections. The data sources should use separate instances of the DXP database, where the read-write database instance is replicated to the read database instance.

### JDBC

Edit your `portal-ext.properties` file following these steps to connect directly to your separate read and write data sources using [JDBC](../../installing-liferay/configuring-a-database.md):

1. Set the default connection pool provider. For provider information, see the [JDBC properties reference](https://docs.liferay.com/portal/7.3-latest/propertiesdoc/portal.properties.html#JDBC). The default setting specifies [HikariCP](https://github.com/brettwooldridge/HikariCP) as the pool provider:

    ```properties
    jdbc.default.liferay.pool.provider=hikaricp
    ```

1. Configure JDBC connections to your separate read and write data sources. Here's an example:

    ```properties
    jdbc.read.driverClassName=[place your driver name here]
    jdbc.read.url=[place the URL to your "read" database here]
    jdbc.read.username=[place your user name here]
    jdbc.read.password=[place your password here]

    jdbc.write.driverClassName=[place your driver name here]
    jdbc.write.url=[place the URL to your "read-write" database here]
    jdbc.write.username=[place your user name here]
    jdbc.write.password=[place your password here]
    ```

    For example JDBC connection values, please see [Database Templates](../../reference/database-templates.md).

1. Configure DXP to use the write data source (the data source whose prefix is `jdbc.write.`) to create the [Counter](https://docs.liferay.com/portal/7.3-latest/propertiesdoc/portal.properties.html#Counter) data source. A separate data source is always dedicated to the counter.

    ```properties
    counter.jdbc.prefix=jdbc.write.
    ```

1. Optionally validate the data connections to make sure bad connections are handled gracefully.

    Some connection pools used with JDBC4 (check your driver's JDBC version) validate connections automatically. Other connection pools may require additional, vendor-specific connection validation properties---specify them in a Portal Properties file. Refer to your connection pool provider documentation for connection validation details.

1. Enable the read-writer database configuration by copying the default [`spring.configs` and `spring.infrastructure.configs` Portal Properties](https://docs.liferay.com/portal/7.3-latest/propertiesdoc/portal.properties.html#Spring) to your `portal-ext.properties` file and adding the following Spring configuration file paths to them.

    Add to `spring.configs`:

    ```
        META-INF/dynamic-data-source-spring.xml
    ```

    Add to `spring.infrastructure.configs`:

    ```
    META-INF/dynamic-data-source-infrastructure-spring.xml
    ```

    For more information, see the [Spring configuration Portal Properties](https://docs.liferay.com/portal/7.3-latest/propertiesdoc/portal.properties.html#Spring).

### JNDI

Edit your `portal-ext.properties` file following these steps to connect to your read and write data sources on your app server using JNDI:

1. Set your read and write JNDI data source user names and passwords.

    ```properties
    jdbc.read.jndi.name=[place your "read" data source JNDI name here]

    jdbc.read.username=*[place your user name here]
    jdbc.read.password=[place your password here]

    jdbc.write.jndi.name=[place your "read-write" data source JNDI name here]

    jdbc.write.username=[place your user name here]
    jdbc.write.password=[place your password here]
    ```

1. Configure DXP to use the write data source (the data source whose prefix is `jdbc.write.`) to create the [Counter](https://docs.liferay.com/portal/7.3-latest/propertiesdoc/portal.properties.html#Counter) data source. A separate data source is always dedicated to the counter.

    ```properties
    counter.jdbc.prefix=jdbc.write.
    ```

1. Optionally validate the data connections to make sure bad connections are handled gracefully.

    Some connection pools used with JDBC4 (check your driver's JDBC version) validate connections automatically. Other connection pools may require additional, vendor-specific connection validation properties---specify them in a Portal Properties file. Refer to your connection pool provider documentation for connection validation details.

1. Enable the read-writer database configuration by copying the default [`spring.configs` and `spring.infrastructure.configs` Portal Properties](https://docs.liferay.com/portal/7.3-latest/propertiesdoc/portal.properties.html#Spring) to your `portal-ext.properties` file and adding the following Spring configuration file paths to them.

    Add to `spring.configs`:

    ```
        META-INF/dynamic-data-source-spring.xml
    ```

    Add to `spring.infrastructure.configs`:

    ```
    META-INF/dynamic-data-source-infrastructure-spring.xml
    ```

    For more information, see the [Spring configuration Portal Properties](https://docs.liferay.com/portal/7.3-latest/propertiesdoc/portal.properties.html#Spring).

DXP uses a read data source, a write data source, and a counter data source the next time it starts.

## Database Replication

Using a database cluster improves fault tolerance and DXP performance. Database cluster instances must be stay in sync. Replication is the process of copying changed data and changed schema from one database instance to another. All [supported databases](https://web.liferay.com/documents/14/21598941/Liferay+DXP+7.2+Compatibility+Matrix/b6e0f064-db31-49b4-8317-a29d1d76abf7) support replication. If you're using a database cluster, set up the databases for replication by following the database vendor's instructions.

## What's Next

Now that you've configured the database for your cluster, you can continue addressing the [DXP clustering requirements](./clustering-for-high-availability.md#clustering-requirements). The next requirement is to make your [File Store](../../../system-administration/file-storage/configuring-file-storage.md) accessible to all nodes and configure each node with that File Store.