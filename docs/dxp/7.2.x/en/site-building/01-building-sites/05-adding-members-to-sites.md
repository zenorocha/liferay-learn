# Adding Members to Sites

Users and Sites are important concepts. Sites are where all your content and pages are stored, and Users access and create that content. While User management is covered in depth in [User Management](TODO), there are other User configuration options specific to Site management:

- Adding members to sites administratively
- Adding members to sites automatically
- Creating Teams of site members for various functions

See [Creating Teams](./06-creating-teams-for-sites.md) for more information on creating Teams. The steps below show how to add users manually to Sites and how to provide options for self management.

## Administrating Site Membership

Administrators can manage Site members from that Site's *Site Membership* page.

1.  Open *Site Administration* and select the Site that you want to manage members for.
 
2.  Click on *People* &rarr; *Memberships*

From here you can manage Site Memberships, Organization, and User Group associations. You can learn more about those in [Users and Organizations](TODO). Here you see a list of all of the current users of the Site and you can add or remove user memberships from the Site.

![Figure 1: The current members of the Site as displayed on the *Site Memberships* page. ](./images/site-memberships.png)

### Adding Members to a Site

Follow these steps to make an existing User a member of the Site:

1.  Click the *New* (![Add User](../../../images/icon-add.png)) button in the top right of the screen.

2.  Use *Filter and Order* or the *Search* function to locate the User you want to add to the Site.
 
3.  Select the User(s) you want to add and click *Done*.

On the *Assign Users to This Site* screen, all users eligible to be added to the Site appear. Deactivated users do not appear. Site members also appear, but with a greyed-out checkbox.

![Figure 2: The list of users available to add to the current Site. Note that the current members are visible but cannot be added or removed here. ](./images/assign-users.png)

### Removing User Membership from a Site

There are two ways to remove a User from a Site. To remove an individual member, follow these steps:

1.  Click the *Actions* (![Actions](../../../images/icon-actions.png)) icon for the User that you want to remove.
 
2.  Select *Remove Membership*.

3.  In the pop-up that appears, confirm the removal.

![Figure 3: Selecting to remove a user. ](./images/remove-user.png)

To bulk remove Users from a Site, follow these steps:

1.  Click the checkbox for each User that you want to remove.

2.  In the menu at the top of the page, click the `X` icon to remove the
    Users from the Site. 

3.  In the pop-up that appears, confirm the removal.

Removed Users lose access to the Site's Private Pages and membership in any Site Roles or Teams they had. 

### Assigning Site Roles

Roles grant permissions in Liferay Portal. Roles can be assigned for the entire instance or just for one specific Site or Organization. Site Roles assign permissions for a specific Site. Follow these steps to assign Site Roles to Users:

1.  Select a User or Users and click *Assign Site Roles* (either through the Actions menu or the menu at the top). This take you to the *Assign Site Roles* screen.

2.  Select the Roles that you want to assign to the selected User(s).

2.  Click *Done*.

![Figure 4: Assigning Site Roles.](./images/assigning-site-roles.png)

## Additional Information

Site membership provides these key benefits:

- Only Site members can view a Site's Private Pages.

- Site members have more permissions than guests for many widgets like Message Boards and Wikis that enable them to create content and collaborate on your site.

- Site members can be associated with Roles that grant Site privileges.

Site Roles are created at a global level, but when they're assigned they only provide privileges for the specific Site where they were assigned. Since Roles are created at a global level, they can't be created by Site Administrators (since Site Administrators only have Administrator privileges for their Site). *Teams*, however, let Site Administrators assign permissions to groups of Users within their sites. See [Creating Teams](./06-creating-teams-for-sites.md) for more information.
