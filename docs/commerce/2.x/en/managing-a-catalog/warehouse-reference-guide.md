# Warehouse Reference Guide

Warehouses represent physical locations where product inventory is managed and shipped for order fulfillment. Store administrators set inventory quantities per warehouse. Available inventory is then calculated by Liferay Commerce to determine the total available inventory for sale across warehouses.

Liferay Commerce allows multiple warehouses across geographic locations.

To manage your warehouses, navigate to the _Control Panel_ → _Commerce_ → _Settings_. Click the _Warehouses_ tab.

## Warehouse Name and Scope

![Adding a Warehouse](./warehouse-reference-guide/images/01.png)

| Field | Description |
| --- | --- |
| Name | Name of the Warehouse |
| Description | Additional Information |
| Active | Toggle to designate warehouse as active |
| Channels | List of checkboxes for all channels this warehouse serves |

## Warehouse Address Fields

![Adding the Warehouse's Address](./warehouse-reference-guide/images/02.png)

| Field | Description |
| --- | --- |
| Street 1 | Address's first line |
| Street 2 | Address's second line |
| Street 3 | Address's third line |
| Country | Dropdown menu to select a country |
| Region | Dropdown menu to select the state or province |
| Postal Code | Field to enter the postal code |
| City | City where the warehouse is located |

## Warehouse Geolocation Fields

![Setting the warehouse's geolocation](./warehouse-reference-guide/images/03.png)

| Field | Description |
| --- | --- |
| Latitude | Warehouse's Latitude |
| Longitude | Warehouse's Longitude |

A warehouse's geolocation is used to calculate shipping costs based on distance. See [Using the Variable Rate Shipping Method](../orders-and-fulfillment/using-the-variable-rate-shipping-method.md) for more information.

## Additional Information

* [Introduction to Shipments](../orders-and-fulfillment/introduction-to-shipments.md)
* [Adding a New Warehouse](../managing-a-catalog/adding-a-new-warehouse.md)
* [Setting Inventory by Warehouse](./setting-inventory-by-warehouse.md)
