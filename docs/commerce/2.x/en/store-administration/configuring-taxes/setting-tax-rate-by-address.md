# Setting Tax Rates by Address

Liferay Commerce supports two types of tax calculations: fixed rates and by address. The fixed method applies the same rate to a product each time it is purchased, while the by address method applies only to buyers within a specified geographical region.

Calculating taxes by address sets rates for geographical areas independently. You can apply several by address rates to a single tax category. When a product from that category is purchased, the tax rate appropriate to the buyer’s location is used.

1. Go to _Site Administration_ → _Commerce_ → _Settings_.
1. Click the _Taxes_ tab and then the _Tax Calculations_ sub-tab.
1. Click _By Address_.
1. Switch the _Percentage_ toggle to _YES_ if you want the tax to be defined as a percentage of the purchase price. Leave the toggle disabled to define the tax as a fixed amount.
1. Switch the _Active_ toggle to _YES_.

    ![Enabling tax rates by address](./setting-tax-rate-by-address/images/01.png)

1. Click _Save_.

Next, set the Tax Rate by Category and by Address:

1. Click the _Tax Rate Settings_ sub-tab and then on the _Add Tax Rate Setting_ button.
1. Select the _Tax Category_ from the _Tax Category_ field.
1. Enter the tax rate in the _Rate_ field.
1. Select the country, region, enter the Zip code.

    ![Configuring tax rate settings](./setting-tax-rate-by-address/images/02.png)

1. Click _Save_.

Your store now applies this particular tax rate for all goods whose billing address is in the assigned country; in this example, 16% tax applied to buyers from Belgium.

## Additional Information

**Note 1**: The tax rate applies only to buyers located in the area you designate. To designate an entire country, leave _Region_ and _Zip_ blank; to designate an entire region, leave _Zip_ blank.

**Note 2**: If you assign multiple settings to a single tax category (but specify different geographical areas), the rate appropriate to the buyer’s location is used. If you assign both a by address rate and a fixed rate to a single tax category, both rates will be applied.

* [Setting Tax Rates by Fixed Rate](../configuring-taxes/setting-tax-rate-by-fixed-rate.md)
* [Creating Tax Categories](../configuring-taxes/creating-tax-categories.md)
