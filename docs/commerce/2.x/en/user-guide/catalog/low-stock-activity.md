# Low Stock Activity

This article documents how to set up automated actions for when product inventory falls below a specified threshold. Out-of-the-box, Liferay Commerce allows users to automatically set products as unpublished when they reach the defined inventory threshold. Store owners may also  configure the catalog to display remaining product quantity in inventory.

To configure a Low Stock Activity:

1. Navigate to the _Control Panel_ → _Commerce_ → _Products_.
1. Click on a product (for example, _U-Joint_)
1. Click the _Configurations_ sub-tab.
1. Enter the following:
    * **Inventory Engine**: Default
    * **Availability Estimate**: 5-7 Days
    * **Display Availability**: YES
    * **Display Stock Quantity**: YES
    * **Low Stock Threshold**: 5
    * **Low Stock Action**: Set as Unpublished
    * **Allow Back Orders**: Yes
    * **Minimum Order Quantity**: 1
    * **Maximum Order Quantity**: 5
    * **Allowed Order Quantities**: 1
    * **Multiple Order Quantity**: 1

    ![Product Configuration for Low Stock Activity](./low-stock-activity/images/01.png "Product Configuration for Low Stock Activity")

1. Click _Save_.

The Low Stock Activity for this product has been configured. In the future, should the number of stock fall below _5_, the "U-Joint" product will be unpublished.

## Additional Information

* [Product Inventory Configuration Reference](./product-inventory-configuration-reference.md)
* [Implementing a Custom Low Stock Activity](../../developer-guide/tutorial/implementing-a-custom-low-stock-activity.md)
