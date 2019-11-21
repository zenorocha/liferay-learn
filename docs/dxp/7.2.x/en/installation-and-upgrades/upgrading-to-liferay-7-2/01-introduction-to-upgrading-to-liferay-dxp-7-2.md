# Introduction to Upgrading to Liferay DXP 7.2

Upgrading to Liferay DXP 7.2 involves updating your installation, plugins, and custom code, as well as optimizing and testing to ensure the upgrade goes as quickly and smoothly as possible. The complexity for each of the steps to upgrade scales up with the amount of customizations and data used in your installation. 

**Note:** It is possible to do multiple pre-upgrade steps in parallel to save time. Planning for deprecated applications, upgrading apps, pruning the database, or preparing a new application server can potentially be done at the same time if desired.

1. [Determining Your Upgrade Path](#determining-your-upgrade-path)
1. [Planning for the Upgrade](#planning-for-the-upgrade)
1. [Upgrading Custom Code and Plugins](#upgrading-custom-code-and-plugins)
1. [Preparing for the Data Upgrade](#preparing-for-the-data-upgrade)
1. [Preparing a New Liferay DXP Server](#preparing-a-new-liferay-dxp-server)
1. [Testing the Upgrade with a Backup](#testing-the-upgrade-with-a-backup)
1. [Performing the Data Upgrade](#performing-the-data-upgrade)
1. [Executing Post-Upgrade Tasks](#executing-post-upgrade-tasks)

Before upgrading your installation to DXP 7.2, determine your upgrade path. 

## Determining Your Upgrade Path

Look up your current Liferay DXP/Portal version in this table to determine your installation upgrade path.

| Upgrade Path                            | Description |
| --------------------------------------- | ----------- |
| Liferay Portal 5.x and 6.0.x &rarr; Liferay Portal 6.2 &rarr; Liferay DXP 7.2 | Support life ended for Liferay Portal 5.0, 5.1, 5.2, and 6.0 |
| Liferay Portal 6.1.x &rarr; DXP/Portal 7.1 &rarr; DXP 7.2 | Support life ended for Liferay Portal 6.1 |
| Liferay Portal 6.2+ &rarr; DXP 7.2      |             |
| Liferay DXP/Portal 7.0+ &rarr; DXP 7.2  |             |

If your path includes upgrading to Liferay Portal 6.2, follow the [Liferay Portal 6.2 upgrade instructions](https://help.liferay.com/hc/en-us/articles/360017903232-Upgrading-Liferay) first.

If your path includes upgrading to Liferay DXP/Portal 7.1, continue following these DXP 7.2 upgrade instructions.

## Planning for the Upgrade

This step involves learning the ramifications of each feature change and deprecation, and developing a plan to adjust for them. The [DXP 7.2 deprecation handling instructions](./98-handling-deprecations-in-liferay-dxp-7-2.md) explains removed features, deprecated (but still present) features, and features moved into maintenance mode.

If you do not already have your own Elasticsearch installation running, then you will also need to set one up for Liferay DXP. By default, Liferay DXP ships with an embedded configuration for Elasticsearch. The embedded configuration works great for demo purposes, but is not supported in production. See [Installing Elasticsearch](https://help.liferay.com/hc/en-us/articles/360028711132-Installing-Elasticsearch) for more information.

You must also upgrade each Marketplace app (Kaleo, Calendar, Notifications, etc.) that you're using to its latest version for your Liferay DXP installation. Troubleshoot any issues with these apps before upgrading your DXP/Portal installation.

## Upgrading Custom Code and Plugins

Custom code upgrade involves adapting the themes and apps you've developed to the new version of Liferay DXP. This can be as simple as updating dependencies for the new version, or it may involve major code changes. The guide for [Upgrading Code to Liferay DXP 7.2](https://help.liferay.com/hc/en-us/articles/360029316391-Introduction-to-Upgrading-Code-to-Liferay-DXP-7-2) demonstrates the process. The code upgrade can be done in parallel with the data upgrade. 

You must also upgrade each Marketplace app (Kaleo, Calendar, Notifications, etc.) that you're using to its latest version for your Liferay DXP installation. Troubleshoot any issues with these apps before proceeding with the data upgrade.

## Preparing for the Data Upgrade

It's imperative that all desired staged changes are published and that the data upgrade runs efficiently. If Staging is enabled in production and you have staged changes, publish them to Live before the data upgrade. If you skip this step, publishing staged changes requires a full publish.

Your database tuning and the amount of data in your database affect upgrade performance. Take these measures to quicken data upgrade in your test and pre-production environments. 

- [Pruning unneeded data](./02-pruning-the-database.md)

- [Tuning the database for upgrades](./02-tuning-for-the-data-upgrade.md)

Lastly for your pre-production data upgrade and server upgrade, completely [back up](../09-mainitaining-a-liferay-dxp-installation/02-backing-up.md) your current Liferay DXP/Portal installation, pruned production database, and document repository.

## Preparing a New Liferay DXP Server

You must prepare an application server with your portal properties, OSGi properties, and any necessary patches before beginning your upgrade. See [Preparing a New Liferay Server for Data Upgrade](./05-preparing-a-new-application-server-for-liferay-dxp.md) for more information on setting up the application server and migrating properties to them.

It may also be necessary to make several tuning changes to your application server to ensure no performance issues arise during the upgrade. This is an important step if you have a large data set in your instance of Liferay DXP. See [Tuning for the Data Upgrade](./02-tuning-for-the-data-upgrade.md) for more information.

## Testing the Upgrade with a Backup

Remember to use a test environment with the database and document library both backed up before performing the upgrade for the first time. Testing with a backup of the production database is essential for identifying issues post-upgrade that will need to be resolved.

## Performing the Data Upgrade

The data upgrade step represents the biggest landmark in the upgrade process. First, you must configure your new application server to run the upgrade. See [Configuring the Data Upgrade](./03-configuring-the-data-upgrade.md) for more information on adding these configurations.

Once you are ready, use the upgrade tool to perform the core upgrade process; see [Upgrading the Core Using the Upgrade Tool](./04-upgrading-the-core-using-the-upgrade-tool.md) for more information. If you had configured modules to upgrade separately before running the upgrade, then you must also [use the Gogo shell](./05-upgrading-modules-using-gogo-shell.md) to finish the module upgrades after the core upgrade processes have completed.

## Executing Post-Upgrade Tasks

After the data upgrade has completed, you will need to execute a few remaining tasks before the procedure is complete. This may include re-tuning any values that were changed prior to the upgrade and running a search reindex. See [Executing Post-Upgrade Tasks](./07-executing-post-upgrade-tasks.md) for a guide to common tasks to perform after completing the data upgrade.
