# Configuring Product Visibility by Site Using Channels

By default in Liferay Commerce Products added to any catalog are visible globally - products are visible across all sites added to a Liferay Commerce installation. Store administrators may want to limit product visibility to particular channels based on their criteria.

For the purpose of this example, we will consider a scenario of a multi-region seller providing products from a single catalog.

![Catalog organization](./configuring-product-visibility-by-site-using-channels/images/01.png)

To learn more about the using Channels in Liferay Commerce, see: [Introduction to Channels](./introduction-to-channels.md).

## Prerequisites

1. One or more sites have been created.
1. Each site has an associated channel.
1. Products have been added to a catalog.

## Configuring Product Filter Channels

To configure a product to be available in a specific channel, follow these steps:

1. Navigate to the _Control Panel_ → _Commerce_ → _Products_.
1. Click a product (_Torque Converters_ in this example).
1. Click the _Configuration_ sub-tab.
1. Click the _Channels_ sidebar option.
1. Switch the _Enable filter channels_ toggle to _Yes_.
1. Check the boxes for each Channel (in this case, the _NA Minium Store_) where the product should be visible.

    ![Product configuration](./configuring-product-visibility-by-site-using-channels/images/02.png)

1. Click _Save_.

The product will be visible only in the selected Channels.

## Additional Information

* [Introduction to Channels](./introduction-to-channels.md)
* [Managing Channels](./managing-channels.md)
