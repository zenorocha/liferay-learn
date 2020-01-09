# Database Configuration for Cluster Nodes

Each node should have a data source that points to one Liferay DXP database (or database cluster) that all the nodes share. This means that DXP cannot (and should not) use the embedded HSQL database that is shipped with the bundles. And, of course, the database server should be set up on a separate system from the DXP server.

## Database Replication

Database clusters support high availability and improve DXP performance. Database clustering requires databases to stay in sync. Replication is the process of copying changed data and changed schema from one database instance to another. All supported databases support replication. If you're using a database cluster, set up the databases for replication by following the database vendor's instructions.

## Read-Writer Database Configuration

For even better performance, you can also use a read-writer database configuration. This strategy uses two different data sources: one for read operations and the other for read-write operations. DXP's Aspect Oriented Programming (AOP) transaction infrastructure directs read transactions to the read data source and read-write transactions to the write data source.

Connections to separate read and write [data sources](https://docs.liferay.com/portal/7.2-latest/propertiesdoc/portal.properties.html#JDBC) are configured using JDBC or JNDI [Portal Properties](../../../installation-and-upgrades/14-reference/03-portal-properties.md) (e.g., in a [`portal-ext.properties` file](../../../14-reference/02-portal-properties.md)), as explained in the following sections.

### JDBC

Follow these steps to use [JDBC](../../../01-installing-liferay-dxp/04-connecting-a-database.md#using-the-built-in-data-source) to connect directly to your read and write data sources:

1. Set the default connection pool provider. For provider information, see the [JDBC properties reference](https://docs.liferay.com/portal/7.2-latest/propertiesdoc/portal.properties.html#JDBC). The default setting specifies [HikariCP](https://github.com/brettwooldridge/HikariCP) as the pool provider:

    ```properties
    jdbc.default.liferay.pool.provider=hikaricp
    ```

1. Configure JDBC connections to your separate read and write data sources. Here's an example:

    ```properties
    jdbc.read.driverClassName=com.mysql.jdbc.Driver
    jdbc.read.url=jdbc:mysql://dbread.com/lportal?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false
    jdbc.read.username=**your user name**
    jdbc.read.password=**your password**

    jdbc.write.driverClassName=com.mysql.jdbc.Driver
    jdbc.write.url=jdbc:mysql://dbreadwrite.com/lportal?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false
    jdbc.write.username=**your user name**
    jdbc.write.password=**your password**
    ```

1. A separate data source is always dedicated to the counter. Apply the following setting so that DXP uses the write data source (with the prefix `jdbc.write.`) to create the [Counter](https://docs.liferay.com/dxp/portal/7.2-latest/propertiesdoc/portal.properties.html#Counter) data source:

    ```properties
    counter.jdbc.prefix=jdbc.write.
    ```

1. Validating a database connection before using it, lets you handle bad connections gracefully. Validation is optional and might have a small cost, but avoids bad connections. Connection pools used with JDBC4 (check your driver's JDBC version) validate connections automatically.

> **Note:** For JDBC3 or older, connection pools may require additional, vendor-specific connection validation properties. Specify these properties in a Portal Properties file for them to be passed to the appropriate connection pool. For example, for a connection `jdbc.read.*`, third-party properties of the following form are passed to the connection pool:
>
> ```
> jdbc.read.someVendorConnectionTestProperty=[test value]
> ```
>
> Refer to your connection pool provider documentation for details on the specific connection validation properties.

1. Enable the read-writer database configuration by uncommenting the following Spring configuration files from the `spring.configs` and `spring.infrastructure.configs` properties:

    ```
    spring.configs=\
        [..]
        META-INF/dynamic-data-source-spring.xml,\
        [..]

    spring.infrastructure.configs=\
        [..]
        META-INF/dynamic-data-source-infrastructure-spring.xml,\
        [..]
    ```

    For more information, see the [Spring configuration portal properties](https://docs.liferay.com/portal/7.2-latest/propertiesdoc/portal.properties.html#Spring).

### JNDI

Follow these steps to use [JNDI](../../../01-installing-liferay-dxp/04-connecting-a-database.md#using-a-data-source-on-your-application-server) to connect to your read and write data sources on your app server:

1. Set your read and write JNDI data source usernames and passwords.

    ```properties
    jdbc.read.jndi.name=**your user name**

    jdbc.read.username=**your user name**
    jdbc.read.password=**your password**

    jdbc.write.jndi.name=**your password**

    jdbc.write.username=**your user name**
    jdbc.write.password=**your password**
    ```

1. Apply the following setting so that DXP uses the write data source (the data source whose prefix is `jdbc.write.`) to create the [Counter](https://docs.liferay.com/portal/7.2-latest/propertiesdoc/portal.properties.html#Counter) data source. A separate data source is always dedicated to the counter.

    ```properties
    counter.jdbc.prefix=jdbc.write.
    ```

1. Validating a database connection before using it, lets you handle bad connections gracefully. Validation is optional and might have a small cost, but avoids bad connections.

    Some connection pools used with JDBC4 (check your driver's JDBC version) validate connections automatically. Other connection pools may require additional, vendor-specific connection validation properties. Specify them in a Portal Properties file. Refer to your connection pool provider documentation for connection validation details.

1. Enable the read-writer database configuration by uncommenting the following Spring configuration files from the `spring.configs` and `spring.infrastructure.configs` properties:

    ```
    spring.configs=\
        [..]
        META-INF/dynamic-data-source-spring.xml,\
        [..]

    spring.infrastructure.configs=\
        [..]
        META-INF/dynamic-data-source-infrastructure-spring.xml,\
        [..]
    ```

    For more information, see the [Spring configuration portal properties](https://docs.liferay.com/portal/7.2-latest/propertiesdoc/portal.properties.html#Spring).

DXP uses a read data source, a write data source, and a counter data source the next time it starts.

## Additional Information

[Connecting a Database](../../../01-installing-liferay-dxp/04-connecting-a-database.md)
[Introduction to Clustering Liferay DXP](./01-introduction-to-clustering-liferay-dxp.md)
