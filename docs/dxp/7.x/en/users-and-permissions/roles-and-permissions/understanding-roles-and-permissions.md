# Understanding Roles and Permissions

How do [Users](./../users/understanding-users.md) get things done in Liferay DXP? They must have the proper Permissions.

Combine Permissions with Roles, Users, and User collections, and a complicated responsibility becomes much simpler to manage.

Consider a new employee at _The Peoples Bank_, Jane Slaughter. Jane is working as a Human Resources employee for the bank, so she must be able to manage Users throughout the Liferay DXP Virtual Instance. If there's already a Human Resources Organization, Jane is added to it and immediately has all the permissions that a Human Resources employee needs.

![Roles exist to get permissions to Users.](./understanding-roles-and-permissions/images/02.png)

<!-- Descriptive table or, even better, a diagram that makes clear the terms Role Permission User and User Collection (User Group, Site, Organization) --> 

New Employee ----> HR Organization ----> User Administrator Regular Role ----> Global Permissions for Adding, Deleting, Updating Users

To experience this, follow this logical flow while setting up your User Management paradigm:

1. Determine the functions needed
2. Determine the scope for each function
3. Create the Role
4. Create the User collection
5. Assign Users (preferably via User collection) to the Role
Roles collect Users that perform a particular function at a particular scope. The function the Role Users can fulfill depends entirely on the permissions assigned to the Role (and, by proxy, the Role Users). Roles collect permissions, and Users are assigned to Roles. Remember though, it's not efficient to manage Users one-by-one. There are various ways of grouping Users in Liferay DXP ([Organizations](./../organizations/understanding-organizations.md), [User Groups](./../user-groups/creating-and-managing-user-groups.md), [Sites](./../../site-building/building-sites/adding-members-to-sites.md), and [Teams](./../../site-building/building-sites/creating-teams-for-sites.md), for example). Assigning Roles to these User collections eases the burden of User permission delegation.

<!-- NOTE: To create the minimal HR Manager Role I outlined above you need this permissions rubric

General Control Panel Permission:

View Control Panel Menu (you can see the Control Panel Entry in the product menu)
Add User (gives you the Add button)


Then, you need these Users &rarr; Users and Organizations Permissions:


GENERAL PERMISSIONS
Access in Control Panel (to see the Users and Organizations menu item and the main view.

RESOURCE PERMISSIONS &rarr; USERS
View | See the list of Users
Update | Edit the Users' information
Delete | Deactivate and delete Users

But just provide the screenshot
-->

```tip::
   It's more efficient to assign User collections to a Role than individual Users. Even if there's just one user who surrently fulfills the function, things change. If the original Portal Content Reviewer wass Jane, when Jane leaves the company, it becomes a trivial task to assign John to the Portal Content Reviewer Role. Or a more optimistic scenario: Jane is overwhelmed as the only Portal Content Reviewer, because business is booming and new content must be created constantly. Well, assign John to the Portal Content Reviewer User Group that already has the Portal Content Reviewer Role.
```

![Assign Users to a role, directly or by their association with a Site, Organization, User Group, or Segment.](./understanding-roles-and-permissions/images/01.png)

Take a Message Board Administrator Role, for example. A Role with that name should have permissions relevant to the specific Message Board portlets delegated to it. Users with this Role inherit the permissions collected underneath the umbrella of the Role.

In addition to Regular Roles, Site Roles, and Organization Roles, there are also Teams. Teams can be created by site administrators within a specific Site. The permissions granted to a Team are defined and applied only within the Team's site. The permissions defined by regular, Site, and Organization Roles, by contrast, are defined at the global level, although they are applied to different scopes.

| Role Type         | Scope of the Function | Description |
| ----------------- | ---------------- | --------------------------------- |
| Regular Role      | Virtual Instance | Permissions and assignees are defined and applied at the global scope |
| Site Role         | Site             | Permissions are defined at the global level but applied to one specific Site |
| Organization Role | Organization     | Permissions are defined at the global level but applied to one specific Organization |
| Team Role         | Site             | Permissions and assignees are defined within a specific Site and apply within that specific Site |

**Note:** Some permissions cannot be handled from the control panel. Asset-level permissions (for instance, permission to edit an individual blog post, or view a folder in the Documents and Media library) are managed from the individual asset. See [Widget Permissions](/docs/7-2/user/-/knowledge_base/u/widget-permissions) for details.

## Deleting Asset Containers Deletes their Assets

A Web Content Folder contains Web Content articles. The Web Content Folder is an asset container, and the Web Content Article is an asset. It's possible to give a Role permission to delete an asset container without giving the Role permission to delete individual assets. In that case, beware: if a Role assignee deletes an asset container with individual assets in it, the individual assets themselves are deleted as well.

| Asset Container | Asset |
| --------------- | ------- |
Besides Web Content Folders, examples of asset containers include Bookmarks Folders, Message Boards Categories, Wiki Nodes, and Documents and Media Folders.

You might not need to create a Role for a certain functionality. Liferay provides many pre-configured Roles for your convenience.

## Default Liferay Roles

In the Roles Application appears a list of all the Roles in Liferay, by scope. 

These are some of the pre-configured regular Roles:

- Guest: The Guest role is assigned to unauthenticated users and grants the lowest-level permissions. 
- User: The User role is assigned to authenticated Users and grants basic permissions (mostly *Add to Page* permissions for their own Sites).
- Power User: The Power User Role grants more permissions than the User Role.
  It's an extension point for distinguishing regular Users from more privileged Users. For example, you can set things up so that only Power Users have personal sites.
- Administrator: The administrator Role grants permission manage the entire portal, including global portal settings and individual Sites, Organizations, and Users.

These are some of the pre-configured site roles:

- Site Member: The Site Member Role grants basic privileges within a Site, such as permission to visit the Site's private pages.
- Site Administrator: The Site Administrator Role grants permission to manage *almost* all aspects of a Site including site content, site memberships, and site settings. Site Administrators cannot delete the membership of or remove roles from other Site Administrators or Site Owners. They also *cannot* assign other Users as Site Administrators or Site Owners.
- Site Owner: The Site Owner Role is the same as the Site Administrator Role except that it grants permission to manage *all* aspects of a Site, including permission to delete the membership of or remove Roles from Site Administrators or other Site Owners. They *can* assign other users as Site Administrators or Site Owners.

These are some of the pre-configured organization roles:

- Organization User: The Organization User role grants basic privileges within an Organization. If the Organization has an attached Site, the Organization User Role implicitly grants the Site member Role within the attached Site.
- Organization Administrator: The Organization Administrator Role grants permission to manage *almost* all aspects of an Organization including the Organization's Users and the Organization's Site (if it exists). Organization Administrators cannot delete the membership of or remove Roles from other Organization Administrators or Organization Owners. They also *cannot* assign other Users as Organization Administrators or Organization Owners.
- Organization Owner: The Organization Owner Role is the same as the Organization Administrator Role except that it grants permission to manage *all* aspects of an Organization, including permission to delete the membership of or remove Roles from Organization Administrators or other Organization Owners. They *can* assign other Users as Organization Administrators or Organization Owners.

**Tip:** It's easy to overlook the differences between owner type roles and administrator type roles for Sites and Organizations. Site and Organization administrators *cannot* remove the administrator or owner Role from any other administrator or owner, and they *cannot* appoint other Users as site or organization administrators or owners.

In contrast, site and organization owners *can* do those things.

Roles, and the permissions granted with their assignment, are foundational components in Liferay. Understanding their uses and configuration enhances your ability to configure Liferay DXP to suit your organizational needs.
