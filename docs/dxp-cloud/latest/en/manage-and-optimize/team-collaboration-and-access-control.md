# Team Collaboration & Access Control

Administrators can manage team members and their roles in a DXP Cloud project. 
Each environment can have unique members, and each member can have a role that 
matches their access level in that environment. It's also possible for a team 
member to have different roles in different environments. 

Here, you'll learn these topics: 

- [Managing Team Members](#managing-team-members)
- [Understanding Team Roles](#understanding-team-roles)

## Managing Team Members

Follow these steps to invite a user to your environment: 

1. Click the *Team* tab in the left menu of your environment. 
1. Enter the user's email in the *Email* field. 
1. Use the *Role* menu to select the role to assign to the user. These roles 
    set the user's access level in the environment. For more information, see 
    [Understanding Team Roles](#understanding-team-roles). 
1. Click *Send Invite*. 

Current and invited team members appear in the *Members* table, in separate 
tabs. You can manage team members via the *Actions* button for each, which lets 
you change the team member's role or remove the member from the team. 

![Figure 1: The Team tab shows your team members and lets you invite new ones.](./team-collaboration-and-access-control/images/01.png)

![Figure 2: Use the Actions button to manage each team member.](./team-collaboration-and-access-control/images/02.png)

## Understanding Team Roles

**Admin:** Has full control over the DXP Cloud project and its members. They 
have exclusive permissions to: 

- Enable/disable auto scaling
- Manually downscale a service
- Restore from a backup
- Change user roles
- Invite members to the project
- Remove members from the project
- Enable/disable support access
- Delete a service

**Contributor:** Can handle application management and most of the development 
life cycle, but can't manage team members or perform other Admin-exclusive 
actions. Contributors have permission to: 

- Start a backup
- Change VPN settings
- Restart a service
- Deploy a build
- Remove themselves from the project

**Guest:** Has view-only access. Guests can see what is happening in the 
project, but can't perform actions or make any changes. They only have 
permission to remove themselves from the project. 
