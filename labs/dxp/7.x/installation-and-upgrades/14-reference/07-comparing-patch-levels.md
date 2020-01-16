# Comparing Patch Levels

The Patching Tool shows you what changed between different DXP patches and versions. These commands show you information about the different patch levels:

`patching-tool diff`: Prints the differences between two patch levels. At least one stored patch level must be available. This command accepts options for filtering the output:

- `source`: Shows the source code differences between the two patch levels.
- `files`: Lists the modified files.
- `fixed-issues`: Lists the LPS/LPE issues (from the issue tracking system) that the patch fixes.
- `html`: Specify this along with one of the filtering options (`source`, `files`, or `fixed-issues`) and after the patch levels, to write the differences to an HTML file (`<stored-name-1>-<stored-name-2>-[type]-diff.html`) in the `diffs` folder. Additions are colored green and deletions are colored red.
- `collisions`: Lists modified files that collide with deployed plugins.

For detailed usage information, run `patching-tool help diff`.

`patching-tool store`: Manages patching level information for the `diff` command. Your patches must contain source code to store the patch level and to prepare usable information for the `diff` command. Here are the `store` command options:

- `info`: Prints the list of patches which make up the stored patch level.
- `add`: Stores the patch level to the patches folder.
- `update`: Adds or updates patch level information.
- `rm`: Removes previously stored patch level information.

For detailed usage information, run `patching-tool help store`.
