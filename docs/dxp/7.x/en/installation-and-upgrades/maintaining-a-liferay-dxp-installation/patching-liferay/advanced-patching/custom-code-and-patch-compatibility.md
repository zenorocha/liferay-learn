# Custom Code and Patch Compatibility

If you deploy code that customizes or patches DXP, you must  maintain its compatibility with all patches you're using. Here you'll learn how to compare custom patches with official patches, store custom patch information, and check for collisions between your custom OSGi fragments and Liferay's patches.

## Comparing Patch Levels

The Patching Tool's `diff` and `store` commands work with differences between DXP patches and versions. The `store` command writes a patch level file for your source code. The `diff` command prints the differences between patches.

### `patching-tool diff`

`patching-tool diff` prints the differences between two patch levels. At least one stored patch level must be available. This command accepts options for filtering the output:

* `collisions`: Lists modified files that collide with deployed plugins.
* `files`: Lists the modified files.
* `fixed-issues`: Lists the LPS/LPE issues (from the issue tracking system) that the patch fixes.
* `html`: Specify this along with one of the filtering options (`source`, `files`, or `fixed-issues`) and after the patch levels, to write the differences to an HTML file (`<stored-name-1>-<stored-name-2>-[type]-diff.html`) in the `diffs` folder. Additions are colored green and deletions are colored red.
* `source`: Shows the source code differences between the two patch levels.

For detailed usage information, run `patching-tool help diff`.

### `patching-tool store`

`patching-tool store` manages patching level information for the `diff` command. Your patches must contain source code to store the patch level and to prepare usable information for the `diff` command. Here are the `store` command options:

* `add`: Stores the patch level to the patches folder.
* `info`: Prints the list of patches which make up the stored patch level.
* `rm`: Removes previously stored patch level information.
* `update`: Adds or updates patch level information.

For detailed usage information, run `patching-tool help store`.

## Handling collisions between patches and deployed plugins

Some patches update files you might have customized via a plugin. The `list-collisions` command lists  JSP file differences (collisions) in OSGi fragment bundles:

```bash
./patching-tool.sh list-collisions
```

It is an alias for the following diff command:

```bash
./patching-tool.sh diff collisions files _base
```

`_base` is the literal patch level name. Collisions are only listed for
installed patches that contain source code files. 

If you removed certain patches or there is a collision of some kind use the"-force" argument to force the Patching Tool to install the currently available patches no matter what.

Example:

```bash
./patching-tool.sh profile_name install -force
```