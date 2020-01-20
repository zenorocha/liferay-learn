# Mercanet

This article details how to enable Mercanet as a payment method. Because Mercanet accepts **only EUR**, the store's primary currency must be EUR.

## Mercanet Guide

1. [Review prerequisites.](#prerequisites)
1. [Set EUR as the primary store currency.](#set-eur-as-the-primary-store-currency)
1. [Activate Mercanet as a Payment Method.](#activate-mercanet-as-a-payment-method)

## Prerequisites

Before configuring your store to use [Mercanet](https://documentation.mercanet.bnpparibas.net/index.php?title=Obtenir_sa_cl%C3%A9_secr%C3%A8te#), it is necessary to generate the following:

1. Mercanet Merchant ID
1. Secret Key
1. Key Version

## Set EUR as the Primary Store Currency

When using Mercanet, your store must use Euros as the primary currency. To change the primary currency:

1. Navigate to the _Control Panel → Commerce → Settings_.
1. Click _Currencies_.
1. Click the _3-dot icon_ next to Euro.
1. Click _Set as Primary_.

_Euro_ is now set as the primary currency.

![Set Primary Currency](./mercanet/images/01.png)  

## Activate Mercanet as a payment method

1. Navigate to _Site Administration → Commerce → Settings → Payment Methods_.
1. Click _Payment Methods_.
1. Click _Mercanet_.
1. Click _Configuration_.
1. Enter the following:
    * Your _Merchant ID_
    * Your _Secret Key_
    * Your _Key Version_
1. Select _Production_ if it is a live site or _Test_ or _Simulation_ if it is a test environment.
    ![Mercanet settings](./mercanet/images/02.png)
1. Click _Save_.
1. Click the _3-dot icon_ next to _Mercanet_ then _Activate_.

Mercanet is now enabled for your store.

## Additional Information

* [Adding a New Currency](../../starting-a-store/store-administration/adding-a-new-currency.md)
* [Authorize.Net](./authorize.net.md)
* [PayPal](../mercanet.md)
