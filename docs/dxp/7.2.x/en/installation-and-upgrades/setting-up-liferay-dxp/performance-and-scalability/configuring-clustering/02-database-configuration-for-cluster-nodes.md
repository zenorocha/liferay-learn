# Database Configuration for Cluster Nodes

Each node should have a data source that points to one Liferay DXP database (or database cluster) that all the nodes share. This means that DXP cannot (and should not) use the embedded HSQL database that is shipped with the bundles. And, of course, the database server should be on a separate system from the DXP server.

## Read-Writer Database Configuration

For even better performance, you can also use a read-writer database configuration. This strategy uses two different data sources: one for read operations and the other for read-write operations. DXP's Aspect Oriented Programming (AOP) transaction infrastructure directs read transactions to one data source and read-write transactions to the other data source. 

Since all supported databases support replication, use the database vendor's replication mechanism to keep the database nodes synchronized. Set up the databases for replication first, following the database vendor's instructions. 

Then, enable separate read and read-write (write) [data sources](https://docs.liferay.com/portal/7.2-latest/propertiesdoc/portal.properties.html#JDBC) in your [`portal-ext.properties` file](../../../14-reference/02-portal-properties.md) for JDBC or JNDI. 

### JDBC

Follow these steps for using [JDBC](../../../01-installing-liferay-dxp/04-connecting-a-database.md#using-the-built-in-data-source) to connect to your read and write data sources:

1.  Set the default connection pool provider. For provider information, see the [JDBC properties reference](https://docs.liferay.com/portal/7.2-latest/propertiesdoc/portal.properties.html#JDBC). Here's the default setting:

    ```properties
    jdbc.default.liferay.pool.provider=hikaricp
    ```

1.  Configure separate read and write data sources. Here's an example:

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

1.  Use the `jdbc.write.` prefix with this setting:

    ```properties
    counter.jdbc.prefix=jdbc.write.
    ```

1.  Optionally, test database connections by setting the following queries for running before every transaction. The queries validate the connections and prevent callers from getting bad connections.

    ```properties
    jdbc.default.validationQuery=
    jdbc.read.validationQuery=SELECT releaseId FROM Release_
    jdbc.write.validationQuery=SELECT releaseId FROM Release_
    ```

1.  Enable the read-writer database configuration by uncommenting the following Spring configuration files from the `spring.configs` and `spring.infrastructure.configs` properties:

    ```properties
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

Follow these steps for using [JNDI](../../../01-installing-liferay-dxp/04-connecting-a-database.md#using-a-data-source-on-your-application-server) to connect to your read and write data sources:

1. Set your read and write JNDI data source usernames and passwords. 

    ```properties
    jdbc.read.jndi.name=**your user name**

    jdbc.read.username=**your user name**
    jdbc.read.password=**your password**

    jdbc.write.jndi.name=**your password**

    jdbc.write.username=**your user name**
    jdbc.write.password=**your password**
    ```

1.  Use the `jdbc.write.` prefix with this setting:

    ```properties
    counter.jdbc.prefix=jdbc.write.
    ```

1.  Optionally, test database connections by setting the following queries for running before every transaction. The queries validate the connections and prevent callers from getting bad connections.

    ```properties
    jdbc.default.validationQuery=
    jdbc.read.validationQuery=SELECT releaseId FROM Release_
    jdbc.write.validationQuery=SELECT releaseId FROM Release_
    ```

1.  Enable the read-writer database configuration by uncommenting the following Spring configuration files from the `spring.configs` and `spring.infrastructure.configs` properties:

    ```properties
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

DXP uses two data sources the next time it starts. 
