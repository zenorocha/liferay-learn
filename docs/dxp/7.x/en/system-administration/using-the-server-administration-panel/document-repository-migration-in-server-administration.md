## Document Repository Migration in Server Administration

<!-- Perhaps better suited to the doc repository section of installation and upgrades? -->

In the Server Administration &rarr; Data Migration tab, migrate documents from one repository to another. You can migrate your documents to a new repository on a different disk or in a new format.

![Migrate to a new Documents and Media Repository in Server Administration.](./document-repository-migration-in-server-administration/images/01.png)

To migrate a document repository,

1. Create a [backup](./../../installation-and-upgrades/maintaining-a-liferay-dxp-installation/backing-up.md) copy of the Document Library repository and [Liferay DXP database](./../../installation-and-upgrades/maintaining-a-liferay-dxp-installation/backing-up.md#database). 

1. Configure the new file store in System Settings &rarr; Platform &rarr; File Storage. 

1. In Server Administration &rarr; Data Migration, select the repository hook for the file store you configured and click *Execute*. 

1. Make sure the data migrated correctly.

1. [Configure the new repository](./../../installation-and-upgrades/setting-up-liferay-dxp/configuring-the-document-library-repository/document-repository-overview) as the default. 

1. If you used a `portal-ext.properties` file to configure the repository, restart the server. 
