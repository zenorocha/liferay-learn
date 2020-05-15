# Introduction to Managing Inventory

Liferay Commerce provides tools for product inventory management that scale from users with a single storefront and warehouse to larger organizations with multiple sales channels and geographically distributed warehouses.

There are several key features used in managing inventory: Warehouses, Availability Estimates, Low Stock Actions, and the ability to set inventory by warehouse.

## Warehouses

Warehouses represent the physical locations where product inventory is managed and sourced for order fulfillment. Products inventory quantities are managed on a per warehouse basis.

See the [Warehouse Reference Guide](./warehouse-reference-guide.md) and the [Adding a New Warehouse](./adding-a-new-warehouse.md) article for more information about how to manage warehouses.

In order for a store to accept orders for a product, the related channel must have a warehouse associated with it. See the [Introduction to Channels](../creating-and-managing-products/channels/introduction-to-channels.md) article on how channels work.

## Availability Estimates

Store owners may configure Availability Estimates to inform customers when an out of stock product will be available again.

See the [Availability Estimates](./availability-estimates.md) for more information.

## Low Stock Actions

Low Stock Actions can be configured to perform automated actions when available product inventory reaches a specified threshold. See the [Low Stock Action](./low-stock-action.md) to learn how to configure what behavior is executed when inventory reaches a minimum threshold.

Developers interested in creating their own custom low stock action can refer to [Implementing a Custom Low Stock Activity](../../developer-guide/tutorials/implementing-a-custom-low-stock-activity.md).

## Setting Inventory by Warehouse

In Liferay Commerce, inventory management is done per product SKU. To learn more, read the [Setting Inventory by Warehouse](./setting-inventory-by-warehouse.md) article.

## Additional Information

* [Creating a New Shipment](../../orders-and-fulfillment/shipments/creating-a-shipment.md)
* [Inventory Administration Reference Guide](./inventory-administration-reference-guide.md)
* [Product Inventory Configuration Reference](./product-inventory-configuration-reference.md)
* [Order Life Cycle](../../orders-and-fulfillment/orders/order-life-cycle.md)
