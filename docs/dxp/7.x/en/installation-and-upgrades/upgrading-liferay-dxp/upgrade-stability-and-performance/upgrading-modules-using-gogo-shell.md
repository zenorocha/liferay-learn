# Upgrading Modules Using Gogo Shell

To troubleshoot upgrade issues with particular modules, it may be necessary to test and perform upgrades on a per-module basis, instead of en-masse. Liferay has Gogo shell commands for upgrading and verifying individual modules.

For example, a module may have a new [data schema micro version](https://help.liferay.com/hc/en-us/articles/360030959231-Meaningful-Schema-Versioning). Since it's only a new micro version, upgrading the module data to the new schema is optional. If you deploy the new module version, it activates but its data isn't upgraded. When you want to upgrade the module to the new data schema, you can use the `upgrade` commands in Gogo Shell.

If you deploy a module that has a new [data schema minor/major version](https://help.liferay.com/hc/en-us/articles/360030959231-Meaningful-Schema-Versioning) without upgrading its data, however, the module deactivates. Activating the new module version requires upgrading the module's data to the new data schema.

Here are the module upgrade topics:

* [Gogo Shell Command Usage](#command-usage)
* [Listing Modules Ready for Upgrades](#listing-module-ready-for-upgrade)
* [Troubleshooting Module Dependencies](#troubleshooting-module-dependencies)
* [Executing Module Upgrades](#executing-module-upgrades)
* [Checking Upgrade Status](#checking-upgrade-status)
* [Executing Verify Processes](#executing-verify-processes)

## Command Usage

Use the [Gogo Shell portlet](https://help.liferay.com/hc/en-us/articles/360029070351-Using-the-Felix-Gogo-Shell) to execute module upgrade and verification commands.

Here are the commands:

| Command | Description |
| :------ | :---------- |
| `exit` or `quit` | Exits the Gogo shell |
| `upgrade:help` | Displays upgrade commands |
| `upgrade:check` | Lists upgrades pending execution because they failed in the past or the module hasn't reached its final version |
| `upgrade:execute [module_name]` | Executes upgrades for that module |
| `upgrade:executeAll` | Executes all pending module upgrade processes |
| `upgrade:list` | Lists all registered upgrades |
| `upgrade:list [module_name]` | Lists the module's required upgrade steps |
| `upgrade:list | grep Registered` | Lists registered upgrades and their versions |
| `verify:help` | Displays verify commands |
| `verify:check [module_name]` | Lists the latest execution result for the module's verify process |
| `verify:checkAll` | Lists the latest execution results for all verify processes |
| `verify:execute [module_name]` | Executes the module's verifier |
| `verify:executeAll` | Executes all verifiers |
| `verify:list` | Lists all registered verifiers |

Next, find out each module's availability for upgrade.

## Listing Modules Ready for Upgrade

A module is ready for upgrade when its dependencies are satisfied. There are Gogo shell commands that list modules that are ready and commands that lists a module's unresolved dependencies. 

The `upgrade:list` Gogo shell command lists the modules whose upgrade dependencies are satisfied. These modules can be upgraded. 

If a module is active but not listed, its dependencies must be upgraded.

## Troubleshooting Module Dependencies

There are Gogo shell command for finding unresolved dependencies so you can fix them and get modules ready for upgrade. The Gogo shell command `scr:info [upgrade_step_class_qualified_name]` shows the upgrade step class's unsatisfied dependencies. Here's an example `scr:info`command:

```
scr:info com.liferay.journal.upgrade.JournalServiceUpgrade
```

A module's upgrade steps (classes) should be resolved in order.  Invoking
`upgrade:list [module_name]` lists all of the module's upgrade steps. For
example, executing `upgrade:list com.liferay.bookmarks.service` (for the
Bookmarks Service module), lists this:

```
Registered upgrade processes for com.liferay.bookmarks.service 1.0.0
        {fromSchemaVersionString=0.0.0, toSchemaVersionString=1.0.0, upgradeStep=com.liferay.portal.spring.extender.internal.context.ModuleApplicationContextExtender$ModuleApplicationContextExtension$1@6e9691da}
        {fromSchemaVersionString=0.0.1, toSchemaVersionString=1.0.0-step-3, upgradeStep=com.liferay.bookmarks.upgrade.v1_0_0.UpgradePortletId@5f41b7ee}
        {fromSchemaVersionString=1.0.0-step-1, toSchemaVersionString=1.0.0, upgradeStep=com.liferay.bookmarks.upgrade.v1_0_0.UpgradePortletSettings@53929b1d}
        {fromSchemaVersionString=1.0.0-step-2, toSchemaVersionString=1.0.0-step-1, upgradeStep=com.liferay.bookmarks.upgrade.v1_0_0.UpgradeLastPublishDate@3e05b7c8}
        {fromSchemaVersionString=1.0.0-step-3, toSchemaVersionString=1.0.0-step-2, upgradeStep=com.liferay.bookmarks.upgrade.v1_0_0.UpgradeClassNames@6964cb47}
```

An application's upgrade step class names typically reveal their intention. For example, the example's `com.liferay.bookmarks.upgrade.v1_0_0.UpgradePortletId` upgrade step class updates the app's portlet ID. The other example upgrade step classes update class names, the `LastPublishDate`, and `PortletSettings`. The example's step from `0.0.0` to `1.0.0` upgrades the module from an empty database.

To examine a module's upgrade process better, you can sort the listed upgrade steps mentally or in a text editor. Here's the upgrade step order for a Bookmarks Service module to be upgraded from Liferay Portal 6.2 (the module's database exists) to schema version `1.0.0`: 

* `0.0.1` to `1.0.0-step-3`
* `0.0.1-step-3` to `1.0.0-step-2`
* `0.0.1-step-2` to `1.0.0-step-1`
* `0.0.1-step-1` to `1.0.0`

The overall module upgrade process starts at version `0.0.1` and finishes at version `1.0.0`. The first step starts on the initial version (`0.0.1`) and finishes on the target version's highest step (`step-3`). The last step starts on the target version's lowest step (`step-1`) and finishes on the target version (`1.0.0`). 

Once you understand the module's upgrade process, you can execute it with confidence. 

## Executing Module Upgrades

Executing `upgrade:execute [module_name]` upgrades the module. You might run into upgrade errors that you must resolve. Executing the command again starts the upgrade from the last successful step. 

You can check upgrade status by executing `upgrade:list [module_name]`. For example, entering `upgrade:list com.liferay.iframe.web` outputs this:

```
Registered upgrade processes for com.liferay.iframe.web 0.0.1
   {fromSchemaVersionString=0.0.1, toSchemaVersionString=1.0.0, upgradeStep=com.liferay.iframe.web.upgrade.IFrameWebUpgrade$1@1537752d}
```

The first line lists the module's name and current version. The example module's current version is `0.0.1`. The `toSchemaVersionString` value is the target version. 

Executing `upgrade:list [module_name]` on the module after successfully upgrading it shows the module's name followed by the version you targeted. 

For example, if you successfully upgraded `com.liferay.iframe.web` to version `1.0.0`, executing `upgrade:list com.liferay.iframe.web` shows the module's version is `1.0.0`:

```
Registered upgrade processes for com.liferay.iframe.web 1.0.0
   {fromSchemaVersionString=0.0.1, toSchemaVersionString=1.0.0, upgradeStep=com.liferay.iframe.web.upgrade.IFrameWebUpgrade$1@1537752d}
```

For module upgrades that don't complete, you can check their status and resolve their issues. 

## Checking Upgrade Status

The command `upgrade:check` lists modules that have impending upgrades. 

For example, if module  `com.liferay.dynamic.data.mapping.service` failed in a step labeled `1.0.0-step-2`, executing `upgrade:check` shows this: 

```
Would upgrade com.liferay.dynamic.data.mapping.service from 1.0.0-step-2 to
1.0.0 and its dependent modules
```

Modules often depend on other modules to complete upgrading. Executing `scr:info [upgrade_step_class_qualified_name]` shows the upgrade step class's dependencies. You must upgrade modules on which your module depends first.

To resolve and activate a module, its upgrade must complete. The [Apache Felix Dependency Manager](http://felix.apache.org/documentation/subprojects/apache-felix-dependency-manager/tutorials/leveraging-the-shell.html) Gogo shell command `dm wtf` reveals unresolved dependencies. If your module requires a certain data schema version (e.g., its `bnd.bnd` specifies `Liferay-Require-SchemaVersion: 1.0.2`) but the module hasn't completed upgrade to that version, `dm wtf` shows that the schema version is not registered. 

```
1 missing dependencies found.
-------------------------------------
The following service(s) are missing:
 * com.liferay.portal.kernel.model.Release (&(release.bundle.symbolic.name=com.liferay.journal.service)(release.schema.version=1.0.2)) is not found in the service registry
```

The `dm wtf` command can also help detect errors in portlet definitions and custom portlet `schemaVersion` fields. 

### Checking the Release_ Table

Each module has one `Release_` table record, and the value for its `schemaVersion` field must be `1.0.0` or greater. `1.0.0` is the initial version for Liferay DXP modules, except for those that were previously traditional plugins intended for version 6.2 or earlier.

## Executing Verify Processes

Some modules have verify processes. These make sure the upgrade executed successfully. Verify processes in the core are automatically executed after upgrading Liferay DXP. You can also execute them by configuring the [`verify.*` portal properties](https://docs.liferay.com/dxp/portal/7.2-latest/propertiesdoc/portal.properties.html#Verify) and restarting your server.

To check for available verify processes, enter the Gogo shell command `verify:list`. To run a verify process, enter `verify:execute [verify_qualified_name]`.

## Related Topics

* [Liferay Commands and Standard Commands Available in Gogo Shell](https://help.liferay.com/hc/en-us/articles/360029070351-Using-the-Felix-Gogo-Shell)
