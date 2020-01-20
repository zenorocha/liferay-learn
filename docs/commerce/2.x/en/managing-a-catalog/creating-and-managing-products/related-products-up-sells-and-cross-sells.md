# Related Products, Up-Sells, and Cross-Sells

Product relations can be used to connect products. Once connected, a product displays the links to other products. Every related product must be assigned to a Product Relation Type. These products can then be displayed by a Product Publisher widget configured to source data from the appropriate type.

When more than one Product Publisher widget is placed on a product detail page, multiple sets of related products may be shown. For instance, one widget might display a set of products that are alternatives to the product featured on the page, while another might display products that are accessories to the featured product.

Note: If your site was built using an accelerator, then a number of product relation types are already in place. Here is a list of default Product Relations:

* **Up-Sell**: Display products that are comparable to the featured product but have a higher sale value.
* **Spare**: Display products that are spare parts or components for the featured product.
* **Related**: A catch-all set.
* **Accessories**: Display add-on products for use in conjunction with the featured products.
* **Cross-Sell**: Display products complementary to the featured product.

![Product Relations: Brake Rotors and Fluid](./related-products-up-sells-and-cross-sells/images/05.png)

In the image above, the two related products are displayed in the Product Publisher widget at the bottom. You have the option to add more Product Publisher widgets configured with other types of Product Relations.

## Adding a New Product Relation Type

More Product Relation types may be added as necessary. This includes intangibles such as warranties. To add a new Product Relation:

1. Navigate to the _Control Panel_ → _Configuration_ → _System Settings_.
1. Click _Catalog_ in the _Commerce_ section.
1. Click _Product Relations_ on the left menu.
1. Click the _Add_ button.
1. Enter the new Product Relation in the _Type_ field: Warranties.
1. Click _Save_.

    ![Creating a New Product Relation](./related-products-up-sells-and-cross-sells/images/01.png)

The new Product Relation Type has been added.

## Creating Relationships Between Products

1. Navigate to the _Control Panel_ → _Commerce_ → _Products_.
1. Select any product; for example, _Brake Pads_.
1. Click on the _Product Relations_ sub-tab.
1. Click on _Related_ in the left menu.

    ![Related Menu](./related-products-up-sells-and-cross-sells/images/02.png)

1. Click the (+) button to add one or more relationships. In this example, select _Brake Rotors_ and _Brake Fluid_.
1. Click _Add_.

    ![Adding Two Products](./related-products-up-sells-and-cross-sells/images/04.png)

These two products are now associated with _Brake Pads_. Note that this relationship is unidirectional; in other words, when viewing _Brake Pads_ the new product relations will be visible but when viewing the _Brake Rotors_ or _Brake Fluid_ products, _Brake Pads_ will _not_ be listed as as a related product.

Once the product relationships have been created, configure the Product Publisher widget to display the relations.

## Displaying Product Relations

You can display product relations on a product display page by configuring a Product Publisher widget. You must have a [product display page](https://help.liferay.com/hc/en-us/articles/360017870292-Displaying-Product-Pages-) in place first.

1. Search for a product (for example _Brake Pads_).
1. Click _Brake Pads_ to view the Product Details.
1. Scroll to the bottom of the page to view the related products listed in the _Product Publisher_ widget.

   ![Configuration Menu](./related-products-up-sells-and-cross-sells/images/06.png)

1. Click the _3-dot_ icon (Options) → _Configuration_.
1. Select _Product Relations related_ from the _Data Source_ dropdown menu.

    ![Choosing a Data Source](./related-products-up-sells-and-cross-sells/images/03.png)

1. Click _Save_ and close the dialog box.

    ![Product Relations: Brake Rotors and Fluid](./related-products-up-sells-and-cross-sells/images/05.png)

The example above shows how different products could be related, ensuring that customers can see the full range of products that may also be potentially useful.
