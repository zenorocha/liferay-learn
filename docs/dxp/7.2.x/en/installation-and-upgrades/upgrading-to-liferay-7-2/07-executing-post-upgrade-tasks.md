# Executing Post-Upgrade Tasks

Since you optimized your system for upgrading previously, after the upgrade is complete you must re-optimize it for production. In addition to your standard testing, you must also perform a couple of other steps to ensure everything is running as expected post-upgrade. This article will give an overview of tasks you will need to address before officially completing your upgrade to Liferay DXP 7.2.

## Tuning Your Database for Production 

Prior to upgrading your Liferay DXP database, you tuned it for upgrade (see [Tuning for the Data Upgrade](./02-tuning-for-the-data-upgrade.md). Now that the upgrade is complete, restore the production database tuning you used previously.

## Setting Up Elasticsearch and Re-indexing Search Indexes

Make sure to re-enable search indexing by removing the `com.liferay.portal.search.configuration.IndexStatusManagerConfiguration.config` file from your `[Liferay Home]/osgi/configs` folder or setting this property in it: 

```properties
indexReadOnly="false"
```

Before your server is ready for production, you must also [install and configure a standalone Elasticsearch instance to run in production](/docs/7-2/deploy/-/knowledge_base/d/installing-elasticsearch). By default, Liferay DXP ships with an embedded configuration for Elasticsearch. This configuration works great for demo purposes, but is not supported in production.

Once indexing is enabled and Elasticsearch is configured, re-index Liferay DXP's search indexes. In DXP 7.2, you can do this in the UI after starting up Liferay DXP by navigating to _Control Panel_ → _Configuration_ → _Search_.

## Enabling Web Content View Permissions

Prior to DXP 7.1, all users could view web content articles by default. Now view permissions are checked by default instead. Here are options for opening view permissions:

Option 1: Edit view permissions per web content article per role. 

Option 2: Open view permissions for all web content articles by navigating to _Control Panel_ → _Configuration_ → _System Settings_ → _Web Experience_ → _Web Content_ and de-selecting _Article view permissions check enabled_. 

## Check Web Content Images

The upgrade to DXP 7.2 moves Web Content images to the Document Library and then deletes their former table, `JournalArticleImage`. To ensure this process went smoothly, check your web content articles and verify that their images still show correctly.

Once you've completed all necessary post-upgrade tasks, your upgraded system is ready for action! Congratulations! 
