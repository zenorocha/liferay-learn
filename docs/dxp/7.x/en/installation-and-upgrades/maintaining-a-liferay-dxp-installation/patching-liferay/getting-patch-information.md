# Getting Patch Information

Having patch level information at your finger tips facilitates maintaining your installation and getting help from Liferay Support. These two Patching Tool commands provide invaluable information:

* [`info`](#using-the-info-command): Lists your DXP installation's product information, patches, Patching Tool version, and more.
* [`support-info`](#including-support-info-in-support-tickets): Lists system information that's critical to reproducing issues.

## Using the `info` Command

The Patching Tool's `info` command reports patch and DXP installation information that includes these details:

* Service Pack version
* Patching Tool version
* Plugins detected
* Patches Installed
* Patches available (in your `patching-tool/patches/` folder)

They clarify what you've installed and what's available to install.

Here's an example execution:

```
patching-tool>./patching-tool.sh info
Loading product and patch information...
Product information:
  * installation type: binary
  * build number: 7210
  * service pack version:
    - available SP version: 1
    - installable SP version: 1
  * patching-tool version: 2.0.13
  * time: 2019-12-06 20:26Z
  * host: 91WRQ72 (8 cores)
  * plugins: no plugins detected

Currently installed patches: dxp-2-7210

Available patches: dxp-2-7210, dxp-3-7210

Detailed patch list:
  [*-] dxp-2-7210 :: Installed; Won't be installed: dxp-3 contains the fixes included in this one :: Built for LIFERAY
  [ I] dxp-3-7210 :: Currently not installed; Will be installed. :: Built for LIFERAY
```

The Patching Tool's `support-info` command gathers details that help Liferay Support understand your environment fast.

## Including `support-info` in Support Tickets

Providing your environment's information (e.g., hardware architecture) and patch level to Liferay Support is critical for reproducing your issues. Write your support information (including your patch level) to a file by executing this command:

```bash
./patching-tool.sh support-info
```

The support information is written to file `patching-tool-support-info-actual-timestamp.txt` in your `patching-tool` folder. Please upload this file to the [Help Center](https://help.liferay.com/hc) ticket.