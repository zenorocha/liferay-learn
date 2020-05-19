# Custom Code and Patch Compatibility

If you deploy code that customizes or patches DXP, you must  maintain its compatibility with all patches you're using. The following topics explain how to do this.

* [Storing Patch Level Information for Custom Patches](#storing-patch-level-information-for-custom-patches)
* [Comparing Patch Level Differences](#comparing-patch-level-differences)
* [Handling Collisions Between Patches and Custom Plugins](#handling-collisions-between-patches-and-custom-plugins)

## Storing Patch Level Information for Custom Patches

The Patching Tool's `store` and `diff` commands work with differences between patches, including Liferay DXP patches and custom DXP patches. The `store` command writes a patch level file for the patch source code. The `diff` command prints the differences between patches.

The `./patching-tool.sh store` command manages patching level information used by the `diff` command. Your patches must contain source code to store a patch level and to prepare usable information for the `diff` command. Here are the `store` command options:

* `add`: Stores the patch level to the `patches` folder.
* `info`: Prints the list of patches which make up the stored patch level.
* `rm`: Removes previously stored patch level information.
* `update`: Adds or updates patch level information.

For detailed usage information, run `./patching-tool.sh help store`.

## Comparing Patch Level Differences

The `./patching-tool.sh diff` command prints the differences between two patch levels. At least one stored patch level must be available. This command accepts options for filtering the output:

* `collisions`: Lists modified files that collide with deployed plugins.
* `files`: Lists the modified files.
* `fixed-issues`: Lists the LPS/LPE issues (from the issue tracking system) that the patch fixes.
* `html`: Specify this along with one of the filtering options (`source`, `files`, or `fixed-issues`) and after the patch levels, to write the differences to an HTML file (`<stored-name-1>-<stored-name-2>-[type]-diff.html`) in the `diffs` folder. Additions are colored green and deletions are colored red.
* `source`: Shows the source code differences between the two patch levels.

For detailed usage information, run `./patching-tool.sh help diff`.

## Handling Collisions Between Patches and Custom Plugins

Some patches update files you might have customized via a plugin. The `list-collisions` command lists  JSP file differences (collisions) in OSGi fragment bundles:

```bash
./patching-tool.sh list-collisions
```

It is an alias for the following diff command:

```bash
./patching-tool.sh diff collisions files _base
```

The `_base` argument is the literal patch level name. Collisions are only listed for installed patches that contain source code files.

If you removed certain patches or there is a collision of some kind use the `-force` argument to force the Patching Tool to install the currently available patches no matter what.

Example:

```bash
./patching-tool.sh profile_name install -force
```

Now you know how to integrate your custom code and custom patches with other DXP patches.

## Additional Information

* [Installing Patches](../installing-patches.md)
* [Installing the Patching Tool](../installing-the-patching-tool.md)
* [Configuring the Patching Tool](../configuring-the-patching-tool.md)