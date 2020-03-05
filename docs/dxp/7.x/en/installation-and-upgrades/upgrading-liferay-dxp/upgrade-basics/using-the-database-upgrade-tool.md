# Using the Database Upgrade Tool

The Liferay Database Upgrade Tool is a client program for upgrading DXP databases offline. Modifying a database while it's detached from DXP allows you to do these things:

* [Tune the database for upgrade operations](../upgrade-stability-and-performance/database-tuning-for-upgrades.md)
* [Prune unnecessary data](../upgrade-stability-and-performance/database-tuning-for-upgrades.md) (e.g., unneeded versions of Web Content, Documents, and more) to improve upgrade performance
* Resolve upgrade issues

The topics mentioned above are especially important for upgrading large, enterprise-level DXP environments safely and as quickly as possible. The [Upgrade Overview](./upgrade-overview.md) introduces the topics and links to articles that demonstrate them. After you've accounted for the tasks described in these upgrade topics, you're ready to upgrade the database using the upgrade tool.

```warning::
   **Always** `back up <../../10-maintaining-a-liferay-dxp-installation/backing-up.md>`_ your data and installation before upgrading. Testing the upgrade process on backup copies is advised.
```

```important::
   If you're upgrading from 6.2 or earlier, update your file store configuration. See the `Updating the File Store <../configuration-and-infrastructure/updating-the-file-store.md>`_ for more information.
```

## Installing and Configuring the Upgrade Tool

The Liferay DXP Tomcat Bundle includes the upgrade tool in this folder:

```
[Liferay Home]/tools/portal-tools-db-upgrade-client
```

The tool is available to download separately, as described in the table below.

| DXP Edition | Download Instructions |
| :---------- | :-------------------- |
| Liferay DXP (Subscription) | Go to the [*Downloads* page](https://customer.liferay.com/group/customer/downloads) and select the DXP version and the _Product/Service Packs_ file type. In the listing that appears, click _Download_ for the _Liferay DXP Upgrade Client_. |
| _Liferay DXP CE_ | Go to the [_Downloads_ page](https://www.liferay.com/downloads-community) and select _Download_ for _Liferay Portal Tools for 7.x_. |

You can a configure the upgrade before invoking the upgrade tool using properties files or at the start of the upgrade tool run using the tool's command line interface (CLI). Both ways produce properties files that specify the database connection, DXP and application server library locations, and required portal properties. To create the properties files ahead of time, follow the [Upgrade Tool Reference](../reference/database-upgrade-tool-reference.md). Otherwise, configure the upgrade on the fly as you run the upgrade tool next.

## Upgrade Tool Usage

The `db_upgrade.sh` script in the `[Liferay Home]/tools/portal-tools-db-upgrade-client` folder invokes the upgrade tool. The `--help` option describes the tool's usage.

```bash
db_upgrade.sh --help
```

You can specify a log file using these parameters:

```
-l <logfile>
```

You can pass in JVM parameters using this format:

```
-j "<JVM Options>"
```

You should specify the `UTF-8` file encoding and the `GMT` user time zone as JVM options. Since the database upgrade tool operates on your DXP database, you should also configure the upgrade tool with the same JVM options that you use for your DXP application server. If you used country and language JVM options, specify them for the upgrade tool. While you're at it, you should allocate the initial memory (`-Xmx value`) for the upgrade tool too. Use 2 GB at a minimum. If your DXP database has over 10 GB of data, increase the initial memory.

Here's an example command that specifies JVM options and a log file:

```bash
db_upgrade.sh -j "-Dfile.encoding=UTF-8 -Duser.timezone=GMT -Xmx2048m" -l "output.log"
```

## Running the Upgrade Tool

Here's how you run an upgrade using the tool:

1. Set up a new [Liferay Home](../../reference/liferay-home.md) folder with the contents of your current Liferay Home.

    ```bash
    cp /old-version/liferay-home/ /new-version/liferay-home/
    ```
    If your current Liferay Home is in source control, create a new branch.

    ```bash
    git checkout -b new-version
    ```

1. Make sure you're using the JDBC database driver your database vendor recommends. If you're using MySQL, for example, set `jdbc.default.driverClassName=com.mysql.cj.jdbc.Driver` in `portal-ext.properties` and replace the MySQL JDBC driver JAR your app server uses. See this [Database Drivers](../configuration-and-infrastructure/migrating-configurations-and-properties.md#database-drivers) for more details.

1. Execute the upgrade tool:

    ```bash
    cd [Liferay Home]/tools/portal-tools-db-upgrade-client
    db_upgrade.sh -j "-Dfile.encoding=UTF-8 -Duser.timezone=GMT -Xmx2048m" -l "output.log"
    ```

   If you haven't created [upgrade properties files](../reference/database-upgrade-tool-reference.md), the upgrade tool prompts you for configuration values, and shows default values in parentheses. Here's an example interaction:

    ```
    Please enter your application server (tomcat):
    tomcat

    Please enter your application server directory (../../tomcat-9.0.17):

    Please enter your extra library directories (../../tomcat-9.0.17/bin):

    Please enter your global library directory (../../tomcat-9.0.17/lib):

    Please enter your portal directory (../../tomcat-9.0.17/webapps/ROOT):

    [ db2 mariadb mysql oracle postgresql sqlserver sybase ]
    Please enter your database (mysql):
    mariadb

    Please enter your database host (localhost):

    (etc.)
    ```

    To use the default value shown in a prompt, press enter.

    After configuration is complete, the upgrade starts. You can monitor the log file. Log messages are reported for the start and completion of each upgrade process.

1. After the upgrade completes, check the log for any database upgrade failures or errors. You can use [Gogo Shell commands](../upgrade-stability-and-performance/upgrading-modules-using-gogo-shell.md) to troubleshoot them and finish the upgrades.

1. Prepare for testing DXP by undoing any upgrade-specific tuning and reviewing the [Post-Upgrade Considerations](./post-upgrade-considerations.md).

1. Start your server and validate DXP with its upgraded database.

    ![Here is the Liferay DXP landing screen.](./using-the-database-upgrade-tool/images/01.png)

You've upgraded your DXP database using the upgrade tool.

If this was a trial upgrade and you want to shorten the upgrade time, tune your database for upgrade (if you haven't already) and if you suspect there's unnecessary data you can prune from the database, go [prune it](../upgrade-stability-and-performance/database-pruning-for-faster-upgrades.md). Then do another trial upgrade on DXP data backup copy. Otherwise, congratulations on your completed data upgrade!

## Next Steps

Revisit the [Upgrade Overview](./upgrade-overview.md) to see what's left to upgrade.