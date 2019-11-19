# Installation Upgrade Steps

As you dive into [installation upgrade details](../upgrading-to-liferay-7-2/01-introduction-to-upgrading-to-liferay-dxp-7-2.md), it's helpful to follow a list of steps or at least note when you've completed them. The steps demonstrate an upgrade workflow and link to the upgrade details. 

Here are the installation upgrade steps: 

1.  {.root}[If You're Upgrading to Liferay Portal 6.2, Follow the Liferay Portal 6.2 Upgrade Instructions First](https://help.liferay.com/hc/en-us/articles/360017903232-Upgrading-Liferay){.title}

2.  [If You're Upgrading a Sharded Environment, Follow the Instructions for Upgrading It](../upgrading-to-liferay-7-2/08-upgrading-a-sharded-environment.md){.title}

    Upgrading a sharded installation (installation prior to DXP 7.2) requires migrating it to as many non-sharded Liferay installations (servers) as you have shards.{.summary}

3.  [If You're a Upgrading a Cluster, Read Those Instructions First](../10-mainitaining-clustered-installations/01-mainitaining-clustered-installations.md){.title}

    If you're updating a cluster, read those instructions first and apply them to your upgrade.{.summary}

4.  [Plan for Handling the Deprecated Applications](./98-handling-deprecations-in-liferay-dxp-7-2.md){.title}

    Every application deprecation has different ramifications. Learn how the deprecations might affect your site and decide how to replace the functionality you use from those applications.{.summary}

5.  [Test the Upgrade with a DXP/Portal Backup](../09-mainitaining-a-liferay-dxp-installation/02-backing-up.md){.title}

    Here you'll prune a backup copy of your database and upgrade the data. You'll learn how to use the data upgrade tool and resolve upgrade issues. The notes and scripts you assemble as you prune and upgrade the database copy are invaluable for correctly and efficiently upgrading the database you'll use with your new production DXP installation.{.summary}

    1.  Copy Your Production Installation to a Test Server{.title}

        Prepare a test server to use a copy of your production installation. Your test server must use the same Liferay version you're currently using on production. Configure your server to use a new empty database for testing data upgrades.{.summary}
 
    2.  [Copy the Production Database Backup](../09-mainitaining-a-liferay-dxp-installation/02-backing-up.md){.title}

        Import data from your production database backup to the new empty database. **Important:** Make sure to save the data import log---you'll examine it in the next steps.{.summary}

    3.  [Prune the Test Database](../upgrading-to-liferay-7-2/02-pruning-the-database.md){.title}

        You may have intermediate versions of objects (e.g., `JournalArticle` objects) that you don't need. Remove them and objects that only reference them.{.summary}

    5.  [Test Liferay with its Pruned Database Copy](../upgrading-to-liferay-7-2/02-pruning-the-database.md#test-with-a-copy-of-the-pruned-database){.title}

        Make sure Liferay continues to work successfully. If it's broken, start over with a fresh database backup and prune it more carefully.{.summary}

    6.  [Prepare the new Liferay DXP on the Test Server](../upgrading-to-liferay-7-2/05-preparing-a-new-application-server-for-liferay-dxp.md){.title}

        Install the DXP version you're upgrading to, to use its data upgrade tool.{.summary}

    7.  [Tune Your Test Database for the Upgrade](../upgrading-to-liferay-7-2/02-tuning-for-the-data-upgrade.md){.title}

    8.  [Configure the Data Upgrade on Your Test Server](../upgrading-to-liferay-7-2/03-configuring-the-data-upgrade.md)

    9.  [Upgrade the Core Test Data](../upgrading-to-liferay-7-2/04-upgrading-the-core-using-the-upgrade-tool.md)

    10. [Upgrade the Module Test Data](../upgrading-to-liferay-7-2/05-upgrading-modules-using-gogo-shell.md){.title}

    11. [If the Test Data Upgrade Took too Long, Prune a Fresh Database Backup More and Upgrade Its Data](../upgrading-to-liferay-7-2/02-pruning-the-database.md){.title}

    12. [Test the Upgraded Instance](../upgrading-to-liferay-7-2/01-introduction-to-upgrading-to-liferay-dxp-7-2.md#testing-the-upgrade-with-a-backup){.title}

        Make sure DXP continues to work successfully. If it's broken, start over with a fresh database backup and prune it more carefully.{.summary}

    13. Checkpoint: You've pruned and upgraded your test database. You're ready to prepare for upgrading the production database. 

6.  [Prepare to Upgrade the Production Database](../upgrading-to-liferay-7-2/01-introduction-to-upgrading-to-liferay-dxp-7-2.md#preparing-the-database-for-upgrade){.title}

    Preparing for the production database upgrade involves pruning and testing it, upgrading your Marketplace apps, publishing staged changes, and synchronizing a complete data and configuration backup.{.summary}

    1.  [Remove All Noted Unused Objects](../upgrading-to-liferay-7-2/02-pruning-the-database.md#find-and-remove-unused-objects){.title}

        Remove all unused objects you noted from pruning your test database.{.summary}

    2.  [Test Liferay](../upgrading-to-liferay-7-2/02-pruning-the-database.md#test-with-a-copy-of-the-pruned-database){.title}

    3.  [Upgrade Your Marketplace Apps](../upgrading-to-liferay-7-2/01-introduction-to-upgrading-to-liferay-dxp-7-2.md#upgrading-custom-code-and-plugins){.title}

    4.  [Publish All Staged Changes](../upgrading-to-liferay-7-2/01-introduction-to-upgrading-to-liferay-dxp-7-2.md#preparing-the-database-for-upgrade){.title}

    5.  [Synchronize a Complete Liferay Backup](../09-mainitaining-a-liferay-dxp-installation/02-backing-up.md){.title}

        Synchronize a complete backup of your production Liferay server installation and pruned production database.{.summary}

    6.  Checkpoint: You're ready to prepare a new DXP server for upgrading your production installation. 

7.  [Prepare a New DXP Server for Production Installation Upgrade](../upgrading-to-liferay-7-2/05-preparing-a-new-application-server-for-liferay-dxp.md){.title}

    Set up a production server with the new DXP version, configured to use your document repository and DXP database. You'll migrate your portal and system properties too. (Note, this step can be done in parallel with any of the previous steps.){.summary}

    1.  [Request an Upgrade Patch From Liferay Support \(Liferay entreprise subscribers only\)](../upgrading-to-liferay-7-2/05-preparing-a-new-application-server-for-liferay-dxp.md#request-an-upgrade-patch-from-liferay-support){.title}

    2.  [Install the DXP Version You're Upgrading To](../01-installing-liferay-dxp/01-installing-liferay-dxp.md){.title}

    3.  [Install the Latest Upgrade Patch or Fix Pack \(Liferay enterprise subscribers only\)](../upgrading-to-liferay-7-2/05-preparing-a-new-application-server-for-liferay-dxp.md#install-the-latest-upgrade-patch-or-fix-pack){.title}

    4.  [Migrate Your OSGi Configurations \(7.0+\)](../upgrading-to-liferay-7-2/05-preparing-a-new-application-server-for-liferay-dxp.md#migrate-your-osgi-configurations-70){.title}

        Copy your OSGi configuration files (i.e., `.config` files) to your new server's `[Liferay_Home]/osgi/configs` folder.{.summary}

    5.  [Update Your Portal Properties](../upgrading-to-liferay-7-2/05-preparing-a-new-application-server-for-liferay-dxp.md#update-your-portal-properties){.title}

        Migrate your portal properties to your new DXP server.{.summary}

        1.  [Migrate Existing Portal Properties](../upgrading-to-liferay-7-2/05-preparing-a-new-application-server-for-liferay-dxp.md#migrating-existing-portal-properties){.title}

            Some of the portal properties have new values or have been removed or replaced. Update your properties for the new DXP version.{.summary}

        2.  [Convert Applicable Properties to OSGi Configurations](../upgrading-to-liferay-7-2/05-preparing-a-new-application-server-for-liferay-dxp.md#convert-applicable-properties-to-osgi-configurations){.title}

            Many applications are configured using OSGi Configuration (Config Admin) instead of portal properties. Convert your existing properties to their OSGi Configuration replacements.{.summary}

    6.  [Update Your Database Driver](../upgrading-to-liferay-7-2/05-preparing-a-new-application-server-for-liferay-dxp.md#update-your-database-driver){.title}

        Install the recommended database driver and update your database connection driver specified in your `portal-ext.properties` file. 

    7.  [Configure Your Documents and Media File Store](../upgrading-to-liferay-7-2/05-preparing-a-new-application-server-for-liferay-dxp.md#configure-your-documents-and-media-file-store){.title}

        The upgrade tool upgrades your Documents and Media file store too. Update your Documents and Media file store configuration and specify it for the upgrade tool.{.summary}

    8.  [Disable Indexing](../upgrading-to-liferay-7-2/02-tuning-for-the-data-upgrade.md#disable-indexing){.title}

        Improve the data upgrade performance by disabling indexing.{.summary}

    9.  [Configure Kerberos in Place of NTLM](../upgrading-to-liferay-7-2/05-preparing-a-new-application-server-for-liferay-dxp.md#configure-kerberos-in-place-of-ntlm){.title}

    10. Checkpoint: You've prepared a new DXP server for executing the data upgrade 

8.  [Upgrade the @product@ data](../upgrading-to-liferay-7-2/01-introduction-to-upgrading-to-liferay-dxp-7-2.md#performing-the-database-upgrade){.title}

    This section explains the data upgrade options, upgrade configuration, and the upgrade process.{.summary}

    1.  [Tune Your Database for the Upgrade](../upgrading-to-liferay-7-2/02-tuning-for-the-data-upgrade.md){.title}

    2.  [Configure the Data Upgrade](../upgrading-to-liferay-7-2/03-configuring-the-data-upgrade.md){.title}

        Configure the data upgrade, including the data store and whether to automatically upgrade the modules.{.summary}

    3.  [Upgrade the Core](../upgrading-to-liferay-7-2/04-upgrading-the-core-using-the-upgrade-tool.md){.title}

        1.  [Run the Data Upgrade Tool](../upgrading-to-liferay-7-2/04-upgrading-the-core-using-the-upgrade-tool.md#upgrade-tool-usage){.title}

            Run the data upgrade tool. Resolve any core upgrade issues.{.summary}

        2.  [Issues Upgrading to 7.0 or Lower? Restore the Database Backup](../09-mainitaining-a-liferay-dxp-installation/02-backing-up.md){.title}

            If the issues were with upgrades to Liferay 7.0 or lower, get a clean start by restoring the pruned production database backup.{.summary}

        3.  [Upgrade Your Resolved Issues](../upgrading-to-liferay-7-2/04-upgrading-the-core-using-the-upgrade-tool.md){.title}

            If there were issues upgrading to the new DXP version, resolve them and restart the data upgrade tool; continue if there were no issues.{.summary}

    4.  [Upgrade the Liferay Modules](../upgrading-to-liferay-7-2/05-upgrading-modules-using-gogo-shell.md){.title}

        Learn how to use Gogo Shell to upgrade the Liferay modules, if you didn't upgrade them automatically with the core.{.summary}

        1.  [Upgrade Modules that are Ready for Upgrade](../upgrading-to-liferay-7-2/05-upgrading-modules-using-gogo-shell.md#command-usage){.title}

            Discover which modules are ready for upgrade and upgrade them.{.summary}

        2.  [Check Module Upgrade Status and Resolve Any Module Upgrade Issues](../upgrading-to-liferay-7-2/05-upgrading-modules-using-gogo-shell.md#checking-upgrade-status){.title}

        3.  Checkpoint: You've completed upgrading the Liferay data. It's time to get your server ready for production.{.summary}

9.  [Execute the Post-Upgrade Tasks](../upgrading-to-liferay-7-2/07-executing-post-upgrade-tasks.md){.title}

    Now that your database is upgraded, clean up remnants of upgrading by restoring your database optimizations, enabling and regenerating your search indexes, and more.{.summary}

    1.  [Remove the Database Tuning](../upgrading-to-liferay-7-2/07-executing-post-upgrade-tasks.md#review-database-configurations){.title}

    2.  [Re-enable and Re-Index the Search Indexes](../upgrading-to-liferay-7-2/07-executing-post-upgrade-tasks.md#set-up-elasticsearch-and-re-index-search-indexes){.title}

    3.  [Update Web Content Permissions \(7.0 and lower\)](../upgrading-to-liferay-7-2/07-executing-post-upgrade-tasks.md#enable-web-content-view-permissions){.title}

    4.  [Address Any Deprecated Apps That Still Need Handling](../upgrading-to-liferay-7-2/98-handling-deprecations-in-liferay-dxp-7-2.md){.title}

10.  Checkpoint: You've completed the upgrade and post-upgrade tasks

## Related Topics 

[Upgrading to Liferay DXP 7.2](../upgrading-to-liferay-7-2/01-introduction-to-upgrading-to-liferay-dxp-7-2.md)

[Upgrading Your Code to DXP 7.2](https://help.liferay.com/hc/en-us/articles/360029316391-Introduction-to-Upgrading-Code-to-Liferay-DXP-7-2)

[Liferay Upgrade Planner](https://help.liferay.com/hc/en-us/articles/360029147451-Liferay-Upgrade-Planner)
