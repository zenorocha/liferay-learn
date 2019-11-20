# Adding a New Currency

Liferay Commerce pre-configures multiple currencies to be available for use, out-of-the-box. Currencies that are not available by default may be easily added.

This article details how to add a new currency to your store.

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

_Format Pattern_ requires the currency’s sign, the number of digits to come between commas, and which places are displayed. For example, in the format $###,##0.00 for US dollars, the places held by _0_ are always displayed (as 0 if no other digit is present) while the places held by _#_ are only displayed if occupied. A value of 0.01 in the above format would be displayed as $0.01.

_Rounding Mode_ requires a type of [rounding mode](https://en.wikipedia.org/wiki/Rounding#Directed_rounding_to_an_integer) from the drop-down menu.

Using [Mercanet](../sales/mercanet.md) requires EUR as the primary currency. Therefore, leave the default settings for Primary Currency to _No_ if using Mercanet.
