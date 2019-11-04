# Preparing the Database

## Introduction

One of the requirements for Liferay DXP to run is a database. The list of certified databases is found on the DXP [7.2 Compatibility Matrix](https://web.liferay.com/documents/14/21598941/Liferay+DXP+7.2+Compatibility+Matrix/b6e0f064-db31-49b4-8317-a29d1d76abf7?). There is a HSQL database embedded in the bundle which is useful for demonstration purposes. For production environments and enterprise deployments, use a more robust database.

Note that Liferay does not recommend or endorse specific third-party products over others. Liferay is not responsible for any instructions herein or referenced regarding these products. Any implementation of these principles is the responsibility of the subscriber.

## Roadmap

* [Initial Configurations](#initial-configurations)
* [Required Jars](#required-jars)
* [Connecting Your Database](#connecting-your-database)
* [Next Steps](#next-steps)

## Initial Configurations

The following steps are executed in the database server (for example, MySQL). Database Administrators (DBAs) should always consult the vendor’s documentation first before making any changes.

* Configure the database server to use the GMT time zone.
* Create a blank database that uses UTF-8 character set encoding.
    >Note: If migrating from one database vendor to another, [configure the database to use the desired default query result order](https://help.liferay.com/hc/en-us/articles/360029315971-Sort-Order-Changed-with-a-Different-Database).
* Create a database user for accessing this database. Grant this database user all rights, including the rights to create and drop tables, to the blank Liferay DXP database.

Liferay DXP uses this database user's credentials to connect to the database either directly or through its application server. Once connected to the database, Liferay DXP creates its tables in the database automatically and are complete with indexes.

This is the recommended way to set up Liferay DXP. It enables Liferay DXP to maintain its database automatically during upgrades or when various Liferay DXP plugins that create database tables of their own are installed. This method is by far the best way to set up your database.

### Limiting Database Access

Even though it is recommended for Liferay DXP to use the same database user to create and maintain its database automatically, stringent security practices might require revoking database initialization and maintenance permissions from that user once the database is initialized. If permissions for Select, Insert, Update and Delete operations are the only ones allowed for that user, administrators must initialize and maintain the database manually (even though it is not recommended).

The instructions below are not ideal for Liferay DXP installations. Rather, the following procedure is documented so that enterprises with more restrictive standards can install Liferay DXP with stricter (but sub-optimal) database settings.

1. Create a new blank database for Liferay DXP.
1. Grant full rights for the Liferay DXP database user to do anything to the database.
1. Install Liferay DXP and start it so that it automatically populates the database.
1. Once the database has been populated with the Liferay DXP tables, remove all permissions from that user except permissions to perform Select, Insert, Update and Delete operations.

There are some caveats to running Liferay DXP like this. Many plugins create new tables when they’re deployed. Additionally, administrators must run the database upgrade function to upgrade Liferay DXP. If the Liferay DXP database user does not have adequate rights to create/modify/drop tables in the database, administrators must grant those rights to that user before deploying one of these plugins or start upgrading Liferay DXP. Once the tables are created or the upgrade completes, administrators can remove those rights until the next deploy or upgrade. Additionally, developers might create plugins that must create their own tables. These are just like Liferay DXP plugins that do the same thing, and they can only be installed if Liferay DXP can create database tables. Installing these plugins requires granting the Liferay DXP database user rights to create tables in the database before attempting to install the plugins.

## Required Jars

The Liferay DXP bundle already includes many supported jar files to connect to a database listed in the Compatibility Matrix. These files are normally located in a global `/lib/ext` (for example, Tomcat) or `module` (JBoss EAP and Wildfly 10) folder. However, if using an Oracle or IBM database, additional files are required.

If using an Oracle database, the `ojdbc8.jar` is required. Download the jar from Oracle. The `ojdbc8.jar` driver library with at least Oracle 12.2.0.1.0 JDBC 4.2 versioning is required because [data truncation issues](https://issues.liferay.com/browse/LPS-79229) have been detected reading data from CLOB columns.
If using an IBM database, the `db2jcc4.jar` is required. Download the jar from IBM. Note that the dbc2jcc has been deprecated after 3.72.

Before starting the application server, add the jar with the other required jars in the application server’s `/lib/ext` or `module` folder.

## Connecting Your Database

Administrators can connect Liferay DXP with your database using Liferay DXP’s built-in data source (recommended) or using a data source you create on your app server.

### Using the Built-In Data Source

Administrators can configure the built-in data source from the [Basic Configuration page](https://help.liferay.com/hc/en-us/articles/360028711012-Installing-Liferay-DXP#using-the-setup-wizard) (available when Liferay DXP starts up the first time) or by specifying it using portal properties.

If using portal properties:

1. Create a [`portal-ext.properties`](https://help.liferay.com/hc/en-us/articles/360028712292-Portal-Properties) file if one does not already exist.
1. Copy a set of `jdbc.*` properties from one of the [JDBC templates](https://help.liferay.com/hc/en-us/articles/360028712332-Database-Templates) into the `portal-ext.properties` file.
1. Modify the `jdbc.*` property values to specify the database and database user credentials.
1. Put the `portal-ext.properties` file into the [`LIFERAY_HOME`](https://help.liferay.com/hc/en-us/articles/360028712272-Liferay-Home) once it has been created based on the specific installation.

Liferay DXP connects to the data source on startup.

### Using a Data Source on Your Application Server

If using the application server to manage the data source, review the documentation for each application server.

* [Installing Liferay DXP on Tomcat](https://help.liferay.com/hc/en-us/articles/360029031491-Installing-Liferay-DXP-on-Tomcat#database-configuration)
* [Installing Liferay DXP on Wildfly](https://help.liferay.com/hc/en-us/articles/360029123751-Installing-Liferay-DXP-on-Wildfly#database-configuration)
* [Installing Liferay DXP on JBoss EAP](https://help.liferay.com/hc/en-us/articles/360028810012-Installing-Liferay-DXP-on-JBoss-EAP#database-configuration)
* [Installing Liferay DXP on WebLogic 12c R2](https://help.liferay.com/hc/en-us/articles/360028831932-Installing-Liferay-DXP-on-WebLogic-12c-R2#database-configuration)
* [Installing Liferay DXP on WebSphere](https://help.liferay.com/hc/en-us/articles/360028810032-Installing-Liferay-DXP-on-WebSphere#database-configuration)

## Next steps

Once the database server has been configured and a DB has been created, proceed to [Install Liferay DXP]().
