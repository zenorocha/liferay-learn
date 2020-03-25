# Using the Variable Rate Shipping Method

Variable rate shipping allows shipping costs to be calculated using three factors: weight, order subtotal (cost before shipping, taxes, and discounts), and a configurable flat rate. The store administrator may configure the weighting of each factor in the shipping calculation.

Multiple different shipping options with variable rates may be created. For example, a 'Standard Ground' option with a low cost per weight can be created. In contrast, a “Two-Day Air” option can be created that uses the same logic as 'Standard Ground', but has a higher cost per weight.

## Creating a Variable Rate Shipping Option

Variable-rate shipping costs are determined by the following formula:

`shipping costs = [fixed price] + ([order total weight] * [rate unit weight price]) * ([order subtotal] x [rate percentage])`

1. Navigate to the _Control Panel_ &rarr; _Commerce_ &rarr; _Channels_.

    ![Navigate to Channels in the Control Panel](./using-the-flat-rate-shipping-method/images/02.png)

1. Click on the desired channel (for example, Sahara.com). (Note that if you had used an accelerator like Minium to create your site, there is already a corresponding channel created by default.)
1. Scroll down to _Shipment Methods_.

    ![Configure the Variable Rate shipping method.](./using-the-variable-rate-shipping-method/images/03.png)

1. Click _Edit_ next to Variable Rate.
1. Switch the _Active_ toggle to _YES_.
1. Click the _Shipping Options_ tab.
1. Click the Add (![Add Icon](../../images/icon-add.png)) button to add a new Shipping option.
1. Enter the following:
    * **Name**: 2 Day Ground
    * **Description**: 2 Day Ground
    * **Priority**: 3.0

    ![Create the 2-Day Ground option.](./using-the-variable-rate-shipping-method/images/04.png)

1. Click _Save_.
1. Close the configuration window.

The new shipping option has been created. To finish configuring this shipping option, apply the variable shipping costs.

## Applying Variable Shipping Costs

1. Click the _Shipping Option Settings_ tab.
1. Click the Add (![Add Icon](../../images/icon-add.png)) button to add the variable rate costs formula.
1. Fill in the following fields:

    * **Shipping Option**: 2 Day Ground
    * **Warehouse**: Select a warehouse if the method should apply only to shipments from one location. Leave blank to use the method for all warehouses.
    * **Country**: Use this field if the shipping method should be restricted to the country specified.
    * **Region**: Use this field if the shipping method should be restricted to the region specified.
    * **Zip**: Use this field if the shipping method should be restricted to the zip specified.

    ![Set the warehouse and apply any country restrictions the details section.](./using-the-variable-rate-shipping-method/images/05.png)

    * **Weight From**: Enter a weight minimum for orders that can use this option.
    * **Weight To**: Enter a weight maximum for orders that can use this option.
    * **Fixed Price**: An entry in this field sets a minimum price and contributes the fixed component of the shipping cost formula. It can be left blank.
    * **Rate Unit Weight Price**: An entry in this field imposes a cost per weight. It can be left blank.
    * **Rate Percentage**: An entry in this field imposes a shipping cost based on a percentage of the order subtotal. It can be left blank.

    ![Set the minium and maximum weights and any fixed price and rates in the Settings section.](./using-the-variable-rate-shipping-method/images/06.png)

1. Click _Save_.
1. Close the Edit Shipping Option Setting window.

## Commerce 2.0 and Below

To create a new Variable Rate shipping option in Commerce 2.0 and below:

1. Navigate to _Site Administration_ → _Commerce_ → _Settings_.
1. Click the _Shipping Methods_ tab.
1. Click _Variable Rate_.
1. Click the _Shipping Options_ tab.
1. Click the Add (![Add Icon](../../images/icon-add.png)) button to add a new Shipping option:
1. Enter the following:
    * **Name**: 2 Day Ground
    * **Description**: 2 Day Ground
    * **Priority**: 3.0

    ![New 2 Day Ground Shipping Option](./using-the-variable-rate-shipping-method/images/01.png)

1. Click _Save_.

The new shipping option has been created. To finish configuring this shipping option, apply the variable shipping costs.

### Applying Variable Shipping Costs (2.0)

1. Click the _Shipping Option Settings_ tab.
1. Click the (+) button to add the variable rate costs formula.
1. Fill in the following fields:

    * **Shipping Option**: 2 Day Ground
    * **Warehouse**: Select a warehouse if the method should apply only to shipments from one location. Leave blank to use the method for all warehouses.
    * **Country**: Use this field if the shipping method should be restricted to the country specified.
    * **Region**: Use this field if the shipping method should be restricted to the region specified.
    * **Zip**: Use this field if the shipping method should be restricted to the zip specified.
    * **Weight From**: Enter a weight minimum for orders that can use this option.
    * **Weight To**: Enter a weight maximum for orders that can use this option.
    * **Fixed Price**: An entry in this field sets a minimum price and contributes the fixed component of the shipping cost formula. It can be left blank.
    * **Rate Unit Weight Price**: An entry in this field imposes a cost per weight. It can be left blank.
    * **Rate Percentage**: An entry in this field imposes a shipping cost based on a percentage of the order subtotal. It can be left blank.

      ![2 Day Ground Settings](./using-the-variable-rate-shipping-method/images/02.png)

1. Click _Save_.

To create more than one option, return to the _Shipping Options_ tab and repeat steps 2 through 4.

### Activating a Shipment Method (2.0)

1. Click the _Details_ tab.
1. Toggle the _Active_ button to _YES_.
1. Click _Save_.

The shipment method is now active.

## Additional Information

* [Using a Flat Rate Shipping Method](./using-the-flat-rate-shipping-method.md)
* [Using FedEx as a Carrier Method](./using-fedex-as-a-carrier-method.md)
* [Applying Shipping Method Restrictions](./applying-shipping-method-restrictions.md)
* [Measurement Units](./measurement-units.md)
* [Shipping Method Reference](./shipping-method-reference.md)
* [Creating a New Shipment](../../orders-and-fulfillment/managing-shipments/creating-a-shipment.md)
