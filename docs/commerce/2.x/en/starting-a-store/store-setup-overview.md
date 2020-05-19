# Store Setup Overview

## Introduction

This article is intended to provide a walk through for users who are new to building a store in Liferay Commerce. It assumes that Liferay Commerce (and Liferay DXP) have been appropriately installed and configured. For more information on installation, see the [Installation Overview](../../installation-and-upgrades/installation-overview.md).

## Road Map

* [Store Setup](#store-setup)
* [Creating the Storefront](#creating-the-storefront)
* [Managing Customer Accounts](#managing-customer-accounts)
* [Managing Orders and Shipments](#managing-orders-and-shipments)

## Store Setup

```note::
   An `Accelerator <../starting-a-store/accelerators.md>`_ may be used to create the store site. Using an Accelerator to create the store site will configure many of the settings mentioned in this section, see `Using the Minium Accelerator to Jump Start Your B2B Store <../starting-a-store/using-the-minium-accelerator-to-jump-start-your-b2b-store.md>`_ for further details.
```

Initial store setup is done with the [Admin account](./introduction-to-the-admin-account.md). Read the [Liferay Commerce Configuration Overview](../store-administration/liferay-commerce-configuration-overview.md) to become more familiar with the Liferay Commerce configuration layout and available options.

### Configure Global Commerce Settings

Global configurations for Liferay Commerce include setting the store timezone, available languages, adding regions and region specific measurement units, and more. Learn more from the following articles:

* [Setting Locale Options](../store-administration/locale-options.md)
* [Adding Regions](../store-administration/adding-regions.md)
* [Setting up Warehouses](../managing-a-catalog/managing-inventory/warehouse-reference-guide.md)
* [Creating Channels](../managing-a-catalog/creating-and-managing-products/channels/introduction-to-channels.md)

### Create a Store Site

Liferay Commerce supports B2B, B2C, and B2C-B2B stores. [Site Types](../starting-a-store/sites-and-site-types.md) designate a store's business model and will determine how the storefront works with Accounts.

Liferay Commerce is built on Liferay DXP; For more information about how Liferay DXP Sites work, see [Building a Site](https://learn.liferay.com/dxp-7.x/site-building/building-sites/adding-a-site.html).

### Configure Store Site Commerce Settings

The following sections cover configurations that are store site specific.

#### Accepting Payment

Liferay Commerce provides support for several third party payment processors and also allows for the use of money orders to accept payment. See:

* [Payments](../store-administration/configuring-payment-methods/payments.md)
* [Managing Payment Methods](../store-administration/configuring-payment-methods/managing-payment-methods.md)
* [Authorize.net](../store-administration/configuring-payment-methods/authorize.net.md)
* [PayPal](../store-administration/configuring-payment-methods/mercanet.md)
* [Mercanet](../store-administration/configuring-payment-methods/mercanet.md)
* [Money Orders](../store-administration/configuring-payment-methods/mercanet.md)

#### Collecting Applicable Taxes

In order to collect the applicable taxes, Liferay Commerce has the ability to create tax categories and to set tax rates by address or by a fixed rate.

* [Creating Tax Categories](../store-administration/configuring-taxes/creating-tax-categories.md)
* [Setting Tax Rate by Address](../store-administration/configuring-taxes/setting-tax-rate-by-address.md)
* [Setting Tax Rate by Fixed Rate](../store-administration/configuring-taxes/setting-tax-rate-by-fixed-rate.md)

#### Shipping Products

Liferay Commerce has several options to calculate shipping rates. Commerce Enterprise subscribers receive FedEx carrier integration out-of-the-box.

* [Shipping Methods](../store-administration/configuring-shipping-methods/shipping-methods.md)
* [Variable Rate](../store-administration/configuring-shipping-methods/using-the-variable-rate-shipping-method.md)
* [Flat Rate](../store-administration/configuring-shipping-methods/using-the-flat-rate-shipping-method.md)
* [Using FedEx as a Carrier](../store-administration/configuring-shipping-methods/using-the-fedex-shipping-method.md)

## Creating the Catalog

After setting up the store, begin [creating a new catalog](../managing-a-catalog/catalogs/creating-a-new-catalog.md).

### Adding Products to a Catalog

When adding a product, there are three product types: **Simple**, **Grouped**, and **Virtual**. See the [Introduction to Product Types](../managing-a-catalog/creating-and-managing-products/product-types/introduction-to-product-types.md) for more information.

#### Adding Product Information

The Liferay Commerce Catalog supports storing and managing a wide variety of product information. The following articles cover some of the available options:

* [Product Options](../managing-a-catalog/creating-and-managing-products/products/customizing-your-product-with-product-options.md)
* [Product Specifications](../managing-a-catalog/creating-and-managing-products/products/specifications.md)
* [Product Images](../managing-a-catalog/creating-and-managing-products/products/product-images.md)
* [Product Relations](../managing-a-catalog/creating-and-managing-products/products/related-products-up-sells-and-cross-sells.md)
* [Product Categorization](../managing-a-catalog/creating-and-managing-products/products/organizing-your-catalog-with-product-categories.md)
* [Availability Estimates](../managing-a-catalog/managing-inventory/availability-estimates.md)
* [Low Stock Action](../managing-a-catalog/managing-inventory/low-stock-action.md)

#### Product Pricing

There are several ways to price products and these methods are related to one another in a pricing hierarchy: base price, price list, tiered price, promo price and discount. Pricing is managed per SKU.

* [Pricing](../managing-a-catalog/managing-price/introduction-to-product-pricing-methods.md)
* [Price Lists](../managing-a-catalog/managing-price/creating-a-price-list.md)
* [Discounts](../promoting-products/introduction-to-discounts.md)

#### Managing Inventory

* [Introduction to Managing Inventory](../managing-a-catalog/managing-inventory/introduction-to-managing-inventory.md)

## Creating the Storefront

Building a store in Liferay Commerce requires more than a complete catalog. Store administrators building a storefront from scratch will need to add a series of pages to display and sell their products.

See [Creating Your Storefront](../creating-store-content/creating-your-storefront.md) to learn more.

## Managing Customer Accounts

To learn more about how accounts, inviting users accounts, account roles, and more, read the following articles:

* [Introduction to Accounts](../account-management/introduction-to-accounts.md)
* [Creating a New Account](../account-management/creating-a-new-account.md)
* [Inviting Users to an Account](../account-management/inviting-users-to-an-account.md)
* [Adding Addresses to an Account](../account-management/adding-addresses-to-an-account.md)
* [Account Roles](../account-management/account-roles.md)
* [Assigning Account Roles](../account-management/assigning-account-roles.md)
* [Creating a New Account Group](../account-management/creating-a-new-account-group.md)

## Managing Orders and Shipments

When an order has been received, the order may be transmitted to an ERP and optionally to a CRM. Once the requested goods are available for shipping, the store's inventory specialists may track the shipment. See the following articles to learn about the life cycle of an order and the shipment processes.

* [Order Life Cycle](../orders-and-fulfillment/orders/order-life-cycle.md)
* [Introduction to Shipments](../orders-and-fulfillment/shipments/introduction-to-shipments.md)
* [Creating a shipment](../orders-and-fulfillment/shipments/creating-a-shipment.md)
* [Cancelling a Shipment](../orders-and-fulfillment/shipments/cancelling-a-shipment.md)
