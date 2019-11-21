# Sites and Site Types

## Sites

Liferay Commerce deployments consist of a hierarchy of Sites, Pages, Widgets, and Accounts. Creating and configuring a site in Liferay Commerce is one of the first steps to launching a store. You may use an [Accelerator](../starting-a-store/accelerators.md) to jump start your site, or create a blank site and add the Commerce widgets and pages you require.

Liferay Commerce is built on Liferay DXP. For more information about how Liferay DXP Sites work, see [Building a Site](https://help.liferay.com/hc/en-us/articles/360018171231-Building-a-Site).

See the [Store Setup Overview](../starting-a-store/store-setup-overview.md) for more information on creating a store site.

## Site Types

Liferay Commerce uses Liferay Sites in combination with Site Types. Site Types designate your store's business model and will determine how your storefront works with [Accounts](../account-management/introduction-to-accounts.md).

The following site types are available:

* **B2B**: A business-to-business site that requires business accounts. In order to make purchases, individual user accounts _must_ be associated with a business account. Using the _Minium_ accelerator will jump start a site using the B2B site type.

* **B2C**: A business-to-consumer site that requires personal accounts. Any authenticated user may make a purchase. Using the _Speedwell_ accelerator (coming soon) will jump start a site using the B2C site type.

* **B2X**: A B2C-B2B site recognizes personal and business accounts. Users may be associated with business accounts, but may also make purchases individually.

## Setting a Site Type

It is best practice to set a site's type as soon as you create it and avoid changing it in the future.

To set your site's type, navigate to _Site Administration_ → _Commerce_ → __Settings_ and select the Site Type tab. Select a type from the dropdown menu and click _Save_.

![Site Type](./sites-and-site-types/images/01.png)

Changing a site's type also changes which accounts appear in its Accounts widget. If an instance contains business accounts but a site's type is set to B2C, those accounts still exist in the database but do not appear in the Accounts widget and are inaccessible to users.

## Additional Information

* [Store Setup Overview](../starting-a-store/store-setup-overview.md)
* [Building a Site](https://help.liferay.com/hc/en-us/articles/360018171231-Building-a-Site)
* [Introduction to Accounts](../account-management/introduction-to-accounts.md)
