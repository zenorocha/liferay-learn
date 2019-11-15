# Adding a Site

The steps below describe how to add a new Site to your Liferay Portal instance. 

1.  Open the Product Menu and navigate to the Control Panel and select *Sites* &rarr; *Sites*.

2.  Click the Add icon (![Add Site](../../../images/icon-add.png)) at the top right of the page.
     
3.  Select a Site Template. See [Site Templates](https://github.com/liferay/liferay-learn/tree/master/docs/dxp/7.2.x/en/site-building/01-building-sites/02-building-sites-with-site-templates.markdown) for more information on creating Site Templates.

4.  Enter a Name for the Site and optionally provide a description.

5.  Set the *Membership Type*. These membership types are available:

    - **Open:** Users can become members of the Site at any time.

    - **Restricted:** Users can request Site membership but Site administrators must approve requests for users to become members.

    - **Private:** Users cannot join the Site or request Site membership. Site administrators must manually select users and assign them as Site members.

6.  Configure the remaining settings and click *Save*.

![The General section provides the basic information for your Site.](/images/building-sites-general-form.png)

The new Site is selected when you open the Product Menu. See [Site Settings](TODO) for an overview of all of the available Site settings.

## Additional Information

When creating a blank Site or organization Site, the Site is not immediately viewable. This is because Sites without a page are impossible to view. Therefore, before you can view your Site, you must first create a page for it. To add a page for your temporarily invisible Site, follow these steps:

1.  Open the Product Menu and expand the Site menu.

2.  Navigate to *Site Builder* &rarr; *Pages*.

3.  Add a public page. 

After adding your Site's first page, it renders and your Site is viewable. For more information about adding pages, see the [Creating Pages](TODO) section.