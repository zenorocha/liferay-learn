# Understanding Roles and Permissions

To get things done in Liferay DXP, [Users](./../users/understanding-users.md) must have the proper permissions. Roles are the vehicle for granting those permissions.

Combine Permissions with Roles, Users, and User collections, and the complex task of managing Users and their permissions becomes a much simpler job.

![Roles exist to get permissions to Users.](./understanding-roles-and-permissions/images/02.png)
<!-- Probably need to rename the Role column to Regular Role? Leaves out Accounts, Asset Libraries -->

Regular Roles, those that apply permissions at the global scope (throughout the Virtual Instance), are defined and .

Consider a new employee of your company, Jane Slaughter. Jane will work as a Human Resources Manager, so she must be able to manage Users throughout the Liferay DXP Virtual Instance. If there's already a Human Resources Organization with a Role collecting these permissions, Jane is added to the Organization and immediately has all the permissions that a Human Resources employee needs.

The diagram above shows only one fully-executed Role assignment (for the Human Resources Manager User--Jane slaughter), but you can see how drawing new arrows would link the User with permissions via other User collections.
<!-- New Employee ----> HR Organization ----> User Administrator Regular Role ----> Global Permissions for Adding, Deleting, Updating Users
-->

The flow of Role creation could look like this:

1. Determine the function needed: Manage Users in Liferay DXP.
1. Determine the scope: Throughout the Virtual Instance (globally).
1. Create the Role, assigning the permissions that power the function. HR Manager Role.
1. Create the User collection: Human Resources Department = Organization.
1. Assign the Role to the User Collection: Human Resources Department &rarr; HR Manager Role.
1. Assign Users to the User Collection: Jane Slaughter &rarr; Human Resources Department.

There are several User collections that can be assigned Regular Roles:

- [Organizations](./../organizations/understanding-organizations.md) hold Users of a shared hierarchical level.
- [User Groups](./../user-groups/creating-and-managing-user-groups.md) hold Users that only share the need to perform the same function.
- [Sites](./../../site-building/building-sites/adding-members-to-sites.md) hold Users that might need to perform actions scoped only to that Site. <!-- Don't really understand this one -->
- [Segments](./../../site-building/personalizing-site-experience/segmentation/creating-and-managing-user-segments.md)]

The details around assigning permissions to the Role and assigning the Role to Users are covered in the articles of this section.

First, though, it's helpful to understand the scope at which Roles can be defined.

## 

| Permission Scope | Role Type | Where are its permissions defined?      | Where is it assigned to Users? |
| ---------------- | --------- | --------------------------------------- | -------- |
| Global           | Regular   | Control Panel &rarr; Users &rarr; Roles | Control Panel &rarr; Users &rarr; Roles |
| A single Organization | Organization | Control Panel &rarr; Users &rarr; Roles | Control Panel &rarr; Users &rarr; Users and Organizations (Organizations) |
| A single Site    | Site   | Control Panel &rarr; Users &rarr; Roles | Control Panel &rarr; Users &rarr; Roles |
| A single Account | Account   | Control Panel &rarr; Users &rarr; Roles | Control Panel &rarr; Users &rarr; Roles |
| A single Asset Library | Asset Library | Control Panel &rarr; Users &rarr; Roles | Control Panel &rarr; Users &rarr; Roles |

<!-- Left Segments out since they're not a Role type for a permission level, they're just for assigning a role. -->

Regular Roles Assignments
User Groups
Organizations
Sites
Segments
Single Users

Done in Roles Admin

Organization Role Assignments
Assign directly to Users

Done in User and Organizations &rarr; Organizations, in the Actions menu or the Org options menu after clicking into the Org

Site Role Assignments
Assign directly to Users OR
Assign to Teams

Assign Roles to Users in the Members section of Site Admin

Account Roles are applied to an account and assigned within the account. Permissions defined in roles admin

Asset Library Roles? Same paradigm as account roles but i don't know where these things live in portal



To get a little more into the details, Roles collect Users that perform a particular function at a particular scope. The function the Role Users can fulfill depends entirely on the permissions assigned to the Role (and, by proxy, the Role Users). Roles collect permissions, and Users are assigned to Roles. Remember though, it's not efficient to manage Users and their permissions one-by-one. There are various ways of grouping Users in Liferay DXP, and all of them can be used to grant regular scoped permissions:

- [Organizations](./../organizations/understanding-organizations.md) hold Users of a shared hierarchical level.
- [User Groups](./../user-groups/creating-and-managing-user-groups.md) hold Users that only share the need to perform the same function.
- [Sites](./../../site-building/building-sites/adding-members-to-sites.md) hold Users that might need to perform actions scoped only to that Site. <!-- Don't really understand this one -->
- [Segments](./../../site-building/personalizing-site-experience/segmentation/creating-and-managing-user-segments.md)]

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
