# Adding Discounts to the Subtotal

A discount applies a modifier to a product’s base price. It can be an absolute number or a percentage, and can be applied to a limited number of products or to the entire catalog. It can be available to all buyers, a defined Account Group, or to a more narrowly defined group of customers that meet certain qualifications. Unlike a price list, a discount always _reduces_ the base price. For more information on Pricing see [Introduction to Product Pricing Methods](../managing-a-catalog/managing-price/introduction-to-product-pricing-methods.md).

There are five different types of discounts: Categories, Products, Shipment, Subtotal, and Total. This article is a walk through on how to add discounts to the Subtotal.

## Creating a Discount to the Subtotal

To create this type of discount:

1. Go to the _Control Panel_ → _Commerce_ → _Discounts_.
1. Click the (+) button to add a new Discount.
1. Enter a name: _Spring Sale_.
1. Select a discount type from the _Target_ drop down. Select _Apply to Subtotal_.
1. Check the box for which channel this discount applies to.
1. Select which [Account Groups](../account-management/creating-a-new-account-group.md) this discount applies to. In this example, _US East Coast_.
1. Switch the _Use Percentage_ toggle to _Yes_.
1. Enter the _Maximum Discount Amount_: 20%.
1. Enter the _Level_: 1.00
1. Switch the _Active_ toggle to _YES_.

    ![New discount](./adding-discounts-to-the-subtotal/images/01.png)

1. Click _Publish_.

Your store now has an active discount with 20% off selected goods for those in the specified Account Group.

## Adding Rules to a Discount

You can create rules that limit the buyer's discount conditions. There are three types of rules:

* **Cart Total**: Cart subtotal must meet a minimum threshold to receive the discount.

* **Has all of these products**: Orders must include all specified products in order to receive the discount.

* **Has one of these products**: Orders must contain at least one product from a list of specified products to receive the discount.

These rules may be combined as needed to meet your sales and marketing goals.

1. Once the discount has been created, there are 2 tabs: _Detail_, and _Rules_. Click on the _Rules_ tab.

    ![Discount rules tab](./adding-discounts-to-the-subtotal/images/02.png)

1. Click (+) button to add a new Discount Rule.
1. Select _Cart Total_ from the _Type_ drop down menu.
1. Enter 25.00 in the _Cart Total Minimum Amount_ field.
1. Click _Save_.

In this example, a Discount Rule has been applied to this particular Discount. Customers will receive this discount for all purchases over the set amount.

The other two options (**Has all of these products** and **Has one of these products**) function by allowing the seller to select which products in the catalog are eligible for the discount.

   ![Discount rule types dropdown](./adding-discounts-to-the-subtotal/images/03.png)

   Select which products are to be included:

   ![Product selection for the discount](./adding-discounts-to-the-subtotal/images/04.png)

After selecting the applicable products, customers will receive a discount for these goods depending on which of these rules has been chosen.

## Additional Information

* [Adding Discounts by Product](../promoting-products/adding-discounts-by-product.md)
* [Creating a New Account Group](../account-management/creating-a-new-account-group.md)
