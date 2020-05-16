# Overriding Product Level Information

In Liferay Commerce, SKUs inherit the parent product's specifications and [subscription](./enabling-subscriptions-for-a-product) settings. However, users can override certain product information at the SKU level.

This is useful if a product has multiple SKUs and each SKU has unique specifications or sold differently.

## Overriding Shipping Information

One use case is if a product offers a 6-pack and a 12-pack and each is assigned a different SKU. Users must enter different weights for each SKU which in turn affects shipping calculations.

To create a shipping override:

1. Navigate to the _Control Panel_ &rarr; _Commerce_ &rarr; _Products_.
1. Click on a product (for example, _Generic Coffee_).
1. Click on the _SKUs_ tab.

    ![Configure overrides on the SKUs tab](./overriding-product-level-information/images/01.png)

1. Click on the desired SKU (VANILLA24).
1. On the _Details_ tab, scroll down to the _Shipping Override_ section.
1. Enter the SKU's dimensions.

    ![Enter the dimensions](./overriding-product-level-information/images/02.png)

1. Click _Publish_ when finished.

The Shipping Override has been created for this SKU. Repeat these steps for all other SKUs.

## Overriding Subscriptions

If each SKU is sold differently where one SKU is a subscription and another is not, follow the steps below to create a Subscription Override:

1. Navigate to the _Control Panel_ &rarr; _Commerce_ &rarr; _Products_.
1. Click on a product (for example, _Generic Coffee_).
1. Click on the _SKUs_ tab.
1. Click on the desired SKU (COLD BREW6-PACK).
1. Click on the _Subscriptions_ tab.
1. Slide the _Override Subscription Settings_ toggle to _YES_.
1. Slide the _Enable Payment Subscription_ toggle to _YES_.
1. Enter the desired values for the subscription.

    ![Enter the dimensions](./overriding-product-level-information/images/03.png)

1. Slide the _Enable Delivery Subscription_ toggle to _YES_.
1. Enter the desired values for the subscription.

    ![Enter the dimensions](./overriding-product-level-information/images/04.png)

1. Click _Save_ when finished.

## Additional Information

* [Specifications](./specifications.md)
* [Adding SKUs to Your Products](./adding-skus-to-your-products.md)
