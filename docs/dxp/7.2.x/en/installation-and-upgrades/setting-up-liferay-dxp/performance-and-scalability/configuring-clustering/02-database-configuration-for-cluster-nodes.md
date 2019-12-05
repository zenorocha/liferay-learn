# Database Configuration for Cluster Nodes

Each node should have a data source that points to one Liferay DXP database (or a database cluster) that all the nodes share. This means that DXP cannot (and should not) use the embedded HSQL database that is shipped with the bundles. And, of course, the database server should be on a separate system from the DXP server.

## Read-Writer Database Configuration

For even better performance, you can also use a read-writer database configuration. This strategy uses two different data sources for reading and writing, so you can split your database infrastructure into two sets: one optimized for reading and one optimized for writing. Since all supported databases support replication, use your database vendor's replication mechanism to keep the database nodes in sync.

Set up the databases for replication first. See your database vendor's website for information on setting your database up for replication.

Then, enable a read-writer database in your `portal-ext.properties` file:

1.  If you're not using JNDI, set the default database connection pool provider to `dbcp`, `tomcat`, or `c3po`. Note that provider HikariCP does not support read/write splitting. Here's an example setting using `dbcp`: 

    ```properties
    jdbc.default.liferay.pool.provider=dbcp
    ```

    All the portal JDBC configuration properties are documented [here](https://docs.liferay.com/portal/7.2-latest/propertiesdoc/portal.properties.html#JDBC).

    Skip to step 3 to use JNDI. 

2.  If you are using JDBC data sources (and not JNDI), then configure two different data sources -- one for reading, and one for writing:

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

    Alternatively, if you are using JNDI instead of the JDBC data sources, set the same `*.username` and `*.password` properties to your JNDI user name and password and set these additional properties:

    ```properties
    jdbc.read.jndi.name=**your read JNDI name**
    jdbc.write.jndi.name=**your read-write JNDI name**
    ```

3.  Avoid using the `default` data source by setting this:

    ```properties
    counter.jdbc.prefix=jdbc.write.
    ```

    And if you're using a `dbcp` or `tomcat` database connection pool provider, set these:

    ```properties
    jdbc.default.validationQuery=
    jdbc.read.validationQuery=SELECT releaseId FROM Release_
    jdbc.write.validationQuery=SELECT releaseId FROM Release_
    ```

    These settings are related to issue [LPS-64624](https://issues.liferay.com/browse/LPS-64624).

5.  Enable the read-writer database configuration by uncommenting the following Spring configuration files from the `spring.configs` and `spring.infrastructure.configs` properties:

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

    The Spring configuration portal properties are documented [here](https://docs.liferay.com/portal/7.2-latest/propertiesdoc/portal.properties.html#Spring).

The next time you start DXP, it will use the two data sources you have defined. 
