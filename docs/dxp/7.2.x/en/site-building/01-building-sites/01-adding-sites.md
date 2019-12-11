# Adding a Site

The steps below describe how to add a new Site to your Liferay Portal instance. 

1.  Open the Product Menu and navigate to the Control Panel and select *Sites* &rarr; *Sites*.

2.  Click the Add icon (![Add Site](../../../images/icon-add.png)) at the top right of the page.
     
3.  Select a Site Template. See [Site Templates](./02-building-sites-with-site-templates.markdown) for more information on creating site templates.

4.  Enter a Name for the site and optionally provide a description.

5.  Set the *Membership Type*. These membership types are available:

    - **Open:** Users can become members of the site at any time.

    - **Restricted:** Users can request site membership but site administrators must approve requests for users to become members.

    - **Private:** Users cannot join the site or request site membership. Site administrators must manually select users and assign them as site members.

6.  Configure the remaining settings and click *Save*.

![The General section provides the basic information for your site.](./images/building-sites-general-form.png)

The new site is selected when you open the Product Menu. See [Site Settings](TODO) for an overview of all of the available site settings.

## Additional Information

When creating a blank Site or organization Site, the site is not immediately viewable. This is because sites without a page are impossible to view. Therefore, before you can view your site, you must first create a page for it. To add a page for your temporarily invisible site, follow these steps:

1.  Open the Product Menu and expand the site menu.

2.  Navigate to *site Builder* &rarr; *Pages*.

3.  Add a public page. 

After adding your site's first page, it renders and your site is viewable. For more information about adding pages, see the [Creating Pages](TODO) section.