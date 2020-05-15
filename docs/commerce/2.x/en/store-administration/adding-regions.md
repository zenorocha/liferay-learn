# Adding Regions

This article describes to how to add states, provinces, or other administrative regions in Liferay Commerce. By default the United States and Italy have all of their respective country's states and provinces listed in the _Countries_ settings.

1. Navigate to the _Control Panel_ → _Commerce_ → _Settings_.
1. Click _Countries_.
1. Click on a country (France in this example).
1. Click _Regions_.
1. Click the _blue (+)_ button to add a region.
1. Enter the following:
    * **Name**: _Grand-Est_
    * **Code**: _FR-GES_
    * **Priority**: 6.0
1. Switch the toggle to _Active_.

    ![Adding the Grand-Est Region](./adding-regions/images/01.png)
1. Click _Save_.

The French region _Grand-Est_ is now added to the list of regions. _Grand-Est_ will appear in the Region list if France is chosen in the _Country_ field on the _Shipping Address_ page. Repeat these steps as necessary.

## Additional Information

**Note 1:** The values in the _Code_ field must follow the [ISO-3166-2](https://ipfs.io/ipfs/QmXoypizjW3WknFiJnKLwHCnL72vedxjQkDDP1mXWo6uco/wiki/ISO_3166-2.html) standard's format.

**Note 2:** The priority field may be used to manually rank regions as needed.
