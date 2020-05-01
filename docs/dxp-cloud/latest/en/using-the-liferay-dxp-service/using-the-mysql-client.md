# Using the MySQL Client

Viewing data in the database can sometimes be necessary for a variety of purposes, such as troubleshooting, or to assist with custom development. Because the database is contained within the cloud in its own service, you must use an exposed client to interface directly with the database, when necessary. This feature is available in up-to-date versions of DXP Cloud, and it can be accessed in just a couple of short steps.

```note::
   Only users with administrator priveleges can make use of the MySQL client.
```

## Prerequisites

Before you can use the MySQL Client through the Liferay service, you must have your services upgraded to at least the following supported image versions:

| **Service** | **Minimum Supported Image Version** |
| --- | --- |
| **Backup** | liferaycloud/backup:3.2.11 |
| **Database** | liferaycloud/database:3.2.8 |
| **DXP (using 7.0)** | liferaycloud/liferay-dxp:7.0.10-ga1-fp90-3.0.19 |
| **DXP (using 7.1)** | liferaycloud/liferay-dxp-7.1.10-ga1-fp17-3.0.19 |
| **DXP (using 7.2)** | liferaycloud/liferay-dxp-7.2.10-sp1-fp4-3.0.19 |

If you have not yet deployed the database service on a supported version, then you can set your own password for the default user by setting the `LCP_DATABASE_READONLY_USER_PASSWORD` environment variable in the database service's `LCP.json`.

```warning:: 
   If you have already started up your database using a version that supports the MySQL client, then the default user will already be initialized with a default password. This password cannot be changed later, so you must add the LCP_DATABASE_READONLY_USER_PASSWORD environment variable before you deploy the database service (either for the first time, or updating the image version). Otherwise, you must use the default, generated password. 
```

Then, update to these versions (or newer) and [re-deploy the services](../build-and-deploy/walking-through-the-deployment-life-cycle.md) so that the MySQL client is available for use.

## Accessing the MySQL Client

1. Log into the DXP Cloud console.

1. Navigate to the correct environment, and click _Services_:

1. Click on the _liferay_ service.

1. If you set your own password for the default user with the `LCP_DATABASE_READONLY_USER_PASSWORD`, then add the same environment variable to your `liferay` service. Otherwise, do not add this variable, so that the service uses the default password.

   You can add this variable by clicking on the _Environment Variables_ tab within the `liferay` service:

   ![Click the Environment Variables tab to configure the password if necessary.]

1. Click on the _Shell_ tab:

1. Type `mysql` into the shell on this screen. This logs you into the MySQL client, where you can perform any read-only queries.

You have now successfully logged in as the default user.

### Logging in with Read and Write Priveleges

The default user can only perform read queries on the database, and cannot manipulate data. This prevents accidental modifications that may corrupt data within Liferay.

However, if it is **critical** to be able to manipulate data in the database, then you can also login using the database credentials by typing this command into the shell (instead of only `mysql`):

```bash
mysql -u USER_NAME -p DATABASE_NAME
```

Enter the database user's password at the prompt to authenticate as a user with read and write priveleges.