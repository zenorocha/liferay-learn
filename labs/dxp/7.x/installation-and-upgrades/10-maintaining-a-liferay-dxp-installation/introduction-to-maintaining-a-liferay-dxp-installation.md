# Introduction to Maintaining a Liferay DXP Installation

Once you have Liferay DXP deployed, you can add to it, update it, and apply fixes. In preparation for any failure or unwanted side affects from modifying your DXP installation, you should implement a plan for backing up your system and restoring it. You can start with identifying the system components to back up and then continue updating your DXP system with the latest fixes. 

## Backing Up Your System

Storing copies of your DXP files, databases, and customization source code allows you to restore your system. See [Backing Up](./backing-up.md) for guidance on persisting and restoring system components. 

## Updating DXP 

Maintaining your DXP instance involves [patching](./installing-patches/introduction-to-installing-patches.md) it, deploying [configuration changes](https://help.liferay.com/hc/en-us/articles/360029131651-Understanding-System-Configuration-Files), [updating apps](https://help.liferay.com/hc/en-us/articles/360029134911-Managing-and-Configuring-Apps), and updating third-party software (e.g., the application server, JVM, and more). Any updates that affect your production instance require careful planning. The [DXP cluster update instructions](../10-maintaining-clusters/01-maintaining-clustered-installations.md) describe ways to handle these updates.

Patching your system regularly (subscription) or [upgrading your CE instance](./updating-dxp-ce.md) to a new GA gives you the latest bug fixes. The [patching articles](./installing-patches/introduction-to-installing-patches.md) explain the different DXP patch types and how to install them using the Patching Tool. 

Read on to learn how to keep your system running well. 