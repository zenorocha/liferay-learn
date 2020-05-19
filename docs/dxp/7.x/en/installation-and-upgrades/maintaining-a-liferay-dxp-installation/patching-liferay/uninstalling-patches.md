# Uninstalling Patches

After you install a patch, you may determine that you're not ready for the patch and decide to restore you installation to a previous patch level. Here you'll learn how to:

* Uninstall Patches
* Revert (uninstall) all patches at once.

## Uninstalling a Patch

You can uninstall patches and restore your installation to a desired patch level.

1. Remove the unwanted patch from your `patches` folder.

1. Run the `./patching-tool.sh install` command to restore your installation to the patch level that the remaining patches in your `patches` folder define.

Your DXP installation now has the patch level that your patches specify.

## Reverting All Patches

If you want to remove all or most of your patches, it may be easier to use the Patching Tool's `revert` command. The `revert` command removes ALL patches from the DXP installation, bringing it back to the original installed version (e.g., GA1).

1. Remove all of your patches.

    ```bash
    ./patching-tool.sh revert
    ```

    All of the patches are removed from your `patches` folder.

1. Bring your installation up to a desired patch level, by [installing the applicable patches](./installing-patches.md).

```tip::
   It's helpful to store your patches in a convenient location in case you want to restore your installation to a particular patch level. You can always download fix packs again from the `Customer Portal <https://customer.liferay.com/downloads>`_.
```

Now you know how to restore your DXP installation by uninstalling and reverting patches.

## Additional Information

* [Installing Patches](./installing-patches.md)
* [Understanding Patch Types](./understanding-patch-types.md)
* [Slimming Down Patched Installations](./advanced-patching/slimming-down-patched-installations.md)