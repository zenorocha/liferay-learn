# Migrating from an On-Premises DXP Installation

This article will walk you through the essential steps for migrating your 
existing Liferay DXP instance to DXP Cloud. 

1. [Migrate the Database and Document Library](#migrate-the-database-and-document-library)
1. [Copy Liferay DXP Configurations](#copy-liferay-dxp-configurations)
1. [Add Service Configurations](#add-service-configurations)
1. [Use a VPN to Connect External Services](#use-a-vpn-to-connect-external-services)

## Migrate the Database and Document Library

The most important part of the process in migrating to DXP Cloud is importing 
the database and document library. Both the database and document library must 
be imported at the same time to ensure that the data and the records in the 
database remain synchronized. 

This step should be done when the database is not being updated in order to 
prevent losing data. This will normally require reserving a window to freeze the 
data for migration. 

### Export a Database Dump

Begin by exporting the data to a database dump. The export from MySQL can be 
accomplished using the following command:

```bash
mysqldump -uroot -ppassword --databases --add-drop-database lportal | tar -czvf database.tgz
```

> **Note:** The `databases` and `add-drop-database` options are necessary for 
> backup restoration to work correctly.

Database dumps imported into DXP Cloud must be in MySQL format for the database 
service to use it. If necessary, a tool like 
[DBeaver](http://dbeaver.io) 
can be used to convert other types of databases to MySQL for the import. 

### Zip Up the Document Library

The document library must also be zipped into a file to upload to the backup 
service.

Add the document library to a zip file with this command:

```bash
cd $LIFERAY_HOME/data && tar -czvf volume.tgz document_library
```

> **Note:** If you are currently using the 
> [Amazon S3](/docs/7-2/deploy/-/knowledge_base/d/using-amazon-simple-storage-service), 
> [CMIS](/docs/7-1/deploy/-/knowledge_base/d/using-the-cmis-store), or 
> [DBStore](/docs/7-2/deploy/-/knowledge_base/d/using-the-dbstore) 
> storage methods, you must first 
> [migrate to the File System Store](https://help.liferay.com/hc/en-us/articles/360017649452-Migrating-File-System-Stores-). 

### Invoke Backup Service API

Once you have the database dump and document library both zipped and ready, 
invoke the backup service API to upload both of them to the backup service 
simultaneously. 

Run this command to invoke the API and upload the zipped files:

```bash
curl -X POST /
  http://<HOST-NAME>/projects/<PROJECT-NAME>/services/backup/upload /
  -H 'Content-Type: multipart/form-data' /
  -F 'database=@/my-folder/database.tgz' /
  -F 'volume=@/my-folder/volume.tgz' /
  -u user@domain.com:password
```

> **Note:** Substitute `<HOST-NAME>` and `<PROJECT-NAME>` with the appropriate 
> names for your DXP Cloud host name and project, respectively. Substitute 
> `/my-folder` with the correct path to the zipped files. 

Once these are uploaded, the backup service will initialize a DXP Cloud backup. 
At this point, the biggest step of the migration to DXP Cloud is complete. 

## Copy Liferay DXP Configurations

Portal properties and OSGi configurations can be copied over to DXP Cloud by 
putting them into the appropriate folder per environment (e.g., `dev`, `uat`, or 
`prd`, or `common` to apply to all) inside of `lcp/liferay/config/`. 

```
    |-- lcp
        |-- liferay
            |-- LCP.json
            |-- config
                |-- common
                |-- dev
                |-- local
                |-- prd
                |-- uat
```

Any portal properties of the form `portal-*.properties` placed in one of the 
appropriate folders will be automatically copied over to the `$LIFERAY_HOME` 
within the Liferay DXP service for the applicable environment(s). OSGi 
properties (.cfg or .config files) will be copied over to the `osgi/configs` 
folder within the Liferay DXP service for the applicable environment(s). 

## Add Service Configurations

Remaining configurations will primarily be handled through the services provided in DXP Cloud. It may take some 
planning to determine how to translate the web server and search configurations, 
since these must now be done through DXP Cloud's services. 

Web server configurations must be done through webserver service, using Nginx. 
See 
[Web Server Service](/docs/-/knowledge_base/dxp-cloud/web-server-service-nginx) 
for more information on adding configurations to this service. See the 
[official Nginx documentation](https://docs.nginx.com/) 
for more information on the configurations themselves. 

Search configurations must be done through the search service, using 
Elasticsearch. See 
[Search Service](/docs/-/knowledge_base/dxp-cloud/search-service-elasticsearch) 
for more information on adding configurations to this service. See the 
[official Elasticsearch documentation](https://www.elastic.co/guide/index.html) 
for more information on the configurations themselves. 

## Use a VPN to Connect External Services

External services that do not readily map to existing services in DXP Cloud 
(like SSO or LDAP integrations) may be connected using a VPN. See 
[VPN Connection](/docs/-/knowledge_base/dxp-cloud/vpn-connection) 
for more information on configuring the VPN. 
