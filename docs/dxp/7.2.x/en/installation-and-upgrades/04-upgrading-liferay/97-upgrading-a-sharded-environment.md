# Upgrading a Sharded Environment

Since Liferay DXP 7.0, Liferay removed its own physical partitioning implementation (also known as sharding) in favor of the capabilities provided natively by database vendors. Upgrading a sharded installation to DXP 7.0 or higher requires migrating it to as many non-sharded Liferay DXP installations (servers) as you have shards. These steps guide you through configuring the new Liferay DXP servers to use your formerly sharded data.

> **Note:** Liferay continues to support its logical partitioning capabilities (also known as [virtual instances](https://help.liferay.com/hc/en-us/articles/360028818692-Setting-Up-a-Virtual-Instance)).

## Add Configurations Before the Data Upgrade

In addition to other configurations, you will need to set more properties to migrate your shards to virtual instances for your data upgrade. See [Configuring the Data Upgrade Tool](./07-configuring-the-data-upgrade-tool.md) for more information on other configurations.

Here is how to configure the upgrade to migrate from sharding:

1. Copy all of the shard JDBC connection properties from `portal-ext.properties` to`portal-upgrade-database.properties`. For example, JDBC connections for a default shard and two non-default shards might look like this:

    ```properties
    jdbc.default.driverClassName=com.mysql.jdbc.Driver
    jdbc.default.url=jdbc:mysql://database-server/lportal?characterEncoding=UTF-8&dontTrackOpenResources=true&holdResultsOpenOverStatementClose=true&useFastDateParsing=false&useUnicode=true
    jdbc.default.username=
    jdbc.default.password=

    jdbc.one.driverClassName=com.mysql.jdbc.Driver
    jdbc.one.url=jdbc:mysql://database-server/lportal_one?characterEncoding=UTF-8&dontTrackOpenResources=true&holdResultsOpenOverStatementClose=true&useFastDateParsing=false&useUnicode=true
    jdbc.one.username=
    jdbc.one.password=

    jdbc.two.driverClassName=com.mysql.jdbc.Driver
    jdbc.two.url=jdbc:mysql://database-server/lportal_two?characterEncoding=UTF-8&dontTrackOpenResources=true&holdResultsOpenOverStatementClose=true&useFastDateParsing=false&useUnicode=true
    jdbc.two.username=
    jdbc.two.password=
    ```

1. Set the JDBC *default* connection properties in each server's `portal-upgrade-database.properties` to specify the associated shard.

    * Add the original JDBC properties for the respective non-default shard database. For example, shard `one`'s original properties might start with `jdbc.one`:

    ```properties
    jdbc.one.driverClassName=com.mysql.jdbc.Driver
    jdbc.one.url=jdbc:mysql://database-server/lportal_one?characterEncoding=UTF-8&dontTrackOpenResources=true&holdResultsOpenOverStatementClose=true&useFastDateParsing=false&useUnicode=true
    jdbc.one.username=
    jdbc.one.password=
    ```

    * Rename the properties to start with `jdbc.default`. For example:

    ```properties
    jdbc.default.driverClassName=com.mysql.jdbc.Driver
    jdbc.default.url=jdbc:mysql://database-server/lportal_one?characterEncoding=UTF-8&dontTrackOpenResources=true&holdResultsOpenOverStatementClose=true&useFastDateParsing=false&useUnicode=true
    jdbc.default.username=
    jdbc.default.password=
    ```

## Upgrade and Update Properties

When you perform the data upgrade, upgrade the default shard first, and then each of the non-default shards. See [Upgrading the Core Using the Upgrade Tool](./08-using-the-upgrade-tool.md) for more information on running the data upgrade.

After the data upgrade has been completed, make the following configuration changes to your application servers:

1. In each server's `portal-ext.properties`, use the JDBC *default* properties you specified in the `portal-upgrade-database.properties` (see the *default* properties above).

1. Remove the non-default shard JDBC properties from the default shard server's `portal-ext.properties` file, leaving only the default shard database `jdbc.default` properties. For example:

    Old JDBC properties:

    ```properties
    jdbc.default.driverClassName=com.mysql.jdbc.Driver
    jdbc.default.url=jdbc:mysql://database-server/lportal?characterEncoding=UTF-8&dontTrackOpenResources=true&holdResultsOpenOverStatementClose=true&useFastDateParsing=false&useUnicode=true
    jdbc.default.username=
    jdbc.default.password=

    jdbc.one.driverClassName=com.mysql.jdbc.Driver
    jdbc.one.url=jdbc:mysql://database-server/lportal_one?characterEncoding=UTF-8&dontTrackOpenResources=true&holdResultsOpenOverStatementClose=true&useFastDateParsing=false&useUnicode=true
    jdbc.one.username=
    jdbc.one.password=

    jdbc.two.driverClassName=com.mysql.jdbc.Driver
    jdbc.two.url=jdbc:mysql://database-server/lportal_two?characterEncoding=UTF-8&dontTrackOpenResources=true&holdResultsOpenOverStatementClose=true&useFastDateParsing=false&useUnicode=true
    jdbc.two.username=
    jdbc.two.password=
    ```

    New JDBC properties:

    ```properties
    jdbc.default.driverClassName=com.mysql.jdbc.Driver
    jdbc.default.url=jdbc:mysql://database-server/lportal?characterEncoding=UTF-8&dontTrackOpenResources=true&holdResultsOpenOverStatementClose=true&useFastDateParsing=false&useUnicode=true
    jdbc.default.username=
    jdbc.default.password=
    ```

Once you have completed all of these steps, you have migrated off of a sharded environment to virtual instances on separate Liferay DXP servers together with your upgrade to DXP 7.2.
