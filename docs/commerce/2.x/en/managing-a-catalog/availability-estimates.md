# Availability Estimates

This article documents how to configure Availability Estimates. If a product becomes unavailable, store owners can provide customers with an estimate for when a product will be restocked.

Note that the default list of Availability Estimates is not populated at first (whether using the Liferay Commerce bundle or deploying the `LPKG` to an existing installation ). They can be created with an initializer such as the [Minium (B2B) Accelerator](../getting-started/using-the-minium-accelerator-to-jump-start-your-b2b-store.md) or the Speedwell Accelerator (B2C) store.

![Availability Estimates are created with an initializer](./availability-estimates/images/04.png)

If using an accelerator, the following three Availability Estimates are available as sample data.

![Managing Availability Estimates](./availability-estimates/images/01.png)

To manage Availability Estimates:

1. Navigate to the _Control Panel_ → _Commerce_ → _Settings_.
1. Click the _Availability Estimates_ tab.
1. Click the (+) button to add a new estimate.
1. Enter the following:
    * Title: 15-21 days
    * Priority: 4.0
1. Click _Save_.

The new Availability Estimate has been added. Note that because the priority is set to _4.0_, this means this time period is displayed last in the menu.

![New Availability Estimate](./availability-estimates/images/02.png)

When configuring the low stock threshold, this Availability Estimate option is displayed in the _Product Configuration_ → _Inventory_ menu.

![Availability Estimates in Inventory Dropdown](./availability-estimates/images/03.png)

## Additional Information

* [Introduction to Managing Inventory](./introduction-to-managing-inventory.md)
* [Product Inventory Configuration Reference](./product-inventory-configuration-reference.md)
