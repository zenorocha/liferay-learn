# Using Slim Bundles

Liferay DXP Fix Packs and Service Packs are available bundled with the Tomcat application server. They are available as traditional bundles and _Slim Bundles_. Traditional bundles include the _Patching Files_: all of the source code and backup files that the Patching Tool requires to install the particular patch. Slim Bundles are approximately one third the size of traditional bundles because they do not include the the Patching Files. Slim Bundles are intended for demonstration purposes or installations where disk space is limited or costly. They're ideal for cloud and container environments.

```warning::
   Most Patching Tool commands (such as `install`) cannot be run on a Slim Bundle until the patching files for the Fix Pack or Service Pack are installed to the Slim Bundle.
```

Without the patching files for the Slim Bundle's respective Fix Pack/Service Pack, Slim Bundles are limited to these Patching Tool commands:

* [`auto-discovery`](../configuring-the-patching-tool.md)
* [`info`](../getting-patch-information.md)
* `setup`

Slim Bundles can still be patched, but require the extra step of restoring the Patching Files. Each patch's Patching Files for each patch are available on the [Help Center](https://customer.liferay.com/downloads).

## Patching Slim Bundles

If you try to install a patch to a Slim Bundle, the Patching Tool reports that Patching Files are needed. Here's the message.

```
This installation does not include data for patching. Please copy the
liferay-patching-files-[separation-name].zip file into the 'patches'
directory and run patching-tool setup.
```

Here are the Patching File setup steps:

1. Download the Patching Files from the [Help Center](https://customer.liferay.com/downloads). Navigate to the Fix Pack or Service Pack and download the Patching Files by selecting _Patching Files_ in the dropdown and clicking _Download_.

1. Extract the Patching Files to the Slim Bundle's `patching-tool/patches` folder.

1. Open a command line to the `patching-tool` folder.

1. Use the Patching Tool to set up the Patching Files.

    ```bash
    ./patching-toolsh setup
    ```

    Your Slim Bundle has the Patching Files and is ready for patching.

1. Patch your Slim Bundle following the instructions at [Installing Patches](../installing-patches.md).

You have learned the benefits of using a Slim Bundle and you know how to patch it.

## Additional Information

* [Installing Patches](../installing-patches.md)
* [Slimming Down Patched Installations](./slimming-down-patched-installations.md)