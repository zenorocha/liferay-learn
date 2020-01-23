# Liferay Upgrade Planner Steps

As you dive into [installation upgrade details](../04-upgrading-liferay/01-introduction-to-upgrading-to-liferay-dxp-7-2.md), it's helpful to follow a list of steps, or at least note steps you've completed. The [Liferay Upgrade Planner](https://help.liferay.com/hc/en-us/articles/360029147451-Liferay-Upgrade-Planner) uses the steps listed below. They demonstrate an upgrade workflow and link to the upgrade details.

Here are the installation upgrade steps:

1. {.root}[If You're Upgrading to Liferay Portal 6.2, Follow the Liferay Portal 6.2 Upgrade Instructions First](https://help.liferay.com/hc/en-us/articles/360017903232-Upgrading-Liferay){.title}

2. [If You're Upgrading a Sharded Environment, Follow the Instructions for Upgrading It](../04-upgrading-liferay/97-upgrading-a-sharded-environment.md){.title}

    Upgrading a sharded installation (installation prior to DXP 7.2) requires migrating it to as many non-sharded Liferay installations (servers) as you have shards.{.summary}

3. [If You're a Upgrading a Cluster, Read Those Instructions First](../10-maintaining-clustered-installations/01-maintaining-clustered-installations.md){.title}

    If you're upgrading a cluster, read the cluster update instructions first and apply them to your upgrade.{.summary}

4. [Plan for Handling the Deprecated Applications](../04-upgrading-liferay/98-deprecations-in-liferay-dxp-7-2.md){.title}

    Every application deprecation has different ramifications. Learn how the deprecations might affect your sites and decide how to replace the functionality you use from those applications.{.summary}

5. Prune a Database Backup{.title}

    Here you'll prune a backup copy of your database and test it with a copy of your existing version of DXP/Portal. The notes and scripts you assemble as you prune the database are invaluable for pruning your production database.{.summary}

    1. Copy Your Existing Production Installation to a Test Server{.title}

        Prepare a test server to use a copy of your production installation. Your test server must use the same Liferay version you're currently using on production. Configure your server to use a new empty database for testing data upgrades.{.summary}

    2. [Copy the Production Database Backup](../09-maintaining-a-liferay-dxp-installation/02-backing-up.md){.title}

        Import data from your production database backup to the new empty database. **Important:** Make sure to save the data import log---you'll examine it in the next steps.{.summary}

    3. [Prune the Test Database](../04-upgrading-liferay/03-pruning-the-database.md){.title}

        You may have intermediate versions of objects (e.g., `JournalArticle` objects) that you don't need. Remove them and objects that only reference them.{.summary}

    4. Back up the Pruned Database so You Can Revert to it if Needed{.title}

    5. [Test Liferay with its Pruned Database Copy](../04-upgrading-liferay/03-pruning-the-database.md#test-with-a-copy-of-the-pruned-database){.title}

        Make sure Liferay continues to work successfully. If it's broken, start over with a fresh database backup and prune it more carefully.{.summary}

    6. Checkpoint: You've successfully pruned your test server data. You're read to upgrade that data.

6. Prepare a New Server for Testing the Upgrade{.title}

    Set up a test server with the new DXP version, configured to use your document repository and DXP database. You'll migrate your portal and system properties too. (Note, this step can be done in parallel with pruning your database.){.summary}

    1. [Request an Upgrade Patch From Liferay Support \(Liferay enterprise subscribers only\)](../04-upgrading-liferay/06-preparing-a-new-application-server-for-liferay-dxp.md#install-the-latest-upgrade-patch-or-fix-pack){.title}

    2. [Install the DXP Version You're Upgrading To](../installing-liferay-dxp-on-premises/02-installation-overview.md){.title}

    3. [Install the Latest Upgrade Patch or Fix Pack \(Liferay enterprise subscribers only\)](../04-upgrading-liferay/06-preparing-a-new-application-server-for-liferay-dxp.md#install-the-latest-upgrade-patch-or-fix-pack){.title}

    4. [Migrate Your OSGi Configurations \(7.0+\)](../04-upgrading-liferay/06-preparing-a-new-application-server-for-liferay-dxp.md#migrate-your-osgi-configurations-70){.title}

        Copy your OSGi configuration files (i.e., `.config` files) to your new server's `[Liferay_Home]/osgi/configs` folder.{.summary}

    5. [Update Your Portal Properties](../04-upgrading-liferay/06-preparing-a-new-application-server-for-liferay-dxp.md#update-your-portal-properties){.title}

        Migrate your portal properties to your new DXP server.{.summary}

        1. [Migrate Existing Portal Properties](../04-upgrading-liferay/06-preparing-a-new-application-server-for-liferay-dxp.md#migrating-existing-portal-properties){.title}

            Some of the portal properties have new values or have been removed or replaced. Update your properties for the new DXP version.{.summary}

        2. [Convert Applicable Properties to OSGi Configurations](../04-upgrading-liferay/06-preparing-a-new-application-server-for-liferay-dxp.md#convert-applicable-properties-to-osgi-configurations){.title}

            Many applications are configured using OSGi Configuration (Config Admin) instead of portal properties. Convert your existing properties to their OSGi Configuration replacements.{.summary}

    6. [Update Your Database Driver](../04-upgrading-liferay/06-preparing-a-new-application-server-for-liferay-dxp.md#update-your-database-driver){.title}

        Install the recommended database driver and update your database connection driver specified in your `portal-ext.properties` file.

    7. [Configure Your Documents and Media File Store](../04-upgrading-liferay/06-preparing-a-new-application-server-for-liferay-dxp.md#configure-your-documents-and-media-file-store){.title}

        The upgrade tool upgrades your Documents and Media file store too. Update your Documents and Media file store configuration and specify it for the upgrade tool.{.summary}

    8. [Disable Indexing](../04-upgrading-liferay/05-tuning-for-the-data-upgrade.md#disable-indexing){.title}

        Improve the data upgrade performance by disabling indexing.{.summary}

    9. [Configure Kerberos in Place of NTLM](../04-upgrading-liferay/06-preparing-a-new-application-server-for-liferay-dxp.md#configure-kerberos-in-place-of-ntlm){.title}

    10. Checkpoint: You've prepared a new DXP test server for testing the data upgrade

7. [Upgrade the Test Server Data](../04-upgrading-liferay/02-upgrading-the-database.md){.title}

    This section walks you through selecting data upgrade options, configuring the upgrade, and executing the upgrade.{.summary}

    1. [Tune Your Database for the Upgrade](../04-upgrading-liferay/05-tuning-for-the-data-upgrade.md){.title}

    2. [Configure the Data Upgrade](../04-upgrading-liferay/07-configuring-the-data-upgrade-tool.md){.title}

        Configure the data upgrade, including the data store and whether to automatically upgrade the modules.{.summary}

    3. [Upgrade the Core](../04-upgrading-liferay/08-using-the-upgrade-tool.md){.title}

        1. [Run the Data Upgrade Tool](../04-upgrading-liferay/08-using-the-upgrade-tool.md#upgrade-tool-usage){.title}

            Run the data upgrade tool. Resolve any core upgrade issues.{.summary}

        2. [Issues Upgrading to 7.0 or Lower? Restore the Database Backup](../09-maintaining-a-liferay-dxp-installation/02-backing-up.md){.title}

            If the issues were with upgrades to Liferay 7.0 or lower, get a clean start by restoring the pruned database backup.{.summary}

        3. [Upgrade Your Resolved Issues](../04-upgrading-liferay/08-using-the-upgrade-tool.md){.title}

            If there were issues upgrading to the new DXP version, resolve them and restart the data upgrade tool; continue if there were no issues.{.summary}

    4. [Upgrade the Liferay Modules](../04-upgrading-liferay/09-upgrading-modules-using-gogo-shell.md){.title}

        Learn how to use Gogo Shell to upgrade the Liferay modules, if you didn't upgrade them automatically with the core.{.summary}

        1. [Upgrade Modules that are Ready for Upgrade](../04-upgrading-liferay/09-upgrading-modules-using-gogo-shell.md#command-usage){.title}

            Discover which modules are ready for upgrade and upgrade them.{.summary}

        2. [Check Module Upgrade Status and Resolve Any Module Upgrade Issues](../04-upgrading-liferay/09-upgrading-modules-using-gogo-shell.md#checking-upgrade-status){.title}

        3. Checkpoint: You've upgraded your DXP test installation (its files and data) for production. You're ready to prepare for upgrading your Liferay production installation.

8. Prune a Production Database Backup{.title}

    Here you'll prune the latest backup in the same way you pruned the database for testing the DXP upgrade process. {.summary}

    1. [Prune a Production Database Backup](../04-upgrading-liferay/03-pruning-the-database.md){.title}

    2. Back up the Pruned Database so You Can Revert to it if Needed{.title}

    3. [Test Liferay with its Pruned Database Copy](../04-upgrading-liferay/03-pruning-the-database.md#test-with-a-copy-of-the-pruned-database){.title}

        Make sure Liferay continues to work successfully. If it's broken, start over with a fresh database backup and prune it more carefully.{.summary}

    4. Checkpoint: You've successfully pruned your data. It's time to prepare for installation upgrade.{title}

9. [Prepare the Production Installation for Upgrade](../04-upgrading-liferay/02-upgrading-the-database.md){.title}

    Preparing for the production installation upgrade involves upgrading your Marketplace apps, publishing staged changes, and synchronizing a complete data and configuration backup.{.summary}

    1. [Upgrade Your Marketplace Apps](../04-upgrading-liferay/01-introduction-to-upgrading-to-liferay-dxp-7-2.md#upgrading-custom-code-and-plugins){.title}

    2. [Publish All Staged Changes](../04-upgrading-liferay/02-upgrading-the-database.md#preparing-for-the-data-upgrade){.title}

    3. [Synchronize a Complete Liferay Backup](../09-maintaining-a-liferay-dxp-installation/02-backing-up.md){.title}

        Synchronize a complete backup of your production Liferay server installation and pruned production database.{.summary}

    4. Checkpoint: You're ready to prepare a new DXP server for upgrading your production installation

10. [Prepare a New DXP Production Server](../04-upgrading-liferay/06-preparing-a-new-application-server-for-liferay-dxp.md){.title}

    Set up a production server with the new DXP version, configured to use your document repository and DXP database. You'll migrate your portal and system properties too. (Note, this step can be done in parallel with pruning your database.){.summary}

    1. [Request an Upgrade Patch From Liferay Support \(Liferay entreprise subscribers only\)](../04-upgrading-liferay/06-preparing-a-new-application-server-for-liferay-dxp.md#install-the-latest-upgrade-patch-or-fix-pack){.title}

    2. [Install the DXP Version You're Upgrading To](../installing-liferay-dxp-on-premises/02-installation-overview.md){.title}

    3. [Install the Latest Upgrade Patch or Fix Pack \(Liferay enterprise subscribers only\)](../04-upgrading-liferay/06-preparing-a-new-application-server-for-liferay-dxp.md#install-the-latest-upgrade-patch-or-fix-pack){.title}

    4. [Migrate Your OSGi Configurations \(7.0+\)](../04-upgrading-liferay/06-preparing-a-new-application-server-for-liferay-dxp.md#migrate-your-osgi-configurations-70){.title}

        Copy your OSGi configuration files (i.e., `.config` files) to your new server's `[Liferay_Home]/osgi/configs` folder.{.summary}

    5. [Update Your Portal Properties](../04-upgrading-liferay/06-preparing-a-new-application-server-for-liferay-dxp.md#update-your-portal-properties){.title}

        Migrate your portal properties to your new DXP server.{.summary}

        1. [Migrate Existing Portal Properties](../04-upgrading-liferay/06-preparing-a-new-application-server-for-liferay-dxp.md#migrating-existing-portal-properties){.title}

            Some of the portal properties have new values or have been removed or replaced. Update your properties for the new DXP version.{.summary}

        2. [Convert Applicable Properties to OSGi Configurations](../04-upgrading-liferay/06-preparing-a-new-application-server-for-liferay-dxp.md#convert-applicable-properties-to-osgi-configurations){.title}

            Many applications are configured using OSGi Configuration (Config Admin) instead of portal properties. Convert your existing properties to their OSGi Configuration replacements.{.summary}

    6. [Update Your Database Driver](../04-upgrading-liferay/06-preparing-a-new-application-server-for-liferay-dxp.md#update-your-database-driver){.title}

        Install the recommended database driver and update your database connection driver specified in your `portal-ext.properties` file.

    7. [Configure Your Documents and Media File Store](../04-upgrading-liferay/06-preparing-a-new-application-server-for-liferay-dxp.md#configure-your-documents-and-media-file-store){.title}

        The upgrade tool upgrades your Documents and Media file store too. Update your Documents and Media file store configuration and specify it for the upgrade tool.{.summary}

    8. [Disable Indexing](../04-upgrading-liferay/05-tuning-for-the-data-upgrade.md#disable-indexing){.title}

        Improve the data upgrade performance by disabling indexing.{.summary}

    9. [Configure Kerberos in Place of NTLM](../04-upgrading-liferay/06-preparing-a-new-application-server-for-liferay-dxp.md#configure-kerberos-in-place-of-ntlm){.title}

    10. Checkpoint: You've prepared a new DXP server for executing the data upgrade.

11. [Upgrade the Data for Production](../04-upgrading-liferay/02-upgrading-the-database.md){.title}

    This section walks you through selecting data upgrade options, configuring the upgrade, and executing the upgrade on data for production.{.summary}

    1. [Tune Your Database for the Upgrade](../04-upgrading-liferay/05-tuning-for-the-data-upgrade.md){.title}

    2. [Configure the Data Upgrade](../04-upgrading-liferay/07-configuring-the-data-upgrade-tool.md){.title}

        Configure the data upgrade, including the data store and whether to automatically upgrade the modules.{.summary}

    3. [Upgrade the Core](../04-upgrading-liferay/08-using-the-upgrade-tool.md){.title}

        1. [Run the Data Upgrade Tool](../04-upgrading-liferay/08-using-the-upgrade-tool.md#upgrade-tool-usage){.title}

            Run the data upgrade tool. Resolve any core upgrade issues.{.summary}

        2. [Issues Upgrading to 7.0 or Lower? Restore the Database Backup](../09-maintaining-a-liferay-dxp-installation/02-backing-up.md){.title}

            If the issues were with upgrades to Liferay 7.0 or lower, get a clean start by restoring the pruned production database backup.{.summary}

        3. [Upgrade Your Resolved Issues](../04-upgrading-liferay/08-using-the-upgrade-tool.md){.title}

            If there were issues upgrading to the new DXP version, resolve them and restart the data upgrade tool; continue if there were no issues.{.summary}

    4. [Upgrade the Liferay Modules](../04-upgrading-liferay/09-upgrading-modules-using-gogo-shell.md){.title}

        Learn how to use Gogo Shell to upgrade the Liferay modules, if you didn't upgrade them automatically with the core.{.summary}

        1. [Upgrade Modules that are Ready for Upgrade](../04-upgrading-liferay/09-upgrading-modules-using-gogo-shell.md#command-usage){.title}

            Discover which modules are ready for upgrade and upgrade them.{.summary}

        2. [Check Module Upgrade Status and Resolve Any Module Upgrade Issues](../04-upgrading-liferay/09-upgrading-modules-using-gogo-shell.md#checking-upgrade-status){.title}

        3. Checkpoint: You've upgraded your DXP installation (its files and data) for production. Post-upgrade tasks are all that's left.{.summary}

12. [Execute the Post-Upgrade Tasks](../04-upgrading-liferay/10-executing-post-upgrade-tasks.md){.title}

    Now that your installation is upgraded, clean up remnants of upgrading by restoring your database optimizations, enabling and regenerating your search indexes, and more.{.summary}

    1. [Remove the Database Tuning](../04-upgrading-liferay/10-executing-post-upgrade-tasks.md#review-database-configurations){.title}

    2. [Re-enable and Re-Index the Search Indexes](../04-upgrading-liferay/10-executing-post-upgrade-tasks.md#set-up-elasticsearch-and-re-index-search-indexes){.title}

    3. [Update Web Content Permissions \(7.0 and lower\)](../04-upgrading-liferay/10-executing-post-upgrade-tasks.md#enable-web-content-view-permissions){.title}

    4. [Address Any Deprecated Apps That Still Need Handling](../04-upgrading-liferay/98-deprecations-in-liferay-dxp-7-2.md){.title}

13. Checkpoint: You've completed the installation upgrade and post-upgrade tasks.

## Related Topics

* [Upgrading to Liferay DXP 7.2](../04-upgrading-liferay/01-introduction-to-upgrading-to-liferay-dxp-7-2.md)
* [Upgrading Your Code to DXP 7.2](https://help.liferay.com/hc/en-us/articles/360029316391-Introduction-to-Upgrading-Code-to-Liferay-DXP-7-2)
* [Liferay Upgrade Planner](https://help.liferay.com/hc/en-us/articles/360029147451-Liferay-Upgrade-Planner)
