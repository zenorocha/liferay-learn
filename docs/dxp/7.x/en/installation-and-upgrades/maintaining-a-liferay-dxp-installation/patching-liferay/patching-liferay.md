# Patching Liferay

As you develop and maintain DXP instances, you'll want to update them with the latest fixes. Liferay aggregates fixes and makes them available in ZIP files called _patches_.

## Patch Types

There are several different kinds of patches, and they serve different purposes. There are patches for critical security issues, patches for larger numbers of the most recent issues, and patches that include the latest versions of the Upgrade Tool and DXP-bundled Marketplace applications. And of course we provide a way to request resolutions to business critical issues fast. The [Patch Types](./understanding-patch-types) article explains all of the patch options.

## Installing Patches

Once you have a patch you need, you can use Liferay's Patching Tool to apply it. [Installing Patches](./installing-patches.md) provides the basic steps for patching DXP safely and comprehensively.

## Configuring the Patching Tool

The [`patching-tool.sh auto-discovery` command](./configuring-the-patching-tool.md) configures the tool automatically for Tomcat bundles and common app server configurations. You can also configure the Patching Tool manually to handle DXP installation variations.

## Advanced Patching

As you start applying patches regularly, adding new DXP environments, or even working with the DXP source code, you'll want to know the best way to manage patching. Some advanced patching topics include:

* [Getting Patch Information](./getting-patch-information.md)
* [Uninstalling Patches](./uninstalling-patches.md)
* [Using Slim Bundles](./advanced-patching/using-slim-bundles.md)
* [Slimming Down Patched Installations](./advanced-patching/slimming-down-patched-installations.md)
* [Handling Collisions between Patches and Custom Plugins](./advanced-patching/custom-code-and-patch-compatibility.md)

Now that you've digested the patching overview, learn about the [Patch Types](./understanding-patch-types.md) available to you. Then you'll be ready to apply patches following [Installing Patches](./installing-patches.md).