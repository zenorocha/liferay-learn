# Database Tuning for Upgrades

Performing an upgrade impacts the database differently from daily running in production. Because of this, you should tune your database for the upgrade process before you run it, and then re-apply your production settings after the upgrade completes.

```note::
The tips given in this article worked well in test runs on specific versions of each database. Optimal tuning depends on your own data, infrastructure conditions, and database vendor. Analyze your data, tune for upgrade, and time your test upgrades to determine the best database and Java process configuration for your Liferay DXP data upgrade.
```

Many more update statements are executed during data upgrade than in production. As such, here are some ways to tune your database for database upgrades:

* Deactivate data integrity measures that impact performance. Restore to a backup if failures occur.

* Disable or minimize transaction logging, because it is insignificant for data upgrades.

* Make commit-related transaction I/O operations asynchronous.

* Increase the interval to flush commits to disk.

```warning::
   Some database properties and configurations are global and affect schemas in the same database.
```

The sections below link to vendor-specific information on tuning each database in the ways mentioned above.

## IBM DB2

Please consult [IBM's official DB2 documentation](https://www.ibm.com/support/pages/db2-database-product-documentation-4).

## MariaDB

Turn off InnoDB double-write and set the InnoDB flush log at transaction commit to `0`.

## Microsoft SQL Server

Set [transaction durability](https://docs.microsoft.com/en-us/sql/relational-databases/logs/control-transaction-durability) to `FORCED`.

## MySQL

Turn off [InnoDB double-write](https://dev.mysql.com/doc/refman/5.7/en/innodb-parameters.html#sysvar_innodb_doublewrite) and set the [InnoDB flush log at transaction commit](https://dev.mysql.com/doc/refman/5.7/en/innodb-parameters.html#sysvar_innodb_flush_log_at_trx_commit) to `0`.

## Oracle Database

The default configuration works well. It configures [asynchronous I/O to disk](https://docs.oracle.com/database/121/REFRN/GUID-FD8D1BD2-0F85-4844-ABE7-57B4F77D1608.htm#REFRN10048) automatically.

## PostgreSQL

Turn off [synchronous commits](https://www.postgresql.org/docs/10/wal-async-commit.html) and set the [write ahead log writer delay](https://www.postgresql.org/docs/10/wal-async-commit.html) to `1000` milliseconds.

## Conclusion

When you're done upgrading, make sure revert your database configurations back to their production settings.
