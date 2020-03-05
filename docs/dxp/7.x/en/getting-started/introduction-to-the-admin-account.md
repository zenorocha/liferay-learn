# Introduction to the Admin Account

The Admin user is created by default in any new installation of Liferay DXP and has full permissions to modify every facet of a Liferay DXP instance. The Admin user can create, modify, and delete Sites, Users, pages, and perform all Site administrative tasks.

## Accessing Liferay DXP as the Admin User

1. Open a browser to `http://localhost:8080`.
1. Click the _Sign In_ link.

    ![Sign In Link](./introduction-to-the-admin-account/images/01.png "Sign In Link")

    ```note::
       If a Liferay DXP bundle is being used, you may be presented with the `Setup Wizard <../installation-and-upgrades/installing-liferay/running-liferay-dxp-for-the-first-time.md>`_. Follow the on-screen instructions to configure your Admin user.
    ```

1. Enter the default admin credentials to log in.

    * Email address: `test@liferay.com`
    * Password: `test`

    ```warning::
       It is **highly** recommended that the default login credentials be updated when starting a new Liferay DXP installation.
    ```

## Configuring the Admin User

### Changing the Login Password

1. Click the _User Avatar_ and navigate to _Account Settings_ &rarr; _Password_.
1. Enter your _Current Password_ and provide a new password.

    ![Setting a Password](./introduction-to-the-admin-account/images/04.png "Setting a Password")

### Changing Account Information

1. Click the _User Avatar_ &rarr; _Account Settings_.

    ![Account Settings](./introduction-to-the-admin-account/images/02.png "Account Settings")

1. In the _Information_ tab, change or add user information as needed.

    ![Account Information](./introduction-to-the-admin-account/images/03.png "Account Information")

## Signing Out

To log out of your account:

1. Click the _User Avatar_ &rarr; _Sign Out_.

    ![Signing Out](./introduction-to-the-admin-account/images/05.png "Signing Out")

## Creating a New Admin User

Now that you know how to log in, we strongly recommend that you create a new admin user for everyday use.

To create a new admin account follow these steps:

1. Create a new user. See [Adding Users](../users-and-permissions/users/adding-and-managing-users.md) to learn how.
1. Click the *Roles* link in the left navigation pane (in the *Edit User* page's *General* tab).
1. Click *Select* under Regular Roles. Select the Administrator role from the list (click *Choose*). The dialog box disappears and the Role is added to the list of Roles associated with your account.

The user is now a portal administrator. Log out and then log back in with your new user account.

## What's Next

Continue our Getting Started walkthrough by familiarizing yourself with the [DXP Product Menu](./navigating-dxp.md).

Learn more about [configuring how users log into DXP](../installation-and-upgrades/securing-liferay/authentication-basics.md).
