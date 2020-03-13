# Authorize.net

This article details how to enable Authorize.Net as a payment method. [Authorize.Net](https://www.authorize.net/about-us/) is a subsidiary of Visa and a provider of payment gateway services that manages the submission of billions of transactions to processing networks on behalf of merchant customers.

## Prerequisites

Before configuring your store to use Authorize.Net, it is necessary to [generate the following](https://support.authorize.net/s/article/How-do-I-obtain-my-API-Login-ID-and-Transaction-Key):

* An API Login ID
* A Transaction Key

## Activating Authorize.net as a Payment Method

1. Navigate to _Control Panel → Configuration → System Settings_.
1. In the _Commerce_ section, click _Payment_.
1. Click _Authorize.Net Payment Engine Group Service_ on the Site Scope left menu.
1. Enter the following:
    * **API Login ID**
    * **Transaction Key**
    * **Environment**
1. Check the following options to enable to display the following:
    * _Show Bank Account_
    * _Show Credit Card_
    * _Show Store Name_
1. Check the following options to enable to display the following:
    * _Require CAPTCHA_
    * _Require Card Code Verification_

     ![Authorize.Net Settings](./authorize.net/images/01.png)

1. Click _Save_.
1. Click the _3-dot icon_ next to _Authorize.Net_ then _Activate_.

Once finished, Authorize.Net is now enabled.

## Additional Information

* [Adding a New Currency](../../starting-a-store/store-administration/adding-a-new-currency.md)
* [Mercanet](./mercanet.md)
* [PayPal](./paypal.md)
