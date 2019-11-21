# Introduction to Upgrading to Liferay DXP 7.2

Upgrading to Liferay DXP 7.2 involves updating your data, files, plugins, and custom code, as well as optimizing and testing the upgrade to ensure it goes as quickly and smoothly as possible for your final production data upgrade. Each step's complexity scales up with the amount of data and number of customizations in your installation. Steps before and during data upgrade testing can potentially be done in parallel. 

Here are the general upgrade steps:

1. [Determining Your Upgrade Path](#determining-your-upgrade-path)
1. [Planning for Feature Changes](#planning-for-feature-changes)
1. [Upgrading Custom Code and Plugins](#upgrading-custom-code-and-plugins)
1. [Preparing for the Data Upgrade](#preparing-for-the-data-upgrade)
1. [Preparing a New Liferay DXP Server](#preparing-a-new-liferay-dxp-server)
1. [Testing the Upgrade with a Backup](#testing-the-upgrade-with-a-backup)
1. [Performing the Data Upgrade](#performing-the-data-upgrade)
1. [Executing Post-Upgrade Tasks](#executing-post-upgrade-tasks)

> **Note:** Dev Studio's [Upgrade Planner](https://help.liferay.com/hc/en-us/articles/360029147451-Liferay-Upgrade-Planner) walks through the upgrade process and automates parts of it. The Planner uses the [Installation Upgrade Steps](../08-reference/06-installation-upgrade-steps.md), which is a terse step listing you can follow or refer to throughout the upgrade process. 

Determining your upgrade path is first. 

## Determining Your Upgrade Path

Look up your current Liferay DXP/Portal version in this table to determine your installation upgrade path.

| Upgrade Path                            | Description |
| --------------------------------------- | ----------- |
| Liferay Portal 5.x and 6.0.x &rarr; Liferay Portal 6.2 &rarr; Liferay DXP 7.2 | Support life ended for Liferay Portal 5.0, 5.1, 5.2, and 6.0 |
| Liferay Portal 6.1.x &rarr; DXP/Portal 7.1 &rarr; DXP 7.2 | Support life ended for Liferay Portal 6.1 |
| Liferay Portal 6.2+ &rarr; DXP 7.2      |             |
| Liferay DXP/Portal 7.0+ &rarr; DXP 7.2  |             |

If your path includes upgrading to Liferay Portal 6.2, follow the [Liferay Portal 6.2 upgrade instructions](https://help.liferay.com/hc/en-us/articles/360017903232-Upgrading-Liferay) first.

If your path includes upgrading to Liferay DXP/Portal 7.1, continue following these upgrade instructions.

## Planning for Feature Changes

New DXP versions can deprecate (but keep present) features, remove features, or [move features into maintenance mode](./99-features-in-maintenance-mode.md). The [DXP 7.2 deprecation handling instructions](./98-handling-deprecations-in-liferay-dxp-7-2.md) explain the ramifications so you can develop plans for adapting to them. 

## Upgrading Custom Code and Plugins

Custom code upgrade involves adapting themes and apps you've developed to DXP 7.2. This can be as simple as updating dependencies for the new version, or it may involve major code changes. [Upgrading Code to Liferay DXP 7.2](https://help.liferay.com/hc/en-us/articles/360029316391-Introduction-to-Upgrading-Code-to-Liferay-DXP-7-2) (a separate guide) demonstrates the process. The code upgrade can be done in parallel with the data upgrade. 

You must also upgrade your installation's Marketplace apps (Kaleo, Calendar, Notifications, etc.) to their latest version for your current Liferay DXP installation. Troubleshoot any issues with these apps on your current DXP installation before upgrading to DXP 7.2.

## Testing the Upgrade with a Backup

Doing a trial run(s) of the upgrade process and testing the upgraded DXP instance is essential for identifying and resolving issues will otherwise affect your production server. Upgrade trial runs, and even the pre-production upgrade, should be done using backed up copies of the production database and document library repository. 

## Preparing for the Data Upgrade

Unnecessary data and improperly tuned databases slow down data upgrades. Take these measures to quicken your data upgrades: 

- [Pruning unneeded data.](./02-pruning-the-database.md)

- [Tuning the database for upgrades.](./04-tuning-for-the-data-upgrade.md)

If Staging is enabled in production and you have staged changes, you should publish them to Live before the data upgrade. If you skip this step, publishing staged changes requires a full publish.

Lastly for your pre-production upgrade, completely [back up](../09-maintaining-a-liferay-dxp-installation/02-backing-up.md) your current Liferay DXP/Portal installation, pruned database, and document repository. 

## Preparing a New Liferay DXP Server

[New DXP server setup](./05-preparing-a-new-application-server-for-liferay-dxp.md) involves installing the DXP 7.2, migrating and updating your portal properties and OSGi properties, and installing any necessary patches. 

If you do not already have your own Elasticsearch installation running, you must set one up for Liferay DXP. By default, Liferay DXP ships with an embedded configuration for Elasticsearch. The embedded configuration works great for demo purposes, but is not supported in production. See [Installing Elasticsearch](https://help.liferay.com/hc/en-us/articles/360028711132-Installing-Elasticsearch) for more information.

## Performing the Data Upgrade

Data upgrade is the biggest upgrade process milestone. First, you [configure the upgrade tool on your new DXP server](./06-configuring-the-data-upgrade.md). Then you use the upgrade tool to [upgrade the Core](./07-upgrading-the-core-using-the-upgrade-tool.md). If you configure for upgrading modules separately, you [use the Gogo shell](./08-upgrading-modules-using-gogo-shell.md) to upgrade the modules after the Core upgrade completes.

## Executing Post-Upgrade Tasks

After completing the data upgrade, you must optimize your database and DXP server for production. The [post-upgrade tasks](./09-executing-post-upgrade-tasks.md) include re-tuning database settings and running search indexes.
