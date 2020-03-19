# Adding a New Currency

Liferay Commerce pre-configures multiple currencies to be available for use, out-of-the-box. Store administrators can add a new currency if a desired currency is not already included. See the [Currencies Reference](./currencies-reference.md) on how to enter specific values in the correct format.

To add a new currency:

1. Navigate to _Control Panel_ → _Commerce_ → _Settings_.
1. Click the _Currencies_ tab.
1. Click the _Add Currency_ button.
1. Enter the following:
    * *Name:* New Zealand Dollar
    * *Code:* NZD (ISO code)
    * *Format Pattern:* $###,##0.00
    * *Maximum Decimal places:* 2
    * *Minimum Decimal places:* 2
    * *Rounding Mode:* HALF EVEN
    * *Exchange Rate:* 1.49701
    * *Priority:* 11
1. Leave the _Primary_ toggle to _NO_.

    ![Adding a currency](./adding-a-new-currency/images/01.png)

1. Switch the _Active_ toggle to _Yes_.
1. Click _Save_.

## Additional Information

### Notes

* _Format Pattern_ field requires the currency’s sign, the number of digits to come between commas, and which places are displayed. For example, in the format $###,##0.00 for US dollars, the places held by _0_ are always displayed (as 0 if no other digit is present) while the places held by _#_ are only displayed if occupied. A value of 0.01 in the above format would be displayed as $0.01.

* _Rounding Mode_ requires a type of [rounding mode](https://en.wikipedia.org/wiki/Rounding#Directed_rounding_to_an_integer) from the drop-down menu.

* Some payment methods require a specific primary currency to be configured for the store in order to function. [Mercanet](../../store-administration/configuring-payment-methods/mercanet.md) requires EUR as the primary currency.
