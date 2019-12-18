# Creating a Page Template

Page Templates let you create pages based on predefined layouts and content. There are two types of Page Templates you can create:

- [Widget Page](./01-understanding-pages.md#widget-pages) Template
- [Content Page](./04-building-content-pages.md) Template

By default, the [Search](./02-adding-a-page-to-a-site.md#search), [Wiki](./02-adding-a-page-to-a-site.md#wiki), and [Blog](./02-adding-a-page-to-a-site.md#blog) global Widget Page Templates are available.

![Figure 1: The Blog Page Template is already available for use along with the Search and Wiki Page Templates.](./creating-a-page-template/images/01.png)

The steps below show how to create and use Widget and Content Page Templates.

1.  Open the Product Menu and go to *Site Builder* &rarr; *Pages*.

2.  Select the *Page Templates* tab.

3.  Click *New* and create a new collection to organize your Page Templates.

4.  Click the *Add* icon (![Add Page Template](../../../images/icon-add.png)) and select either *Widget Page Template* or *Content Page Template*. You can return to the Page Template's configuration at any time by clicking the *Actions* icon (![Actions](../../../images/icon-actions.png)) next to the Page Template in the Collection and selecting *Configure*. 

5.  Enter a Name.

6.  Click *Save*.

7.  You're automatically transported to the new Page Template. Follow the instructions in [Widget Pages](./01-understanding-pages.md#widget-pages) to create your Widget Page Template. Likewise, see [Building Content Pages](./04-building-content-pages.md) to configure your Content Page Template.

>**Note:** After a Page Template has been created, by default only the creator of the Page Template can use it. To give other users access to it, select *Permissions* from the Page Template's Actions menu and check the *View* permission for the Roles that you want to view the Page Template. If you want any user who can create a page to be able to use the Page Template, check the *View* permission for the *User* Role.

## Additional Information

### Propagating Changes

When creating a page from a Widget Page Template, changes are inherited from the Page Template by default, so future changes are propagated to the pages that use the Page Template. Site Administrators can disable this behavior through the [settings for the individual page](./06-configuring-individual-pages.md#general). 
However, this is not true for Content Pages. Changes **are not automatically propagated** for Content Pages created from Content Page Templates. You can, however, propagate changes made to the Fragments used on a Content Page. See [Propagating Fragment Changes](TODO) for more information.

>**Note:** If staging has been enabled, changes to the Widget Page Template are automatically propagated to the staged page. These changes must still be approved before the page is published to the live site. For this reason, the automatic propagation of Widget Page Template changes to the staged page cannot be turned off and the *Inherit Changes* selector does not appear. You can read more about staging in the [Staging](TODO) section.

>**Note:** You can share your Page Templates with other sites using the same process as you would for pages. Follow the instructions in [Importing and Exporting Pages and Content](../01-building-sites/09-importing-exporting-pages-and-content.md) to learn how.