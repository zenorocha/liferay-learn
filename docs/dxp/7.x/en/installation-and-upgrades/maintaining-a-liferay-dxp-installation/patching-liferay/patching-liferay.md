# Patching Liferay

As you develop and maintain DXP instances, you'll want to update them with the latest fixes. Liferay aggregates fixes and makes them available to Enterprise Subscribers in ZIP files called _patches_.

## Patch Types

There are several different kinds of patches, and they serve different purposes.

* **Fix Packs:** Resolve the most recent issues.
* **Security Fix Packs:** Address the latest security issues immediately.
* **Hotfixes:** Requested by customers to fix business critical DXP issues fast.
* **Service Packs:** Incorporate larger fixes that require more testing. Service Pack releases also offer DXP built with the Service Pack and bundled with Tomcat.

[Patch Types](./understanding-patch-types) explains all of the patch options.

## Installing Patches

Once you have a patch you need, you can use Liferay's Patching Tool to apply it. [Installing Patches](./installing-patches.md) provides the basic steps for patching DXP safely and comprehensively.

## Configuring the Patching Tool

The [`patching-tool.sh auto-discovery` command](./configuring-the-patching-tool.md) configures the tool automatically for Tomcat bundles and common app server configurations. You can also configure the Patching Tool manually to handle DXP installation variations.

## Advanced Patching

As you start applying patches regularly, adding new DXP environments, or even working with the DXP source code, you'll want to know the best way to manage patching. Some advanced patching topics include:

* [Getting Patch Information](./getting-patch-information.md)
* [Uninstalling Patches](./uninstalling-patches.md)
* [Slimming Down Patched Installations](./advanced-patching/slimming-down-patched-installations.md)
* [Using Slim Bundles](./advanced-patching/using-slim-bundles.md)
* [Handling Collisions between Patches and Custom Plugins](./advanced-patching/custom-code-and-patch-compatibility.md)

Now that you've digested the patching overview, learn about the [Patch Types](./understanding-patch-types.md) available to you. Then you'll be ready to apply patches following [Installing Patches](./installing-patches.md).