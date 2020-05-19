# Understanding Patch Types

The Liferay Support Team creates and releases fixes to issues discovered in DXP. The fixes are packaged in ZIP files referred to generally as _patches_. There are patches for security issues, customer-specific issues, and issues reported by the Liferay community. Here you'll learn about the patch types provided to DXP subscribers, [fix delivery](#ce-ga-releases) for Liferay Portal CE users, and the [levels of testing for each patch type](#patch-testing).

The following patch types for DXP subscribers are covered first.

* [Fix packs](#fix-packs)
* [Hotfixes](#Hotfixes)
* [Service packs](#service-packs)

## Fix Packs

A Fix Pack is a bundled collection of the latest fixes for DXP subscribers. They address issues in the DXP core and Marketplace applications that ship with DXP. Fix Packs are cumulative: each one contains all the fixes from previous Fix Pack and the latest Security Fix Packs.

Fix Packs are available on the Help Center's [Downloads](https://customer.liferay.com/downloads) page and are installed using the [Patching Tool](./installing-patches.md). Release notes and change logs accompany each Fix Pack. Release notes highlight key information, such as important changes and security fixes. Change logs provide detailed information about each fix.

The Patching Tool applies fixes to Fix Packs automatically. If a new (fixed) version of a Fix Pack is released, install it with the Patching Tool. The Patching Tool uninstalls the old Fix Pack and installs the new version in its place.

### Security Fix Packs

[DXP Security Fix Packs](https://help.liferay.com/hc/en-us/articles/360035038331) address the latest critical security issues. Each Security Fix Pack depends on a base Fix Pack (typically the latest one). The number following `liferay-security_dxp_` in the Security Fix Pack file name indicates the base Fix Pack. For example, the base Fix Pack for `liferay-security-dxp-1-201902-1-7210.zip` is DXP Fix Pack 1.

Security Fix Packs are available on the Help Center's [Downloads](https://customer.liferay.com/downloads) page and are installed using the [Patching Tool](./installing-patches.md).

```note::
   Security Fix Packs do not change your DXP installation's regular Fix Pack level.
```

## Hotfixes

If you encounter an issue that is not yet addressed in a Fix Pack, you can request at Hotfix via a [Help Center ticket](https://help.liferay.com/hc). The Liferay Support Team works with you to determine if the issue is with the product, and provides a fix for any unintended product behavior.

Some Hotfixes depend on Fix Packs. If you attempt to install a Hotfix that depends on a Fix Pack, the Patching Tool notifies you. Go to the [Customer Portal](https://customer.liferay.com/downloads) and obtain the Fix Pack. Once all the necessary patches are downloaded to the `patches` folder, the Patching Tool installs them.

If you already have a Hotfix installed and a Fix Pack that contains that Hotfix is released, the Patching Tool manages this for you. Fix packs always supersede Hotfixes; so when you install a Fix Pack, any Hotfixes it contains are uninstalled and the Fix Pack version of the fix is installed in its place.

## Service Packs

A Service Pack is built on top of the original DXP GA major release and includes the latest Fix Pack, latest Patching Tool, and latest bundled Marketplace applications. The Fix Pack in a Service Pack can include fixes that require more extensive testing that a regular Fix Pack.

Service Packs are available on the Help Center's [Downloads](https://customer.liferay.com/downloads) page and are installed using the [Patching Tool](./installing-patches.md).

It's best to start a new project on the latest Service Pack for DXP, because it includes the latest fixes and versions of Marketplace apps and the Patching Tool.

If you're maintaining an existing DXP installation, it's best to keep it updated with the latest Fix Pack (according to your own deployment schedule). This way, you're integrating changes in smaller doses.

## Fix Delivery for Portal CE

Liferay Portal CE GA releases are based on DXP Service Packs and are typically available a few weeks after the corresponding Service Pack. They include the same fixes, minus those for EE-only features. See [Updating Liferay Portal CE](./advanced-patching/updating-liferay-portal-ce.md) for more information.

## Patch Testing

The following table describes the testing applied to each patch type.

| **Patch Type** | **Testing** |
| :------------- | :---------- |
| Hotfixes       | Hotfixes receive automated regression testing similar to Fix Packs (see below), and the support engineer who fixes the reported issue tests it. |
| Fix packs      | Go through both automated regression testing and manual testing. |
| Service packs  | Liferay runs test suites on the packaged service pack. |
| Portal CE GA Releases | The same testing as the corresponding service pack, plus upgrade testing from the previous GA. |

## Keeping Up With Patches

[Liferay's Help Center \(help.liferay.com\)](https://help.liferay.com/hc) is your destination for patch information an more.

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

* [Keeping Up With Fix Packs and Service Packs](./keeping-up-with-patches.md)

* [Updating Liferay Portal CE](./advanced-patching/updating-liferay-portal-ce.md)
