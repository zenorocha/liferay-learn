# Manually Creating a Search Page

You can manually configure the search page for your Site if you choose not to base it on a template. This approach is preferable if you do not want to share common elements of your Site's search page with search pages on other Sites.

These steps show you how to switch to a manually configured search experience in the default site, but you can skip the step on deleting the default search page if you're starting with a new site:

1. Delete the default search page by navigating to the default site's menu and clicking *Site Builder* &rarr; *Pages*. Click the Search page's Actions menu icon (![Actions](../../../images/icon-actions.png)) and select *Delete*. Confirm you want to delete the page, and it's gone.

    Once deleted, the search bar disappears from your site pages, replaced by a warning message visible only to site administrators:

    ![A search page must be configured for the Search Bar widget.](./manually-creating-a-search-page/images/01.png)

1. Create a new page named whatever you want (_Finders Keepers_, perhaps). Make it hidden or add it to the navigation as you please (the default search page is hidden from the navigation).

    If you want a pre-configured search page, create it from the Search page template. Find the template in the Add Site Page form. It's under *Global Templates*.

    ![Use the Search page template to jump-start its creation.](./manually-creating-a-search-page/images/02.png)

1. If you're creating a page not backed by the template, add and configure all the widgets you need. You'll find all the available search widgets in the Add Widget menu's Search section. Lay them out however you want on the page.

1. Configure the search bar at the top of the page, making sure it points to your new search page's friendly URL (for example, `/finders-keepers`). 

    Click the Search Bar widget's Options menu (![Options](../../../images/icon-widget-options.png)).

    Click *Configuration* and set the Destination Page to the search page's friendly URL.

    Click *Save*.

Now your search page is up and running.
