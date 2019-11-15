# Introduction to Managing Inventory

Liferay Commerce provides the tools to manage product inventory for merchants with a single store, to organizations with multiple warehouses and stores. Store administrators can use these features to maintain quantities for sales and handle shipments to complete orders.

There are several key features used in managing inventory: Warehouses, Availability Estimates, Low Stock Activity, and the ability to set inventory by warehouse.

## Warehouses

Warehouses represent the physical locations where product inventory is managed and sourced for order fulfillment.

See the [Warehouse Reference Guide](./warehouse-reference-guide.md) and the [Adding a New Warehouse](../catalog/adding-a-new-warehouse.md) article for more information about how to manage warehouses.

Warehouses must be associated for at least one channel. See the [Introduction to Channels](../catalog/introduction-to-channels.md) article on how channels work.

## Availability Estimates

Store owners may configure Availability Estimates to inform customers when an out of stock product will be available again.

See the [Availability Estimates](../catalog/availability-estimates.md) for more information.

## Low Stock Activity

Low Stock Activities can be configured to perform automated actions when available product inventory reaches a specified threshold. See the [Low Stock Activity](./low-stock-activity.md) to learn how to configure what behavior is executed when inventory reaches a minimum threshold.

Developers interested in creating their own custom low stock activity can refer to [Implementing a Custom Low Stock Activity](../../developer-guide/tutorial/implementing-a-custom-low-stock-activity.md).

## Setting Inventory by Warehouse

In Liferay Commerce, inventory management is done per product SKU. To learn more, read the [Setting Inventory by Warehouse](./setting-inventory-by-warehouse.md) article.

## Additional Information

* Shipping - Creating a New Shipment (TODO)
* [Product Inventory Configuration Reference](./product-inventory-configuration-reference.md)
