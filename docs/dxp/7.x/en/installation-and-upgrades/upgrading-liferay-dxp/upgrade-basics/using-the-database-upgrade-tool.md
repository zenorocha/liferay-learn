# Using the Database Upgrade Tool

The Liferay Database Upgrade Tool is a client program for upgrading DXP databases offline. Modifying a database while it's detached from DXP allows you to do these things:

* [Tune the database for upgrade operations](../upgrade-stability-and-performance/database-tuning-for-upgrades.md)
* [Prune unnecessary data](../upgrade-stability-and-performance/database-tuning-for-upgrades.md) (e.g., unneeded versions of Web Content, Documents, and more) to improve upgrade performance
* Resolve upgrade issues

The topics mentioned above are especially important for upgrading large, enterprise-level DXP environments safely and as quickly as possible. After you've accounted for tuning and pruning the database and completing relevant tasks described in the [Upgrade Overview](./upgrade-overview.md), you're ready to upgrade the database using the upgrade tool.

```warning::
   **Always** `back up <../../maintaining-a-liferay-dxp-installation/backing-up.md>`_ your data and installation before upgrading. Testing the upgrade process on backup copies is advised.
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
| Liferay DXP CE | Go to the [_Downloads_ page](https://www.liferay.com/downloads-community) and select _Download_ for _Liferay Portal Tools for 7.x_. |

Configure the upgrade tool by running it using the tool's command line interface, or by [using properties files](../reference/database-upgrade-tool-reference.md#manual-configuration).

## Upgrade Tool Usage

The `db_upgrade.sh` script in the `[Liferay Home]/tools/portal-tools-db-upgrade-client` folder invokes the upgrade tool. The `--help` option describes the tool's usage.

```bash
db_upgrade.sh --help
```

You can specify a log file using these parameters:

```
-l <logfile>
```

JVM options are passed in using this format:

```
-j "<JVM Options>"
```

### Upgrade Tool JVM Option Recommendations

Configure the upgrade tool with the same JVM options that you use for your DXP application server. File encoding (`UTF-8`), time zone (`GMT`), country, language, and memory settings (`-Xmx value`) should all match your application server's settings. For databases with >= 10 GB of data, we recommend allocated additional memory over the 2 GB default.

Here's an example command that specifies JVM options and a log file:

```bash
db_upgrade.sh -j "-Dfile.encoding=UTF-8 -Duser.timezone=GMT -Xmx2048m" -l "output.log"
```

## Running the Upgrade Tool

To upgrade the database using the tool:

1. Set up a new [Liferay Home](../../reference/liferay-home.md) folder with the contents of your current Liferay Home.

    ```bash
    cp /old-version/liferay-home/ /new-version/liferay-home/
    ```

    If your current Liferay Home is in source control, create a new branch.

    ```bash
    git checkout -b new-version
    ```

1. Make sure you're using the JDBC database driver your database vendor recommends. If you're using MySQL, for example, set `jdbc.default.driverClassName=com.mysql.cj.jdbc.Driver` in [`portal-ext.properties`](../../reference/portal-properties.md) and replace the MySQL JDBC driver JAR your app server uses. See [Database Drivers](../configuration-and-infrastructure/migrating-configurations-and-properties.md#database-drivers) for more details.

1. Execute the upgrade tool. Here's an example command:

    ```bash
    cd /new-version/liferay-home/tools/portal-tools-db-upgrade-client
    db_upgrade.sh -j "-Dfile.encoding=UTF-8 -Duser.timezone=GMT -Xmx2048m" -l "output.log"
    ```

   If you haven't created [upgrade properties files](../reference/database-upgrade-tool-reference.md#manual-configuration), the upgrade tool prompts you for configuration values, and shows default values in parentheses. Here's an example interaction:

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

    If you want to use the default value shown in a prompt, press enter.

    After configuration is complete, the upgrade starts. You can monitor the log file. Log messages are reported for the start and completion of each upgrade process.

1. After the upgrade completes, check the log for any database upgrade failures or errors. You can use [Gogo Shell commands](../upgrade-stability-and-performance/upgrading-modules-using-gogo-shell.md) to troubleshoot them and finish the upgrades.

1. Prepare for testing DXP by undoing any upgrade-specific tuning and reviewing the [Post-Upgrade Considerations](./post-upgrade-considerations.md).

1. Start your server and validate DXP with its upgraded database.

    ![Here is the Liferay DXP landing screen.](./using-the-database-upgrade-tool/images/01.png)

You've upgraded your DXP database using the upgrade tool.

If this was a trial upgrade and you want to shorten the upgrade time, tune your database for upgrade (if you haven't already) and [review for and remove unnecessary data](../upgrade-stability-and-performance/database-pruning-for-faster-upgrades.md) from the database. Repeat this article as necessary.

## Next Steps

Revisit the [Upgrade Overview](./upgrade-overview.md) to see what's left to upgrade.
