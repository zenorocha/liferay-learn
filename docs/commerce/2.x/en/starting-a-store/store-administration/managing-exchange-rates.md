# Managing Exchange Rates

Exchange rates can be manually managed or automatically updated by an online service. To ensure that the store has the most recent exchange rates, administrators can enable an automatic currency conversion.

## Enabling automatic currency conversion

By default, Liferay Commerce relies on the European Central Bank for foreign exchange rates. The ECB updates its exchange rates approximately every 24 hours. See [Implementing an Exchange Rate Provider](../../developer-guide/tutorial/implementing-an-exchange-rate-provider.md) to learn how to implement an alternative exchange rate provider.

To enable automatic exchange rate updates:

1. Go to the _Control Panel_ → _Commerce_ → _Settings_.
1. Click the _Currencies_ tab.
1. Click the _Exchange Rate_ screen.
1. Select _European Central Bank_ from the _Exchange Rate Provider_ dropdown menu.
1. Toggle the _Enable Auto-Update_ radio button to _Yes_.

    ![Enabling European Central Bank conversion](./managing-exchange-rates/images/01.png)

1. Click _Save_.

Automatic exchange rate updates are now enabled.

### Changing the Update Interval

By default, the exchange rates will be updated every 60 minutes. To increase the frequency that the exchange rates are updated:

1. Go to the _Control Panel_ → _Configuration_ → _System Settings_.
1. Click _Pricing_ in the _Commerce_ section.
1. Click _Exchange Rate Auto-Update_.
1. Enter a value in minutes: 120 (every 2 hours).
1. Check the _Enable Auto-Update_ checkbox.

    ![Changing currency update interval](./managing-exchange-rates/images/02.png)

1. Click _Save_.

The Exchange Rate Auto-Update is now enabled and will update currency exchange rates every two hours.

## Setting Exchange Rates Manually

Currency exchange rates can be configured manually by the store administrator.

1. Go to the _Control Panel_ → _Commerce_ → _Settings_.
1. Click the _Currencies_ tab.
1. Click on an existing currency (for example, _Chinese Yuan Renminbi_)
1. Enter a new value in the _Exchange Rate with US Dollar_ field (for example, _6.96_).

    ![Modifying an exchange rate manually](./managing-exchange-rates/images/03.png)

1. Click _Save_.

## Additional Information

* [Implementing an Exchange Rate Provider](../../developer-guide/tutorial/implementing-an-exchange-rate-provider.md)
