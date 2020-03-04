# Adding and Managing Users

Core user management activities include adding, editing, and deleting users. These activities are typically restricted to Administrative users.

## Adding Users

1. From the Product Menu, click *Control Panel* &rarr; *Users* &rarr; *Users and Organizations*.
1. In the Users tab, click the *Add* button ![Add](../../../images/icon-add.png).

   ![Add Users from the Users and Organizations section of the Control Panel.](./adding-and-managing-users/images/01.png)

1. Fill out the Add User form and click *Save*. At a minimum, provide a Screen Name, First Name, Last Name, and Email Address for the User.

    ```note::
        **Note:** Screen names and email addresses are not interchangeable. A screen name cannot contain an `@` symbol because it is used in the URL to a User's private page.

        The Add User functionality is split over several independent forms. Save the first form to create the User, and then you'll see a success message saying `Success. Your request completed successfully.`
    ```

Once you create the User, additional information can be added.

### Setting Passwords for New Users

When you create a User, Liferay DXP generates his/her password. If a [mail server was set up](../../../installation-and-upgrades/setting-up-liferay-dxp/connecting-to-a-mail-server.md), Liferay DXP sends an email message with the User's new password.

If you haven't set up a mail server, click the *Password* item from the General menu and manually set a password for your new user. Enter the new password twice.

![Enter the password twice to manually set the password for a user. If the Password Policy you're using is configured to allow it, select whether to require the user to reset their password the first time they sign in to the portal.](./adding-and-managing-users/images/03.png)

## Editing Users

1. Click on *Users and Organizations* in the Control Panel

1. Click the *Actions* button (![Actions](../../../images/icon-actions.png)) next to that user to edit.

1. The following options are available:

| Option | Description |
| --- | --- |
| Edit | Modify any aspect of the User account. |
| Permissions | Define which Roles have permissions to edit the User. |
| Manage Pages | Configure the personal pages of a User. |
| Impersonate User | Browse the Site in another window as though you were that User. |
| Deactivate | [Disable the user's account](#deactivating-users). |
| Erase Personal Data | [Delete the User's personal data](./03-managing-user-data/01-intro.md). |
| Export Personal Data | [Download the User's personal data](./03-managing-user-data/03-exporting-user-data.md). |

## Deactivating and Deleting Users

Removing Users is a two-step process for several reasons:

- You or the User may decide you really wanted that account.
- Users are often tied to content with possible [legal ramifications](./managing-user-data-gdpr-compliance/managing-user-data.md) in your country.
- You may need time to review a User's account activity before removing all evidence of that User's existence.

For these and more reasons, you must first *deactivate* a User before *deleting* that User.

### Deactivating Users

Deactivating a User prevents the user from logging in, but preserves the User. You can toggle between active and inactive Users in the Users view. If all the Users are active, this filtering option doesn't appear.

To deactivate a user,

1. Navigate to *Control Panel* &rarr; *Users* &rarr; *Users and Organizations* to locate the User to deactivate.
1. Click the *Actions* (![Actions](../../../images/icon-actions.png)) menu for the User and select *Deactivate*.

The User is now deactivated and can no longer log in. Users can be reactivated by finding them in the Users table (be sure you're filtering the table results by Deactivated users), clicking the Actions menu, and selecting *Activate*. There's no confirmation window for activation: they're automatically restored to their former status once Activate is clicked.

### Deleting Users

To guard against accidental deletion of Users, users must be deactivated first, and then can be deleted.

1. Deactivate the user.
1. Click on *Filter and order* in the top of the table and a selector appears. Click *Inactive*, and you can see the User you just deactivated.

    ![To delete Users, first filter to show inactive or deactivated Users.](./adding-and-managing-users/images/05.png)

1. Click the Actions menu again, and click *Delete* if you really mean to delete the User.

The user is deleted. There is no way to recover the User once deleted besides restoring from a prior backup.

## Impersonating Users

You can impersonate Users to view the system as the User would see it. This helps to diagnose permission issues an administrator can't see, such as making sure a User doesn't have access to sensitive data. Only Users with the Administrator Role can impersonate.

1. Click Control Panel &rarr; *Users and Organizations* to see the list of Users and find the one you want to impersonate.
1. Click that User's *Actions* button (![Actions](../../../images/icon-actions.png)).
1. Click *Impersonate User*.

This opens another browser window logged in as that User.

## Resetting a User Password

The Add User functionality includes a *Require Password Reset* check box at the bottom of the Password form. The default password policy prevents administrators from de-select this option. You can, however, modify the default password policy so this box becomes usable.

1. Navigate to *Password Policies* in Control Panel &rarr; Users.
1. Click on the *Default Password Policy*.
1. De-select the *Change Required* switcher in the Password Changes section. Now you can decide whether users you add must reset their passwords.

See [Password Policies](../../devops/password-policies.md) for more information on editing the default policy or creating your own.

<!-- If we don't have related links, let's comment this out.
## Related Information

* Related
* Links -->
