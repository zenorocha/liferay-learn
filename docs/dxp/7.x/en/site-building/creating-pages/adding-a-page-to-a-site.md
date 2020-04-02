# Adding a Page to a Site

The steps below describe how to add a new page to your Site and configure the general options. To learn how to configure the remaining page settings, see [Configuring Individual Pages](./06-configuring-individual-pages.md), or see [Configuring Page Sets](./05-configuring-page-sets.md) to configure options for a [Page Set](./understanding-pages.md#page-sets).

## Adding a New Page

Follow these steps to add a page:

1. Navigate to your desired Site by using the [Site Menu](../../getting-started/navigating-dxp.md#site-menu).

1. Go to *Site Builder* &rarr; *Pages* under the Site Menu.

1. On the Pages page, click the *Add* button (![Add](../../images/icon-add.png)) to create a top-level page.

    ![The Pages screen lets you edit your Site pages as a whole.](./adding-a-page-to-a-site/images/01.png)

    ```tip::
       Alternatively, since Liferay DXP 7.3, you can click the page tree icon next to the Site name to open the Page Tree Menu. You can use the Page Tree Menu to quickly find a page by keyword in the search bar, navigate to a page by selecting it, or even add pages through the Actions Menu.
    ```

1. Click the *Blank* [Master Page Template](./master-page-templates/master-pages.md) to start a content page from scratch, select a [custom Master Page Template](./master-page-templates/creating-a-master-page-template.md) to create a [Content Page](./understanding-pages.md#page-types), or select [another page type](./other-page-types.md) under the *Other* heading or a Page Template listed under the *Global Template* menu.

    ![You must select a page type when adding pages.](./adding-a-page-to-a-site/images/04.png)

1. Enter a Name and configure the remaining settings for the page.

1. Click *Save* to create the page.

    ```tip::
       Creating a page by default also adds it to any Navigation Menus that are configured to have new pages added to them. Learn more about `Configuring Site Navigation <../04-site-navigation/README.md>`_.
    ```

## Adding a Child Page

To add a child page through the Page Tree Menu, follow these steps:

1. Open the Product Menu and click the (![icon-page-tree](../../images/icon-page-tree.png)) icon next to the Site name to open the Page Tree Menu.
1. Select *Add Child Page* from the Actions Menu next to an existing page to create a nested child page for it.

    ![Adding a Child Page using the Page Tree menu.](adding-a-page-to-a-site/images/05.png)

1. Follow the standard steps for creating a page, as outlined above.

To add a child page through the Pages screen, follow these steps:

1. Open the Product Menu and go to *Site Builder* &rarr; *Pages* under your Site's menu.
1. Click the *Add* button (![Add](../../images/icon-add-app.png)) next to an existing page. You can also click the *Add* button (![Add](../../images/icon-add.png)) in the top right of the Pages page to create a top-level page.
1. Follow the standard steps for creating a page, as outlined above.

## Additional Information

* [Understanding Pages](./understanding-pages.md)
* [Content Page Overview](./content-pages-overview.md)
