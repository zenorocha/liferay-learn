# Setting Up Marketplace

[Liferay Marketplace](https://www.liferay.com/marketplace) is a suite of applications on Liferay DXP that provide the following functionality:

* Storefront access to the Liferay Marketplace to review, purchase, and install applications
* Access for Liferay Subscribers to the Liferay Subscription App library
* An App Manager enables administrators to deploy and manage applications through the front-end

![The Liferay Marketplace Storefront](./setting-up-marketplace/images/01.png)

Enabling access to the storefront and the Liferay Subscription app library requires that your Liferay DXP installation have access to the Liferay Marketplace. For most users, the steps to enable Liferay Marketplace are as follows:

1. Log in to your Liferay DXP installation as an Administrator
1. Navigate to _Control Panel_ →_Apps_ → _Store_
1. Click _Sign In_
1. Sign in using your Liferay.com account credentials
1. Grant access to Liferay Marketplace

In some deployment situations, additional configuration may be required to setup and use Liferay Marketplace.

## Server is Protected by a Firewall Without Access to the Internet

The server might be behind a firewall that prevents access to the Internet. Or an organization's security policy may not allow direct download and installation from the Internet. In these cases, there are two options:

1. From an Internet-enabled computer, download the [Marketplace plugin](https://www.liferay.com/marketplace/download). Then deploy the plugin (`.lpkg` file) by copying it into the `deploy` folder in [Liferay Home](../14-reference/01-liferay-home.md).
1. Alternately, download the `.lpkg` file and deploy it using the [App Manager](https://help.liferay.com/hc/en-us/articles/360029134911-Managing-and-Configuring-Apps).

## Limited Database Access

Some production environments do not have the necessary database permissions for DXP 7.2, apps, modules, and plugins to maintain their tables. In these cases:

1. Grant the DXP 7.2 database user temporary full rights to the database.
1. Install Liferay DXP and start it so that it populates its database.
1. Once the database is created, remove the permissions for creating tables and dropping tables from the Liferay DXP database user.

See the article [Connecting a Database](./04-connecting-a-database.md) for more information. Note that many sophisticated Liferay DXP apps---not just the Marketplace app---require new tables when deployed. If the environment restricts database access, it is necessary to repeat the above steps when deploying a new app.

## Additional Information

* Registering as a Liferay Marketplace Developer
* Publishing Applications to the Liferay Marketplace
