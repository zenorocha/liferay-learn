# Understanding Patch Types

The Liferay Support Team creates and releases fixes to issues discovered in DXP. The fixes are packaged in ZIP files referred to generally as _patches_. There are patches for security issues, customer-specific issues, and issues reported by the Liferay community. Here you'll learn about the patch types provided to DXP subscribers, [fix delivery](#ce-ga-releases) for Liferay Portal CE users, and the [levels of testing for each patch type](#patch-testing).

Here's a sumamry of the DXP patch types and the Portal CE fix delivery method.

| Patch Type | Purpose |
| :--------- | :------ |
| [Fix Packs](#fix-packs) | Resolve the most recent issues. |
| [Security Fix Packs](#security-fix-packs) | Address the latest security issues immediately. |
| [Hotfixes](#hotfixes) | Requested by customers to fix business critical DXP issues fast. |
| [Service Packs](#service-packs) | Incorporate the latest Fix Pack and can include larger fixes that require more testing. |
| [Portal CE GA releases](#fix-delivery-for-portal-ce) | Apply fixes based on the latest DXP Service Pack. |

## Fix Packs

A Fix Pack is a bundled collection of the latest fixes for DXP subscribers. They address issues in the DXP core and Marketplace applications that ship with DXP. Fix Packs are cumulative: each one contains all the fixes from previous Fix Pack and the latest Security Fix Packs.

Fix Packs are available on the Help Center's [Downloads](https://customer.liferay.com/downloads) page and are installed using the [Patching Tool](./installing-patches.md). Release notes and change logs accompany each Fix Pack. Release notes highlight key information, such as important changes and security fixes. Change logs provide detailed information about each fix.

The Patching Tool applies fixes to Fix Packs automatically. If a new (fixed) version of a Fix Pack is released, install it with the Patching Tool. The Patching Tool uninstalls the old Fix Pack and installs the new version in its place.

## Security Fix Packs

[DXP Security Fix Packs](https://help.liferay.com/hc/en-us/articles/360035038331) address the latest critical security issues. They are available on the Help Center's [Downloads](https://customer.liferay.com/downloads) page and are installed using the [Patching Tool](./installing-patches.md).

Security Fix Packs for intended for particular Fix Packs (base Fix Packs). Each Security Fix Pack on the [Downloads](https://customer.liferay.com/downloads) page specifies the base Fix Pack it is for. Their file names indicate the base Fix Pack too.

For example, the parts of file name `liferay-security-dxp-1-201902-1-7210.zip` represent these characteristics:

* `liferay-security`: Security Fix Pack prefix.
* `dxp-1`: Base Fix Pack.
*  `2019`: Build year.
* `02`: ID used by Liferay.
* `1`: Counter used by Liferay.
* `7210`: Build number. The one represents DXP 7.2.10.

```note::
   Security Fix Packs do not change your DXP installation's regular Fix Pack level.
```

## Hotfixes

A Hotfix is a fix or collection of fixes requested by a customer and delivered in between Fix Pack releases to address confirmed critical issues in DXP. You can request at Hotfix via a [Help Center ticket](https://help.liferay.com/hc). The Liferay Support Team works with you to determine if the issue is with the product, and provides a fix for any unintended product behavior.

A Hotfix can depend on a particular Fix Pack level. If you attempt to install it without installing the Fix Pack first, the Patching Tool reports the required Fix Pack level. Go to the [Customer Portal](https://customer.liferay.com/downloads) and obtain the Fix Pack. Once all the necessary patches are downloaded to the `patches` folder, the Patching Tool installs them.

If you already have a Hotfix installed and a Fix Pack that contains that Hotfix is released, the Patching Tool manages integrating them. Fix packs always supersede Hotfixes; so when you install a Fix Pack, any Hotfixes it contains are uninstalled and the Fix Pack version of the fix is installed in its place.

## Service Packs

A Service Pack is built on top of the original DXP GA major release and includes the latest Fix Pack, Patching Tool, and bundled Marketplace applications. Fixes that require more time to implement and test can be reserved for Service Packs.

Service Packs are available on the Help Center's [Downloads](https://customer.liferay.com/downloads) page and are installed using the [Patching Tool](./installing-patches.md).

It's best to start a new project on the latest Service Pack for DXP, because of all that it includes.

If you're maintaining an existing DXP installation, it's best to keep it updated with the latest Fix Pack (according to your own deployment schedule). This way, you're integrating changes in smaller doses.

## Fix Delivery for Portal CE

Liferay Portal CE GA releases are based on DXP Service Packs and are typically available a few weeks after the corresponding Service Pack. They include the same fixes, minus those for EE-only features. See [Updating Liferay Portal CE](./updating-liferay-portal-ce.md) for more information.

## Patch Testing

The following table describes the testing applied to each patch type.

| Patch Type     | Testing |
| :------------- | :------ |
| Hotfixes       | Automated regression testing similar to Fix Packs (see below), and the support engineer who fixes the reported issue tests it. |
| Fix packs      | Automated regression testing and manual testing. |
| Service packs  | Liferay runs test suites on the packaged Service Pack. |
| Portal CE GA Releases | Same testing as the corresponding DXP Service Pack, plus upgrade testing from the previous GA. |

## Keeping Up With Patches

[Liferay's Help Center \(help.liferay.com\)](https://help.liferay.com/hc) is your destination for patch information and more.

* Announcements section: Links to the latest news on fix packs, security alerts, product releases, and system updates.

* *Subscribe* button: Signs you up for Liferay DXP release, patch, and system improvement emails.

* [Downloads page](https://customer.liferay.com/downloads): provides access to

    * Latest Release
    * Fix Packs
    * Service Pack Archives
    * Security Fix Packs
    * Patching Tool
    * and more

* [Security page](https://help.liferay.com/hc/en-us/categories/360000892792-Security): Links to security-related overviews, advisories, and Fix Packs.

The Help Center is also a launching point for account support, support FAQs and more. Liferay is here to help!

## Conclusion

Now that you know the patch types Liferay provides for delivering fixes, you can stay updated on relevant patches and [install](./installing-patches.md) them.

## Additional Information

* [Installing Patches](./installing-patches.md)
* [Installing the Patching Tool](./installing-the-patching-tool.md)
* [Updating Liferay Portal CE](./updating-liferay-portal-ce.md)