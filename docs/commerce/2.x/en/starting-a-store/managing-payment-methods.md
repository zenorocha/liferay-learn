# Managing Payment Methods

Payment methods in Liferay Commerce are tied or "scoped" to different [channels](../catalog/introduction-to-channels.md) and store [sites](./sites-and-site-types.md). If a Liferay Commerce instance has more than one storefront hosted on the same instance, administrators can use different payment methods on each site.

To manage payment methods, navigate to _Site Administration_ → _Commerce_ → _Settings_ and select the Payment Methods tab. Select a method to edit it.

![Payment Methods page](./managing-payment-methods/images/01.png)

## Configuring a Payment Method

![Configuring a payment method](./managing-payment-methods/images/02.png)

### Details Page

Each details screen contains fields that determine how the payment method is rendered in the Checkout widget.

|Field | Description |
|----- | ----------- |
|Name  | Name of the Payment Method |
|Description | Short description of the payment method |
|Icon| Upload a small image or logo to represent the payment method |
|Priority | Determines the order in which the payment method is displayed in the checkout process; lower numbers are displayed higher |
|Active | Switch the toggle to activate or deactivate a payment method |  

### Configuration Page

For information about each available payment method configuration screen please see the Additional Information for each payment method.

### Restrictions Page

A restriction deactivates a payment method for buyers in specified countries.

![Setting payment method restrictions](./managing-payment-methods/images/03.png)

## Additional Information

* [Authorize.net](../orders-and-fulfillment/authorize.net.md)
* [Mercanet](../orders-and-fulfillment/mercanet.md)
* [Money Orders](../orders-and-fulfillment/money-orders.md)
* [PayPal](../orders-and-fulfillment/paypal.md)
