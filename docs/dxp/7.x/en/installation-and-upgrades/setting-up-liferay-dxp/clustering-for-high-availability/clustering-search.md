# Clustering Search

Search should always run on a separate environment from your Liferay DXP server for optimal performance. DXP supports [Elasticsearch](https://help.liferay.com/hc/en-us/articles/360028711132-Installing-Elasticsearch) and [Solr](https://help.liferay.com/hc/en-us/articles/360032264052-Installing-Solr), and either of these search engines can also be clustered.

## Configuring DXP to Use an Elasticsearch Cluster

For more information on how to cluster Elasticsearch, see [Elasticsearch's distributed cluster setup](https://www.elastic.co/guide/en/elasticsearch/guide/current/distributed-cluster.html).

Once DXP servers and Elasticsearch have both been properly configured as a cluster, follow these steps to change your DXP instance from *embedded* mode to *remote* mode:

1. Navigate to _Control Panel_ → _Configuration_ → _System Settings_.
1. Click _Search_ under the _Platform_ section.
1. Click the _Elasticsearch 6_ link under _SYSTEM SCOPE._
1. Select _REMOTE_ from the _Operation Mode_ dropdown.

    ![Change your Elasticsearch configuration to Remote mode from the Control Panel.](./clustering-search/images/01.png)

On the first connection, the two sets of clustered servers communicate with each other the list of all IP addresses. In case of a node going down, the proper failover protocols activate, and queries and indexes continue to be sent for all nodes.

## Configuring DXP to Use a Solr Cluster

For more information on how to cluster Solr, see [Apache Solr Cloud](https://cwiki.apache.org/confluence/display/solr/SolrCloud) documentation.

Once DXP servers have been properly configured as a cluster, deploy the Liferay Solr 5 Connector on all nodes. The app is available for download from Liferay Marketplace [here](https://web.liferay.com/marketplace/-/mp/application/117931595).

Create a Solr Cloud (cluster) managed by _Apache Solr Zookeeper_. Connect the DXP cluster to Zookeeper and finish the final configurations to connect the two clusters.

## Additional Information

* [Installing Elasticsearch](https://help.liferay.com/hc/en-us/articles/360028711132-Installing-Elasticsearch)
* [Installing Solr](https://help.liferay.com/hc/en-us/articles/360032264052-Installing-Solr)
* [Clustering Liferay DXP for High Availability](./clustering-for-high-availability.md)
