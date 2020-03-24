# Product Images

Product images help to ensure that customers know what they are buying and increase the likelihood of a sale. Store administrators can upload images for each product variant (different SKUs).

This article documents how to add images to a product.

## Adding a Single Product Image

To add a single image:

1. Navigate to _Control Panel_ → _Commerce_ → _Products_.
1. Click on a product (in this example, _Brake Rotors_).
1. Click the _Media_ sub-tab.

    ![Adding a product image](./product-images/images/08.png)

1. Click the (+) button to add a product image.
1. Drag and drop an image or click _Select File_ to upload an image.
1. Enter a title: _Brake Rotor_.

    ![Adding a product image](./product-images/images/06.png)

1. Click _Publish_.

The new product image has been added to the product. Note that under _Options_, the message "`There are no options set as the SKU contributor.`" may appear. If this message appears, then the product does not have additional associated SKUs and the image added is the only one associated with the product. See the section below on how to associate multiple product images to product variants.

To view the image in the catalog, go to the store site and then search for the product (_Microfiber Cloth_).

![Viewing product](./product-images/images/02.png)

## Adding Multiple Product Images

Multiple product images can be associated with a single product. In order to add multiple images to a product, first review the following:

* [Product Options](./customizing-your-product-with-product-options.md) have been created for this product.
* [Multiple SKUs](./adding-skus-to-your-products.md) have been generated for this product.

Once you have created Product Options and generated the corresponding SKUs, you can then associate different product images. To add multiple images to the different SKUs:

1. Navigate to _Control Panel_ → _Commerce_ → _Products_.
1. Click on a product, in this example, _Hoses_.

    ```note::
       If you had used Minium to create your store and sample data, this product was added by the Minium accelerator.
    ```

1. Click the _Media_ sub-tab.

    ![Hoses Media tab](./product-images/images/09.png)

1. Click the (+) button to add a product image.
1. Drag and drop an image or click _Select File_ to insert an image.
1. Click on the existing image.
1. Select _6_ under the _Package Quantity_ drop down.

    ![Adding an image](./product-images/images/07.png)

1. Click _Publish_.

The product image has been updated with the respective Product Option. Repeat these steps as desired for all other available SKUs, such as another package quantity. In this example, different images may be used for the different package quantities. When searching for a product, you can see that all images have been included inside the Product Detail widget.

![Images in Product Detail widget](./product-images/images/05.png)

## Adding Images for Products on Commerce 2.0 and Below

### Single Images

1. Navigate to _Control Panel_ → _Commerce_ → _Products_.
1. Click on a product (in this example, _Microfiber Cloth_).
1. Click the _Images_ sub-tab.
1. Click the (+) button to add a product image.
1. Drag and drop an image or click _Select File_ to upload an image.
1. Enter a title: _Microfiber Cloth_.
1. Set a priority: _1.0_.

    ![Adding a product image](./product-images/images/01.png)

1. Click _Publish_.

### Multiple Images

1. Navigate to _Control Panel_ → _Commerce_ → _Products_.
1. Click on a product, in this example, _Hoses_.
1. Click the _Images_ sub-tab.
1. Click the (+) button to add a product image.
1. Drag and drop an image or click _Select File_ to insert an image.
1. Click on the existing image.
1. Select _6_ under the _Package Quantity_ drop down.

    ![Adding an image](./product-images/images/04.png)

1. Click _Publish_.

## Additional Information

To configure a default placeholder image for products that do not have an image uploaded, see Setting a Default Catalog Image.
