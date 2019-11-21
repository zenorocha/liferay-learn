# Managing Product Publication

Liferay Commerce offers two different ways for store managers to manage the publication status of their products by either **expiring** or **unpublishing** a product.

When a product is **expired**, there is a set expiration date in the future so that a product is no longer available for sale after that date. The product is placed in an _Expired_ status and is not visible in search results for the store. A store manager can configure the expiration process for the entire product (all SKUs) or for just one particular SKU.

**Unpublishing** a product sets the product to a _Draft_ status and removes the product from search results. Unpublishing a product can be configured to happen automatically if the product's inventory falls below a minimum threshold; for more information, see the article on [Low Stock Activity](./low-stock-activity.md).

## Scheduling Product's Expiration

Scheduling product expiration is accomplished through the _Control Panel_. To schedule product expiration:

1. Navigate to _Control Panel_ → _Commerce_ → _Products_.
1. Click on a product (for example, _U-Joint_).
1. Uncheck the _Never Expire_ checkbox on the _Products Details_ tab. In this example, this configuration will affect all SKUs.
1. Enter an expiration date and time in the future. All times are set using the GMT time zone.

    ![Setting a Product's Expiration Date](./managing-product-publication/images/03.png)

1. Click _Publish_.

Once the changes are made, it may take some time for the product to be removed from the _Catalog_ page because of the check interval. By default, the check interval is set to 15 minutes. After the expiration date, the product will be not returned when searching on the _Catalog_ page. In the _Control Panel_, the product status is shown as _Expired_.

![Expired Status](./managing-product-publication/images/04.png)

The product can be made visible again by entering a new expiration date and republishing the product.

## Unpublishing a Product

1. Navigate to _Control Panel_ → _Commerce_ → _Products_.
1. Click on a product (for example, _U-Joint_).
    > Expand the _Schedule_ section if necessary.
1. Uncheck the _Published_ checkbox.

    ![Unchecked Published box](./managing-product-publication/images/01.png)

1. Click _Save as Draft_.
1. Navigate to the store site.
1. Search for the product (_U-Joint_ in this example).

![Unpublished U-Joint](./managing-product-publication/images/02.png)

The product is not searchable in the catalog. In the _Control Panel_, the product's status is set to _Draft_.

![Unpublished U-Joint](./managing-product-publication/images/05.png)

## Additional Information

* [Introduction to Product Types](./introduction-to-product-types.md)
* [Configuring Product Visibility by Site Using Channels](./configuring-product-visibility-by-site-using-channels.md)
* [Creating a Simple Product](./creating-a-simple-product.md)
* [Creating a Grouped Product](./creating-a-grouped-product.md)
* [Creating a Virtual Product](./creating-a-virtual-product.md)
* [Low Stock Activity](./low-stock-activity.md)
