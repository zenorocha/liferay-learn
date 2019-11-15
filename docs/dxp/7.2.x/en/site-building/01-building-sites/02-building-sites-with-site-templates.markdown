# Building Sites with Site Templates

Site Templates define a preconfigured structure for a Site, which includes the pages, theme, content, layouts, Page Templates, applications and app configurations defined for each page. You can use them to create multiple Sites to keep the overall look and feel consistent between them, even if each Site that's created from a given Site Template ends up being very different. Any changes you make to the Site Template are automatically propagated to the Sites that use it (unless specified otherwise), which saves a lot of time on maintenance.

By default, three Site Templates are provided out-of-the-box:

- **Blank Site:** Creates a Site that doesn't contain any pages or content, so you can build it from scratch

- **Community Site:** Creates a preconfigured Site for building online communities. The Home page of a *community Site* provides message boards, search, a display of a poll and statistics of the activity of community members. The Site Template also contains a page for a wiki.

- **Intranet Site:** Creates a preconfigured Site for an intranet. The Home page displays the activities of the members of the Site, search, a language selector, and a list of the recent content created in the intranet. It also provides two additional pages for Documents and Media and external News obtained through public feeds.

The steps below cover these topics:

- [Creating a Site Template](#creating-a-site-template)
- [Configuring a Site Template](#configuring-a-site-template)
- [Creating a new Site from a Site Template](#creating-a-site-from-a-site-template)

## Creating a Site Template

Follow these steps to create a Site Template:

1.  Open the Product Menu and go to the Control Panel and click *Sites* &rarr; *Site Templates*. 

2.  Click the *Add* icon (![Add Site Template](../../../images/icon-add.png)) and enter a name for your template.

3.  Leave the *Active* option enabled. The *Active* option must be enabled for your template to be usable. If your template is still a work in progress, toggle it to NO to ensure that no one uses it until it's ready. You can also categorize your Site Template using tags and categories by selecting the *Categorization* menu from the bottom of the page. To learn more about using tags and categories in Liferay Portal, see the [Organizing Content with Tags and Categories](TODO) section. 

4.  Optionally enable the *Allow Site administrators to modify pages associated with this Site template...* option. This gives Site Administrators permission to modify or remove the pages and apps that the template introduces to their Sites---if you want the templates to be completely static, you should disable this. 

5.  Click *Save* to create your Site Template.

![Figure 1: Site templates have several configurable options including the option to allow Site administrators to modify pages associated with the Site template.](./images/site-template-settings.png)

>**Note:** If you need to modify this configuration later, select *Manage* from the Site Template's Actions Menu, and then select *Site Template Settings* under Site Template Menu &rarr; *Configuration* in the Product Menu.

## Configuring a Site Template

After you've created your Site Template, you must edit it to include the layouts, pages, apps, etc. that you want. Follow these steps:

1.  Open the Product Menu and go to *Control Panel* &rarr; *Sites* &rarr; *Site Templates*.

2.  Click the *Options* icon (![Options](../../../images/icon-options.png)) next to the Site Template and select *Manage*.
 
    By default, the Manage Interface opens *Site Builder* &rarr; *Pages* for the Site Template. You already have a home page. The Site Template is active in the Product Menu. Any assets created within your Site Template's Product Menu can only be accessed by Sites using the Site Template.

3.  Add any pages you want for your Site Template. See the [Creating Pages](TODO) section for more information on creating pages. 

4.  Open the Product Menu and select *Go to Site* under the Site Template Menu to go to the pages you just created.

5.  Configure each page with the layout, applications, app configurations, content, etc. that you want. The changes you make to your Site Template are automatically saved in real time.

![Figure 2: You can see the name of the Site template you're currently editing.](./images/editing-site-template.png)

## Creating a Site from a Site Template

Once your Site Template is created and configured, you can use it to create Sites. Follow these steps:

1.  Open the Product Menu and go to *Control Panel* &rarr; *Sites* &rarr; *Sites*.

2.  Click the *Add* icon (![Add Site](../../../images/icon-add.png)) and select your Site Template from the menu.
 
3.  Enter a name for the Site.

4.  Check the *Create default pages as private (available only to members). If unchecked, they will be public (available to anyone)* option if the Site is intended for internal use only, such as a private intranet.

5.  Click *Save*.

6.  Configure your [Site settings](TODO).

7.  Open the *Pages* panel below the form. Note the *Enable propagation of changes from the Site template* selector is enabled by default. This means that the Site receives updates if the Site Template is modified. If changes are made to a Site created from a Site Template, this link is broken and updates to the Site Template are **no longer propagated**. See [Merging Site Template Changes](https://github.com/liferay/liferay-learn/tree/master/docs/dxp/7.2.x/en/site-building/01-building-sites/03-merging-site-template-changes.markdown) for more information.

8.  Click *Save* to create your Site. 

9.  Open the Product Menu and go to *Sites* &rarr; *Sites* under the Control Panel. 

10.  Click *Actions* and select *Go to Public Pages* or *Go to Private Pages* next to your new Site to view it. 

## Additional Information

As long as a Site is linked to the Site Template it was created from, changes to the Site Template's pages, apps, and app configurations are copied (propagated) to the Site. Changes to a Site Template's content, however, are not propagated to existing Sites that are linked to the Site Template; this is also true for pages containing fragments (e.g., [Content Pages](TODO)). 

>**Tip:** If you want to publish a piece of web content to many Sites and ensure modifications are applied to all, don't use Site Template content for that purpose. Instead, place the content in the global scope and then reference it from a *Web Content Display* application in each Site.

When a Site's Page Set is created from a Site Template and the propagation
of changes from the Site Template is enabled (default), these rules apply to pages:

- Only Site Template Administrators can remove, reorder, or add Site Template pages.

- Site Template Administrators can't add, remove, or reorder custom Site pages.

- Site Administrators can add or remove custom Site pages. They can also reorder custom Site pages as long as they're all positioned after the Site Template pages.

-  If a Site has both pages imported from a Site template and custom Site pages, the Site Template pages appear first in the Site page hierarchy; custom pages added by Site Administrators appear after the Site Template pages. 