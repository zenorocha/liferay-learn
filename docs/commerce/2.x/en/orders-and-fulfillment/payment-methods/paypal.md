# PayPal

This article details how to enable PayPal as a payment method.

Before configuring your store to use PayPal, it is necessary to generate a PayPal Client ID and a Client Secret number. Visit the [PayPal Developer Dashboard](https://developer.paypal.com/developer/applications/create) for more information.

1. Navigate to _Site Administration → Commerce → Settings → Payment Methods_.
1. Click _PayPal_.
1. Click _Configuration_.
1. Enter the following:
    * **Client ID**
    * **Client Secret**
1. Select _Live_ if it is a live site or _Sandbox_ if it is a test environment.
1. In the _Payment Attempts Max Count_ field, enter the number of attempts to make payment on a subscription before cancelling the subscription.
    * For more information, read PayPal's [Reattempt failed recurring payments with Subscribe buttons](https://developer.paypal.com/docs/classic/paypal-payments-standard/integration-guide/reattempt-failed-payment/) article.
    ![PayPal Settings](./paypal/images/01.png)
1. Click _Save_.
1. Click the _3-dot icon_ next to _PayPal_ then _Activate_.

PayPal is now enabled for your store.

## Additional Information

Here is more information about adding other payment methods:

* [Adding a New Currency](../starting-a-store/store-administration/adding-a-new-currency/)
* [Authorize.net](./authorize.net.md)
* [Mercanet](./mercanet.md)
* [Reattempt failed recurring payments with Subscribe buttons](https://developer.paypal.com/docs/classic/paypal-payments-standard/integration-guide/reattempt-failed-payment/)
