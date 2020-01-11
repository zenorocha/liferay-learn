# Setting Up Liferay DXP

<!-- 

* Connecting to a Mail Server
* Configuring a Storage Method for Documents and Media
* Installing a Dedicated Search Engine
* Configuring a Locale for a Multi-lingual Site

-->

Once Liferay DXP has been installed, you can begin using DXP immediately. To enable some additional functionality or improve overall resilience and performance for a DXP installation, we recommend reviewing the following common configurations:

1. [Installing a Search Engine](#installing-a-search-engine)
1. [Storing Documents and Assets](#storing-documents-and-assets)
1. [Sending Notifications](#sending-notifications)
1. [Displaying Localized Content](#displaying-localized-content)

## Installing a Search Engine

One required component to run DXP is a search engine.

For ease of use, DXP and its [embedded Elasticsearch engine](https://help.liferay.com/hc/articles/360029031631-Elasticsearch#embedded-vs-remote-operation-mode) run in the same JVM. Although this enables out-of-the-box search, it is only supported for development. For production use, Elasticsearch must run in a separate JVM. Prior to deployment, we strongly recommend reading [Elastic's documentation](https://www.elastic.co/guide/en/elasticsearch/reference/7.4/index.html) on production deployment.

Another supported alternative is [Solr](http://lucene.apache.org/solr). To use Solr instead of Elasticsearch, see [Installing Solr](https://help.liferay.com/hc/articles/360032264052-Installing-Solr) for more information. Note that there are [some drawbacks with using Solr](placeholder).

## Storing Documents and Assets

All documents and other assets are stored in DXP's [document repository](./document-repository-overview.md). By default, all the files are stored locally using the native [Simple File Store](./using-the-simple-file-system-store.md) system which hosts the files in the `${liferay.home}/data` folder. For subscribers who plan to host large numbers of documents in a more robust environment, DXP also supports the following file store systems:

* [Using the Advanced File Store](./using-the-advanced-file-system-store.md)
* [Using Amazon's S3Store](./using-amazon-s3-store.md)
* [Using the DBStore](./using-the-dbstore.md)

Besides configuring the document repository, administrators should connect DXP to a [Content Delivery Network](https://help.liferay.com/hc/articles/360028810352-Content-Delivery-Network) which enhances site performance and speeds up user requests.

## Sending Notifications

Liferay DXP has a built-in mail server to send notifications. See [Connecting to a Mail Server](placeholder) for more information on how to configure the default mail server.

Alternately, administrators could use their application server of choice to manage their mail sessions. See [Tomcat](../01-installing-dxp/01-installing-liferay-on-an-application-server/01-installing-liferay-on-tomcat.md/#mail-configuration), [Wildfly](placeholder), [JBoss EAP](placeholder), [WebLogic](placeholder), and [WebSphere](../01-installing-dxp/01-installing-liferay-on-an-application-server/05-installing-liferay-on-websphere.md#mail-configuration).

## Displaying Localized Content

Liferay DXP allows administrators to display localized content depending on specific needs, such as changing the instance's default language, time zone, and the default locale. See [Selecting your Locale and Encoding](placeholder) for more information.
