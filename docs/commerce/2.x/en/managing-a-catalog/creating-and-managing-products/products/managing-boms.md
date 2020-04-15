# Managing BOMs

> Subscribers

Bill of Materials (BOM) diagrams identify component parts belonging to a product. Users can create and annotate BOM diagrams in Liferay Commerce that reference other products in the store. BOM diagrams can then be displayed on a site page.

BOM diagrams are comprised of two parts: the product image and the Mapped Products.

## Adding a New BOM Diagram

To add a new BOM diagram:

1. Navigate to the _Control Panel_ &rarr; _Commerce_ &rarr; _Products_.
1. Click _BOM_.

    ![BOM Admin menu](./managing-boms/images/01.png)

1. Click Add (![Add Icon](../../../images/icon-add.png)) then _Add Definition_.
1. Click _Select File_ or drag and drop the product image.
1. Enter a name for the product (Generic Diesel Engine).
1. Click _Save_.

## Mapping Products to a BOM Diagram

1. Click the _Entries_ tab.

    ![BOM Entries tab](./managing-boms/images/02.png)

1. The _Mapped Products_ pane on the right lists all subparts. When users hover the mouse over the diagram, a plus sign appears.

    ![BOM Entries tab](./managing-boms/images/03.png)

1. Click on the part of the diagram that is associated with product (for example, _Fuel Injector 1_).

1. Enter the following:

    * **Number**: 1 (numeric ordering of the mapped product list)
    * **Product**: MIN59999 (the product name or SKU)

      ```tip::
         Text auto-complete will show suggestions as you type in the name of a product.
      ```

    ![Begin associating products in the BOM diagram.](./managing-boms/images/04.png)

1. Click _Save_.

Continue adding the rest of the products. Each entry must have a unique numeric identifier in the list of Mapped Products, even if there is more than one of the same product. In this example, there are four fuel injectors and all four have a different product mapping number.

![Continue to associating products in the BOM diagram.](./managing-boms/images/05.png)

## Displaying a BOM

The Commerce BOM widget is used to display BOM diagrams.

<!-- Needs to give steps to deploy the bom widget -->
1. Navigate to the desired store site page and add the BOM widget. The BOM widget displays all created BOMs and folders.

    ![Deploy the BOM widget on site page.](./managing-boms/images/06.png)

1. In the BOM Widget, select a BOM definition by clicking a BOM thumbnail.

    ![The Commerce BOM widget displays the diagram.](./managing-boms/images/07.png)

The BOM widget displays the diagram.

## Adding a BOM Folder

You can create folders to group and organize your store's BOMs.

To add a folder:

1. Click Add (![Add Icon](../../../images/icon-add.png)) then _Add Folder_.
1. Enter the following:
    * **Name**: Folder name (Car parts)
1. Click _Save_.

## Additional Information

* [Adding SKUs to Your Products](./adding-skus-to-your-products.md)
* [Adding Pages to a Site](https://learn.liferay.com/dxp-7.x/site-building/creating-pages/adding-pages/adding-a-page-to-a-site.html)
* [Adding a Widget to a Page](https://learn.liferay.com/dxp-7.x/site-building/creating-pages/using-widget-pages/adding-widgets-to-a-page.html)
