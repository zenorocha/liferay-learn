# Configuring a Database

By default for demonstration purposes, Liferay DXP is configured to use an embedded HSQL database. Beyond demonstration purposes, we recommend using a full-featured, supported RDBMS, such as:

* MySQL
* MariaDB
* Oracle
* PostgreSQL

> **Note:** The [Liferay DXP Compatibility Matrix](https://web.liferay.com/documents/14/21598941/Liferay+DXP+7.2+Compatibility+Matrix/b6e0f064-db31-49b4-8317-a29d1d76abf7) lists the supported databases and versions.

<!-- TODO Update the matrix link to the 7.3 matrix, when it's published - jhinkey -->

Configure the database:

1. Use the GMT time zone on your database server.

1. Create a database that uses UTF-8. Here is a MySQL command example:

    ```sql
    create database lportal character set utf8;
    ```

1. Set up a database user with full database permissions. If your organization requires the DXP database user to have limited database access, see [High Security Database User Practices](../14-reference/database-configuration.md#high-security-database-user-practices).

1. Install a JDBC Connector. The DXP bundle includes several open source JDBC connectors in the `/lib/ext` folder. Connectors for proprietary database, like Oracle or DB2 (see the table below), must be downloaded from the vendor.

    **Proprietary Databases:**

    | Database | Connector | Vendor Site | Notes |
    | :------- | :-------- | :---------- | :---- |
    | Oracle | `ojdbc8.jar` | [Oracle](https://www.oracle.com/index.html) | The `ojdbc8.jar` library with at least Oracle 12.2.0.1.0 JDBC 4.2 versioning is required because of [data truncation issues](https://issues.liferay.com/browse/LPS-79229) that have been detected reading data from CLOB columns. |
    | DB2 | `db2jcc4.jar` | [IBM](https://www.ibm.com/) |  The `dbc2jcc` connector has been deprecated after 3.72. |

Congratulations! You configured a database for Liferay DXP.

> **Note:** For database configuration details, see the [Database Configuration Reference](../14-reference/database-configuration.md)

## Next steps

* [Running Liferay DXP for the First Time](./running-liferay-dxp-for-the-first-time.md)
