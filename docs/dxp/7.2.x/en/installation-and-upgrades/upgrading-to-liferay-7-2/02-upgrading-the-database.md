# Upgrading the Database

Upgrading the database is the most significant part of the process in upgrading to DXP 7.2. It involves several steps of preparation which are outlined below.

Here are the general database upgrade topics:

1. [Determining Your Upgrade Path](#determining-your-upgrade-path)
1. [Using Backup Data for Upgrade Testing](#using-backup-data-for-upgrade-testing)
1. [Preparing for the Data Upgrade](#preparing-for-the-data-upgrade)
1. [Performing the Data Upgrade](#performing-the-data-upgrade)
1. [Executing Post-Upgrade Tasks](#executing-post-upgrade-tasks)

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

## Using Backup Data for Upgrade Testing

Doing a trial run(s) of the upgrade process and testing an upgraded copy of your production DXP instance is essential for identifying and resolving issues that will otherwise affect your production server. Upgrade trial runs, and even the pre-production upgrade, should be done using backed up copies of the production database and document library repository. Note that the tasks discussed next on [preparing for data upgrade](#preparing-for-the-data-upgrade) and [performing the data upgrade](#performing-the-data-upgrade) should be done as a trial run first on a test server using a copy of your production server backups.

## Preparing for the Data Upgrade

Unnecessary data and improperly tuned databases slow down data upgrades. Large data sets that have not been optimized may severely impact performing during a data upgrade. Take these measures to optimize your data upgrades: 

- [Prune unneeded data.](./03-pruning-the-database.md)

- [Tune the database for upgrades.](./05-tuning-for-the-data-upgrade.md)

If Staging is enabled in production and you have staged changes, you should publish them to Live before the data upgrade. If you skip this step, publishing staged changes requires a full publish.

Lastly for your pre-production upgrade, completely [back up](../09-maintaining-a-liferay-dxp-installation/02-backing-up.md) your current Liferay DXP/Portal installation, pruned database, and document repository.

## Performing the Data Upgrade

Data upgrade is the biggest upgrade process milestone. [Configure the upgrade tool on your new DXP server](./07-configuring-the-data-upgrade.md) and then [use it to execute the data upgrade](08-using-the-upgrade-tool.md).

## Executing Post-Upgrade Tasks

After completing the data upgrade, you must optimize your database and DXP server for production. The [post-upgrade tasks](./10-executing-post-upgrade-tasks.md) include re-tuning database settings and running search indexes.
