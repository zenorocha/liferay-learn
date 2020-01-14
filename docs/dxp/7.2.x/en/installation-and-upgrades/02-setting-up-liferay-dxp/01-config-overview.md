# Setting Up Liferay DXP

Once Liferay DXP has been installed, you can begin using DXP immediately. To enable additional functionality and improve overall resilience and performance for a DXP installation, we recommend reviewing the following configurations:

* [Connecting to a Mail Server to Send Notifications](#connecting-to-a-mail-server-to-send-notifications)
* [Configuring Storage of Documents and Assets](#configuring-storage-of-documents-and-assets)
* [Installing a Dedicated Search Engine](#installing-a-dedicated-search-engine)
* [Configuring a Multi-lingual Site](#configuring-a-multi-lingual-site)
* [Configuring Clustering](#configuring-clustering)

## Connecting to a Mail Server to Send Notifications

Liferay DXP sends uses a mail server and SMTP to send email notifications for a variety of purposes: user registration and password management, site membership notifications, and content updates, to name a few. In order for Liferay DXP to send email notifications we recommend configuring the built-in mail session. As an alternative, you can opt to configure and use your application server's mail session.

See [Configuring the Built-in Mail Session](placeholder) for more information on how to configure the default mail server.

To configure the Application Server mail session, see the manual installation material for your application server of choice:

* [Tomcat](../01-installing-dxp/01-installing-liferay-on-an-application-server/01-installing-liferay-on-tomcat.md/#mail-configuration)
* [WildFly](placeholder)
* [JBoss EAP](placeholder)
* [WebLogic](placeholder)
* [WebSphere](../01-installing-dxp/01-installing-liferay-on-an-application-server/05-installing-liferay-on-websphere.md#mail-configuration).

## Configuring Storage of Documents and Assets

Documents, Images, and other assets that are uploaded to DXP are stored in a [document repository](./document-repository-overview.md). By default, DXP is configured to store those files locally to the server DXP is installed on, using the "[File System Store](./configuring-the-document-library-repository/using-the-file-system-store.md)" method which stores the files in the `${liferay.home}/data` folder. This configuration may be sufficient for basic usage scenarios - but must be changed if expecting a large number of documents to be uploaded, configuring for a high availability scenario, or if improved performance is desired.

DXP supports the following alternative file store methods:

* [Using the Advanced File Store](./configuring-the-document-library-repository/using-the-advanced-file-system-store.md)
* [Using Amazon's S3Store](./configuring-the-document-library-repository/using-amazon-s3-store.md)
* [Using the DBStore](./configuring-the-document-library-repository/using-the-dbstore.md)

<!-- CDN reference feels very out of place. -->

Besides configuring the document repository, administrators should connect DXP to a [Content Delivery Network](https://help.liferay.com/hc/articles/360028810352-Content-Delivery-Network) which enhances site performance and speeds up user requests.

## Installing a Dedicated Search Engine

<!-- Shouldn't the paragraph below be linking to our Elasticsearch documentation? -->

DXP ships with an [embedded Elasticsearch engine](https://help.liferay.com/hc/articles/360029031631-Elasticsearch#embedded-vs-remote-operation-mode) run in the same JVM. This enables a good out-of-the-box search experience, but is discouraged for use in production. We recommend installing a dedicated Elasticsearch installation that is run in a separate JVM. Prior to deployment, we strongly recommend reading [Elastic's documentation](https://www.elastic.co/guide/en/elasticsearch/reference/7.4/index.html) on production deployment.

<!-- Shouldn't the paragraph below be linking to our Solr documentation? -->

Another supported alternative is [Solr](http://lucene.apache.org/solr). To use Solr instead of Elasticsearch, see [Installing Solr](https://help.liferay.com/hc/articles/360032264052-Installing-Solr) for more information. Note that there are [some drawbacks with using Solr](placeholder).

## Displaying Localized Content

Liferay DXP allows administrators to display localized content depending on specific needs, such as changing the instance's default language, time zone, and the default locale. See [Selecting your Locale and Encoding](placeholder) for more information.

<!-- ## Configuring Clustering

DXP scales as needed.

You can setup a cluster of Liferay DXP servers to improve throughput and resilience. See [article]() for more information.

-->
