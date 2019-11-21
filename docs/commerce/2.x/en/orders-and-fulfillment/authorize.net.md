# Authorize.net

This article details how to enable Authorize.Net as a payment method. [Authorize.Net](https://www.authorize.net/about-us/) is a subsidiary of Visa and a provider of payment gateway services that manages the submission of billions of transactions to processing networks on behalf of merchant customers.

## Prerequisites

Before configuring your store to use Authorize.Net, it is necessary to [generate the following](https://support.authorize.net/s/article/How-do-I-obtain-my-API-Login-ID-and-Transaction-Key):

* An API Login ID
* A Transaction Key

## Activate Authorize.net as a Payment method

1. Navigate to _Site Administration → Commerce → Settings → Payment Methods_.
2. Click _Authorize.Net_.
3. Click _Configuration_.
4. Enter the following:
    * **API Login ID**
    * **Transaction Key**
5. Select _Production_ if it is a live site or _Sandbox_ if it is a test environment.
6. Check the following options to enable to display the following:
    * _Show Bank Account_
    * _Show Credit Card_
    * _Show Store Name_
7. Check the following options to enable to display the following:
    * _Require CAPTCHA_
    * _Require Card Code Verification_
       ![Authorize.Net Settings](./authorize.net/images/01.png)
8. Click _Save_.
9. Click the _3-dot icon_ next to _Authorize.Net_ then _Activate_.

Once finished, Authorize.Net is now enabled.

## Additional Information

* [Adding a New Currency](../starting-a-store/adding-a-new-currency.md)
* [Mercanet](../orders-and-fulfillment/mercanet.md)
* [PayPal](../orders-and-fulfillment/mercanet.md)
