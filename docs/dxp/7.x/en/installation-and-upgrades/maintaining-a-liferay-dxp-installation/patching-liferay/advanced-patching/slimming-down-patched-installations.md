# Slimming Down Patched Installations

DXP patch information is retained in Patch Files in the installation by default. This facilitates restoring DXP to a previous patch level. Patch files, however, can take up lots of space. Here you'll learn how slim down your installation by separating Patch Files from your installation and how to restore Patch Files to your installation when you need them for patching activities.

A patched installation is large because the patch files (files used for meta data, verification, and validation) are stored inside the web application's `WEB-INF` folder by default. The Patching Tool requires these files for installing new patches and restoring previous patch levels; so you must hold on to them. You can reduce your DXP installation size, however, by extracting the patch files out of the installation. When you're ready to install new patches or restore a previous patch level, you can safely restore the patch files.

Here are the installation slimming topics:

* [Separating Patch Files from the Installation](#separating-patch-files-from-the-installation)
* [Restoring Separated Patch Files](#restoring-separated-patch-files)

## Separating Patch Files from the Installation

The Patching Tool's `separate` command extracts the patch files from the default location (the web application's `WEB-INF` folder) and packages them in a ZIP file. Here's the command:

```bash
./patching-tool.sh separate [separation_name]
```

The command moves the patch files from the patch file default location into a `liferay-patching-files-[separation-name].zip` file in the Patching Tool's `patches` folder. Store the ZIP file elsewhere to reduce your installation's size.

**WARNING:** If DXP is separated from its patches in this way, only the following Patching Tool commands can be used:

* `auto-discovery`
* `info`
* `setup`

All other commands return this:

```bash
This installation does not include data for patching. Please copy the
liferay-patching-files-[separation-name].zip file into the 'patches' directory
and run patching-tool setup.
```

## Restoring Separated Patch Files

When you need to patch DXP again, you must restore the separated patch files.

1. Copy the `liferay-patching-files-[separation-name].zip` back to the Patching Tool's `patches` folder

1. Run this command:

    ```bash
    ./patching-tool.sh setup
    ```

The patch files are restored to the installations patch file default location. All of the Patching Tool commands are available.

You now know how to store patch files so that your DXP installation doesn't take up unnecessary space. And you know how to restore the patch files so that you can install new patches.

## Additional Information

* [Installing Patches](../installing-patches.md)
* [Installing the Patching Tool](../installing-the-patching-tool.md)
* [Configuring the Patching Tool](../configuring-the-patching-tool.md)
* [Using Slim Bundles](./using-slim-bundles.md)