# Tuning for the Data Upgrade

Upgrading impacts the database differently from daily running in production. Because of this, you should tune your database for the upgrade process before you run it, and then re-apply your production settings after the upgrade completes. 

- Disable reindexing for the data upgrade, then re-enable it after the upgrade is complete. Search indices are not needed for the upgrade itself, so reindexing will only slow the upgrade down. In extreme cases, this may cause performance issues that dramatically increase the upgrade time.

- Tune your database for executing updates. Data upgrades execute many more update statements (`INSERT`, `UPDATE`, and `DELETE`) and less `SELECT` statements than production instances.

- Data upgrades should be done in safe environments completely separate from production servers and should use database backup copies. If upgrade errors occur or you make mistakes, they don't impact production, and you can always restart using your database backup copy.

- Disable transaction logging during the data upgrade, and re-enable it after the upgrade completes. Transaction logging is not helpful during the upgrade, and only slows down the upgrade.

**Note:** The tips given here worked well in test runs on specific versions of each database. Optimal tuning depends on your own data, infrastructure conditions, and database vendor. Analyze your data, tune for upgrade, and time your test upgrades to determine the best database and Java process configuration for your Liferay DXP data upgrade.

**Important:** Test your database configuration to determine tuning that's best for your system, and consult your DBA as appropriate. **Never** use data upgrade configurations in production. Always restore your production database settings before starting your Liferay DXP server for production use with the database. 

**Contents:**

1. [Disable indexing](#disable-indexing)
1. [Tuning the Database Upgrade Java Process](#tuning-the-database-upgrade-java-process)
1. [Tuning the Database Transaction Engine for Executing Updates](#tuning-the-database-transaction-engine-for-executing-updates)
1. [Extra Tuning Configurations](#extra-tuning-configurations)


## Disable Indexing

Before starting the upgrade process in your new installation, you must disable indexing to prevent upgrade process performance issues that arise when the indexer attempts to re-index content. 

To disable indexing, create a file called `com.liferay.portal.search.configuration.IndexStatusManagerConfiguration.config` in your `[Liferay Home]/osgi/configs` folder and add the following content: 

```properties
indexReadOnly="true"
```

After you complete the upgrade, re-enable indexing by removing the `.config` file or setting `indexReadOnly="false"`.

## Tuning the Database Upgrade Java Process

Make sure to provide adequate memory for the database upgrade tool's Java process. Make sure to also set the file encoding to UTF-8 and the time zone to GMT. Here are the Java process settings:

Using a test scenario with a 3.2 GB database and a 15 GB Document Library, the following Java process settings were optimal:

- Xmx 8 GB RAM 
- File encoding UTF-8 
- User time zone GMT

Here is the `db_upgrade.sh` command corresponding to these settings:

```bash
db_upgrade.sh -j "-Xmx8000m -Dfile.encoding=UTF-8 -Duser.timezone=GMT"
```

## Tuning the Database Transaction Engine for Executing Updates 

Many more update statements are executed during data upgrade than in production. Consult your database vendor's official documentation for more help on tuning your database for this purpose. Listed below are some optimizations you can make for each database.

## Extra Tuning Configurations

You can make even more optimizations to further improve your upgrade performance. The steps used to optimize your upgrade further are database-specific, and may vary depending on your data set.

The data upgrade tuning instructions given here are a starting point for tuning your Liferay DXP data upgrade. They account for data upgrade activities and a safe data upgrade environment: 

- Deactivate data integrity measures that impact performance. Restore to a backup if failures occur.

- Disable or minimize transaction logging, because it is insignificant for data upgrades.

- Make commit-related transaction I/O operations asynchronous.

- Increase the interval to flush commits to disk.

**Warning:** Some database properties and configurations are global and affect schemas in the same database. 

### IBM DB2 

Please consult [IBM's official DB2 documentation](https://www.ibm.com/support/pages/db2-database-product-documentation-4). 

### MariaDB

Turn off InnoDB double-write and set the InnoDB flush log at transaction commit to `0`. 
 
### Microsoft SQL Server 

Set [transaction durability](https://docs.microsoft.com/en-us/sql/relational-databases/logs/control-transaction-durability) to `FORCED`. 

### MySQL 

Turn off [InnoDB double-write](https://dev.mysql.com/doc/refman/5.7/en/innodb-parameters.html#sysvar_innodb_doublewrite) and set the [InnoDB flush log at transaction commit](https://dev.mysql.com/doc/refman/5.7/en/innodb-parameters.html#sysvar_innodb_flush_log_at_trx_commit) to `0`. 

### Oracle Database 

The default configuration works well. It configures [asynchronous I/O to disk](https://docs.oracle.com/database/121/REFRN/GUID-FD8D1BD2-0F85-4844-ABE7-57B4F77D1608.htm#REFRN10048) automatically. 

### PostgreSQL 

Turn off [synchronous commits](https://www.postgresql.org/docs/10/wal-async-commit.html) and set the [write ahead log writer delay](https://www.postgresql.org/docs/10/wal-async-commit.html) to `1000` milliseconds.
