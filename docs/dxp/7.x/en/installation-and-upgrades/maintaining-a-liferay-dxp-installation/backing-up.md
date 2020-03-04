# Backing Up

Once you have your DXP installation running, you should implement a comprehensive backup plan. In case some kind of catastrophic hardware failure occurs, you'll be thankful to have backups and procedures for restoring DXP from one of them. The backup copies are also valuable for testing updates (e.g., DXP upgrades, new plugins, and more). In this way, DXP backups and updates work hand in hand. 

DXP isn't very different from other Java web applications that might be running on your application server. Nevertheless, there are some specific components you should include in your backup plan.

## Backing up Source Code

If you have extended DXP or have written any plugins, they should be stored in a source code repository such as Git or BitBucket. You should back up your source code repository on a regular basis to preserve ongoing work.

## Backing up the DXP Installation

It's best to back up your entire application server and [Liferay Home folder](../reference/liferay-home.md) contents.

The application server has the DXP descriptors, deployments, and dependencies you might have customized. If you've customized DXP's `web.xml` file, for example, you should back it up because a DXP patch's `web.xml` always overwrites the existing one. Backing up your entire application server is suggested.

The Liferay Home folder is important to back up because it contains the following files (and more):

- **Portal properties and system properties:** The Liferay Home folder stores DXP [portal properties files](../reference/portal-properties.md) (e.g., `portal-ext.properties`, `portal-setup-wizard.properties`, etc.) and DXP [system properties files](../reference/system-properties.md) (e.g., `system-ext.properties`). You should absolutely back them up.

- **`/data` folder:** DXP stores configuration files, search indexes, and cache information in Liferay Home's `/data` folder. If you're using the File System store or the Advanced File System store, the [Documents and Media repository](https://help.liferay.com/hc/en-us/articles/360028810112-Document-Repository-Configuration) is also stored here by default. It's always important to back up your `/data` folder.

- **`/license` folder (Subscription):** Holds the activation key for your enterprise subscription.

    > Subscription

- **`/osgi` folder:** The files that comprise DXP's OSGi runtime are stored in Liferay Home's `/osgi` folder. It contains all of the app and module JAR files deployed to DXP. The `/osgi` folder also contains other required JAR files, [configuration files](https://help.liferay.com/hc/en-us/articles/360029131651-Understanding-System-Configuration-Files), and log files. 

- **`/logs` folder:** Contains DXP's log files. If a problem occurs on DXP, the log files provide information for determining what went wrong. 

The Liferay Home folder contains all the files and folders mentioned above. Thus, if you're backing up both your application server folder and your Liferay Home folder, you're in good shape.

Using a source control repository such as Git, BitBucket, Subversion, or CVS, is a great way to back up your Liferay Home folder.

```tip::
   Using a source control repository and an orchestration tool such as `Jenkins <https://jenkins.io/>`_ is recommended for promoting DXP environments through `DevOps <https://en.wikipedia.org/wiki/DevOps>`_ pipelines.
```

```important::
   If you configured your `Documents and Media repository <https://help.liferay.com/hc/en-us/articles/360028810112-Document-Repository-Configuration>`_ to a location other than the default location, back up that location.
```

## Backing up the Database

DXP's database is the central repository for all of the portal's information. It's the most important component to back up. You can back up the database live (if your database allows this) or by exporting (dumping) the database into a file and then backing up the exported file.

For example, MySQL's `mysqldump` utility exports the entire database and data into a large SQL file. This file can then be backed up. On restoring the database you can import this file into the database to recreate the database state to that of the time you exported the database.

```important::
   If you've placed your search index into a database (not recommended; see the `DXP Clustering <https://help.liferay.com/hc/en-us/articles/360029123831-Liferay-DXP-Clustering>`_ article for information on using Cluster Link or Solr), you should back up that database too.
```

If you wish to avoid re-indexing your content after restoring your database, back up your search indexes. This is easiest to do if you have a separate [Elasticsearch or Solr](https://help.liferay.com/hc/en-us/articles/360028711092-Introduction-to-Installing-a-Search-Engine) environment on which your index is stored. If you're in a clustered configuration and you're replicating indexes, you must back up each index replica.

## Conclusion 

Restoring your application server, your Liferay Home folder, the locations of any file system-based media repositories, and your database from a backup system should give you a functioning portal. Restoring search indexes should avoid the need to re-index when you bring your site back up after a catastrophic failure. Exercising good, consistent backup procedures such as these, are key to recovering successfully from a hardware failure.