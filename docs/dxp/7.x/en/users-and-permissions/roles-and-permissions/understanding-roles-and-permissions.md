# Understanding Roles and Permissions

To get things done in Liferay DXP, [Users](./../users/understanding-users.md) must have the proper permissions. Roles join Users with permissions. Most administrative work for Roles and permissions is done in *Control Panel* &rarr; *Users* &rarr; *Roles*.

![Manage Roles from the Control Panel.](./understanding-roles-and-permissions/images/03.png)

To skip straight to creating Roles and assigning Users, see

- [Role Creation and Management](./role-creation-and-management.md)
- [Defining Role Permissions](./defining-roles-and-permissions.md)
- [Assigning Users to Roles](./assigning-users-to-roles.md)

```note::
   `Site Teams <./../../site-building/building-sites/creating-teams-for-sites.md>`_ have a dedicated permissions management User Interface.
```

## Roles

To give Users the permissions they need to perform their intended function within Liferay DXP, you must first mate the set of permissions with a Role.

Using a _Message Boards Admin_ Role and a User _Jane Slaughter_ as an example, here are the steps you might follow:

1. Determine the function needed: _Manage Message Boards in Liferay DXP._
1. Determine the scope: _Throughout the Virtual Instance (globally)._
1. Create the properly scoped Role, assigning the permissions that power the function: _Message Boards Admin (Regular Role)._
1. Create the User collection: _a User Group called Message Boards Administrators._
1. Assign the Role to the User Collection: _Message Boards Administrators &rarr; Message Boards Admin Role._
1. Assign Users to the User Collection: _Jane Slaughter &rarr; Message Boards Administrators._

The conceptual diagram below shows how the User inherits the necessary permissions in Liferay DXP's Roles and Permissions system. Only one fully-wired Role assignment is displayed here (for the User who becomes a Message Boards Administrator), but you can see how drawing new arrows would link the User with permissions via other User collections and Role assignments.

![Roles exist to link permissions efficiently with Users.](./understanding-roles-and-permissions/images/02.png)

<!-- Save for the How-to article; clutters it up here ![Define the permissions of the Role.](./understanding-roles-and-permissions/images/04.png) -->

<!--![Assign the Role to Users.](./understanding-roles-and-permissions/images/05.png) -->

Roles have scope, so they apply at different levels.

<!-- To Rich: I removed the former third column as you suggested, but added another, to show which assignments are possible -->
| Permission Scope | Role Type | Where is it assigned to Users? | Available Assignments |
| ---------------- | --------- | -------- | --------- |
| Throughout the Virtual Instance (global) | Regular   | Control Panel &rarr; Users &rarr; Roles (Click on the Role) &rarr; Assignees | User Groups <br />Organizations <br />Sites <br />Segments <br />Individual Users |
| A single Organization | Organization | Control Panel &rarr; Users &rarr; Users and Organizations &rarr; Organizations (Organization actions menu) | Individual Users |
| A single Site    | Site   | Site Administration &rarr; People &rarr; Memberships | User Groups <br />Organizations <br />Segments <br />Individual Site Members |
| A single Account | Account   | Control Panel &rarr; Accounts &rarr; Accounts (Select Account) &rarr; Roles | Individual Account Members
| A single Asset Library | Asset Library | Site/Library Administration of Asset Library &rarr; People &rarr; Memberships | Organizations <br />User Groups <br /> Individual Users |

Individual [Users](./../users/understanding-users.md) can be manually assigned to Roles. It's just less efficient than using collections of Users. Users can also be [automatically](../../system-administration/virtual-instances/configuring-a-virtual-instance-users.md#default-user-associations) assigned to Roles of all scopes through a Virtual Instance Setting called Default User Associations.

### Regular Roles 

Instance scoped Roles are called Regular Roles. These Roles are used for granting permissions globally, or throughout the [Virtual Instance](./../../system-administration/virtual_instances.rst).

Several User collections can be assigned to Regular Roles:

- [Organizations](./../organizations/understanding-organizations.md) hold Users of a shared hierarchical level.
- [User Groups](./../user-groups/creating-and-managing-user-groups.md) hold Users that only share the need to perform the same function.
- [Sites](./../../site-building/building-sites/adding-members-to-sites.md) hold Users (as Site Members) that might need to perform a certain action.
- [Segments](./../../site-building/personalizing-site-experience/segmentation/creating-and-managing-user-segments.md) hold Users of a Site that match certain conditions.

### Organization Roles

Organization scoped Roles are called Organization Roles. Permissions for Organization Roles are defined at the global level and are applied to one specific [Organization](../../users-and-permissions/organizations/understanding-organizations.md). Users are added to Organizations individually and are assigned to Organization Roles individually.

### Site Roles

Site scoped Roles are called Site Roles. Permissions for Site Roles are defined at the global level and are applied to one specific [Site](../../site-building/introduction-to-site-building.md). Individual Users, Organizations, and User Groups can be used both to control Site Membership and assign Site Roles.

## Permissions

Permissions for higher level scopes are granted via [Roles](#roles) defined in the Control Panel, and are covered in detail in this section. Managing permissions in the Control Panel covers a lot of use cases, but there are some cases where permissions must be granted in a more granular fashion: for instance, for  individual applications and even individual Assets. 

### Application Scoped Permissions

Permissions can be granted on each widget instance that's placed on a page in Liferay DXP, and each administrative application in the Site Menu &rarr; Content and Data section. See [Widget Permissions](./../../site-building/displaying_content.rst) for details.

### Asset Scoped Permissions

Asset-level permissions (for instance, permission to edit an individual blog post, or view a folder in the Documents and Media library) are managed from the individual asset, not the Control Panel. See [Widget Permissions](./../../site-building/displaying_content.rst) for details.

<!-- To Rich: Should this section be moved to a separate reference article? It adds 466 words -->
## Default Roles

In the Roles Application appears a list of all the Roles in Liferay DXP, by scope. 

These are some of the pre-configured regular Roles:

**Guest:** The Guest Role is assigned to unauthenticated visitors and has the lowest-level permissions. 

**User:** The User Role is assigned to authenticated Users and grants basic permissions (mostly *Add to Page* permissions for their own Sites).

**Power User:** The Power User Role grants more permissions than the User Role. It's an distinguishes regular Users from more privileged Users. For example, you can define it so that only Power Users have personal Sites.

**Administrator:** The administrator Role grants permission to manage the entire installation, including global settings and individual Sites, Organizations, and Users.

These are some of the pre-configured Site Roles:

**Site Member:** The Site Member Role grants basic privileges within a Site, such as permission to visit the Site's private pages.

**Site Administrator:** The Site Administrator Role grants permission to manage *almost* all aspects of a Site including Site content, Site memberships, and Site settings. Site Administrators cannot delete the membership of or remove Roles from other Site Administrators or Site Owners. They also *cannot* assign other Users as Site Administrators or Site Owners.

**Site Owner:** The Site Owner Role is the same as the Site Administrator Role except that it grants permission to manage *all* aspects of a Site, including permission to delete the membership of or remove Roles from Site Administrators or other Site Owners. They *can* assign other Users as Site Administrators or Site Owners.

These are some of the pre-configured Organization Roles:

**Organization User:** The Organization User Role grants basic privileges within an Organization. If the Organization has an attached Site, the Organization User Role implicitly grants the Site member Role within the attached Site.

**Organization Administrator:** The Organization Administrator Role grants permission to manage *almost* all aspects of an Organization including the Organization's Users and the Organization's Site (if it exists). Organization Administrators cannot delete the membership of or remove Roles from other Organization Administrators or Organization Owners. They also *cannot* assign other Users as Organization Administrators or Organization Owners.

**Organization Owner:** The Organization Owner Role is the same as the Organization Administrator Role except that it grants permission to manage *all* aspects of an Organization, including permission to delete the membership of or remove Roles from Organization Administrators or other Organization Owners. They *can* assign other Users as Organization Administrators or Organization Owners.

```note::
   It's easy to overlook the differences between owner type Roles and administrator type Roles for Sites and Organizations. Site and Organization administrators cannot remove the administrator or owner Role from any other administrator or owner, and they cannot appoint other Users as Site or Organization administrators or owners.

   In contrast, Site and Organization owners can do those things.
```

<!-- Preserving this for inclusion in a Creating and Managing Roles article
## Deleting Asset Containers Deletes their Assets

A Web Content Folder contains Web Content articles. The Web Content Folder is an asset container, and the Web Content Article is an asset. It's possible to give a Role permission to delete an asset container without giving the Role permission to delete individual assets. In that case, beware: if a Role assignee deletes an asset container with individual assets in it, the individual assets themselves are deleted as well.

| Asset Container | Asset |
| --------------- | ------- |

Besides Web Content Folders, examples of asset containers include Bookmarks Folders, Message Boards Categories, Wiki Nodes, and Documents and Media Folders.
-->

## Related Topics

[Role Creation and Management](./role-creation-and-management.md) 

[Defining Role Permissions](./defining-role-permissions.md) 

[Assigning Users to Roles](./assigning-user-to-roles.md). 

