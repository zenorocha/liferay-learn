# Setting Up Marketplace and Portal Security

[Liferay Marketplace](https://www.liferay.com/marketplace) is more than just a store for Liferay applications. Under the hood, it provides both the store and DXP 7.2's application deployment features. For this reason, ensure that Marketplace can run and configure itself.

Here are some scenarios to work around to ensure Marketplace works successfully:

* Server is Protected by a Firewall without Access to the Internet
* Limited Database Access

The firewall scenario is discussed first.

## Server is Protected by a Firewall without Access to the Internet

The server might be behind a firewall that prevents access to the Internet. Or your security policy might not allow direct download and installation from the Internet. In these cases, there are two options:

1. From an Internet-enabled computer, download the [Marketplace plugin](https://www.liferay.com/marketplace/download). Then deploy the plugin (`.lpkg` file) by copying it into the `deploy` folder in [Liferay Home](https://help.liferay.com/hc/en-us/articles/360028712272-Liferay-Home).
1. Alternately, download the `.lpkg` file and deploy it using the [App Manager](https://help.liferay.com/hc/en-us/articles/360029134911-Managing-and-Configuring-Apps).

## Limited Database Access

Some production environments do not have the necessary database permissions for DXP 7.2, apps, modules, and plugins to maintain their tables. In these cases:

1. Grant the DXP 7.2 database user temporary full rights to the database.
1. Install @product@ and start it so that it populates its database.
1. Once the database is created, remove the permissions for creating tables and dropping tables from the @product@ database user.

See the [database preparation instructions](./preparing-the-database.md) for more information. Note that many sophisticated @product@ apps---not just the Marketplace app---require new tables when deployed. If the environment restricts database access, it is necessary to repeat the above steps when deploying a new app.
