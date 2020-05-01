# Creating and Managing Roles

## Creating Roles

Determine the scope of the Role you must create. Roles can be scoped globally (Regular Roles), to a specific Site (Site Roles), or to an Organization (Organization Roles). 

To create a Role:

1. Click the tab for the proper Role scope, then click the *Add* (![Add](../../../images/icon-add.png)) button. 

1. Enter a title and description. The title field is required but the description is optional. 

1. Enter a Key, if desired. This required field provides a key that can be used to refer to the Role programmatically. It's auto-populated with the title text, but you can override it if desired.

1. Click *Save*.

Now the Role is present in the database and ready for further configuration.

## Updating Roles

## Deleting Roles

## Deleting Asset Containers Deletes their Assets

A Web Content Folder contains Web Content articles. The Web Content Folder is an asset container, and the Web Content Article is an asset. It's possible to give a Role permission to delete an asset container without giving the Role permission to delete individual assets. In that case, beware: if a Role assignee deletes an asset container with individual assets in it, the individual assets themselves are deleted as well.

| Asset Container | Asset |
| --------------- | ------- |

Besides Web Content Folders, examples of asset containers include Bookmarks Folders, Message Boards Categories, Wiki Nodes, and Documents and Media Folders.
