# Scoping Your Message Boards

 Forum administrators can create multiple message boards on the same DXP instance. To scope your message boards for different audiences, administrators can create Message Boards in the [Global, Site, or Page Scopes](https://help.liferay.com/hc/articles/360028819992-Widget-Scope). The following sections show administrators how to setup _Message Boards_ in each of these scopes.

## Global

Content created at the global site scope level is available on all other sites but are not _automatically_ visible on every site page.

### Creating a Globally Scoped Message Board

To create a message board in the global scope, follow these steps:

1. Open the _Product Menu_ (![Product Menu](../../../images/icon-product-menu.png)), then click the compass icon (![Compass](../../../images/icon-compass.png)) on the Site Administration menu. This opens the Select Site dialog.
1. Select the _My Sites_ tab, then select _Global_.

    ![Figure 1: Select the Global site from the site selector.](./scoping-your-message-boards/images/01.png)

1. Select _Message Boards_ from the _Content & Data_ menu. Any changes made here apply to the global scope.

    ![Figure 2: After changing to the global scope, select Message Boards from the Content & Data menu in Site Administration.](./scoping-your-message-boards/images/02.png)

1. Click _Add_ then _Thread_.
1. Enter the following:

    * **Subject**: Global Thread
    * **Body**: (The global thread message)

1. Click _Publish_.

A message thread has been created. To view to all threads created in the _Global_ scope, configure the _Message Boards_ widget's scope accordingly.

1. Navigate to the site page where a _Message Boards_ widget has been deployed (for example, _Liferay DXP_'s _Forum_).
1. Click _Options_ (![widget options](../../../images/icon-widget-options.png)) &rarr; _Configuration_.
1. Click _Scope_.
1. Select **Global** from the _Scope_ dropdown menu.

    ![Figure 3. Selecting the Global scope](./scoping-your-message-boards/images/07.png)

1. Click _Save_ and close the window.

The _Message Boards_ widget now displays threads from only the _Global_ scope.

![Figure 4. Viewing globally scoped content on another site](./scoping-your-message-boards/images/08.png)

## Site

By default, the _Message Boards_ app in _Site Administration_ is scoped to the current Site. Message Boards scoped to a particular site are not visible when viewing Messages Boards that may be deployed on another site in the same instance.

## Page

 Creating page-scoped message boards allows forum members to view different message boards on different pages housed on the same site. The example below have the same content on both site pages (_Forum 1_ and _Forum 2_.)

![Figure 5: Viewing site-scoped content](./scoping-your-message-boards/images/03.png)

### Creating a Page Scoped Message Board

To create a page-scoped message board, follow these steps:

1. Navigate to the page that which will be scoped (_Forum 2_).
1. Click the _Options_ icon (![Options](../../../images/icon-widget-options.png)) in the widget's title bar and select _Configuration_.
1. Click the _Scope_ tab.
1. Select the page's name or _PageName (Create New)_ if the page scope doesn't exist yet.

   ![Figure 6. Page-scoped content](./scoping-your-message-boards/images/04.png)

1. Click _Save_ then close the dialog window.

    ![Figure 7. Viewing page-scoped content](./scoping-your-message-boards/images/05.png)

The _Message Boards Categories_ and _Threads_ added on the _Forum 2_ page will be displayed only on that page.

### Managing Page Scoped Message Board

Note that administrators must still use the _Site Administration_ menu to administer a page-scoped Message Boards widget by setting the _Site Administration_ menu's active scope. Follow these steps to do this:

1. Open the _Product Menu_ (![Product Menu](../../../images/icon-product-menu.png)), expand the menu for your Site, then expand _Content & Data_.

1. The current scope appears just below the _Content & Data_ heading. _Default Scope_ is the current Site. To change this, click the gear icon (![Gear](../../../images/icon-control-menu-gear.png)) and then select your desired scope. This changes the Site Administration menu to reflect scope you selected. To work in a page's scope, for example, select that page from the gear icon. That page's name then becomes the _Site Administration_ menu's title.

    ![Figure 8: Select the page's scope under the Content & Data menu in Site Administration.](./scoping-your-message-boards/images/06.png)

1. Select *Message Boards* from the _Content & Data_ menu. Any changes you make here apply to the scope that you selected in the previous step.

## Related Information

* [Configuration Scope](https://help.liferay.com/hc/articles/360029131591-System-Settings#configuration-scope)
