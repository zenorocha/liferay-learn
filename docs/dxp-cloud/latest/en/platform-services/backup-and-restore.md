# Backup and Restore

It's important for production applications' data to be safe. DXP Cloud can 
backup and restore data. All backups save a dump of the database, environment 
volumes, and the Documents and Media folder. Here, you'll learn how to create 
and restore backups manually via the DXP Cloud web console: 

-   [Creating a Manual Backup](#creating-a-manual-backup)
-   [Restoring from a Backup](#restoring-from-a-backup)

For instructions on configuring the backup service, including automatic backups, 
see 
[Backup Service](./backup-service.md). 

> **Note:** The Backups tab is only available on production environments. From this tab, you can restore backups to any environment that a user has access to. 

## Creating a Manual Backup

Follow these steps to create a manual backup: 

1.  On your production environment's page, select the *Backups* tab in the left 
    menu. 

2.  Click *Backup Now*. 

![Figure 1: You can create backups in DXP Cloud.](./backup-and-restore/images/01.png)

## Restoring from a Backup

The Backups tab contains a table that shows each backup in the environment. The 
table displays each backup's name, size, and creation date and time. To restore 
from a backup, click that backup's *Actions* button 
(![Actions](./backup-and-restore/images/02.png)) 
in the table and select *Restore*. 

![Figure 2: You can restore from a backup in DXP Cloud.](./backup-and-restore/images/03.png)
