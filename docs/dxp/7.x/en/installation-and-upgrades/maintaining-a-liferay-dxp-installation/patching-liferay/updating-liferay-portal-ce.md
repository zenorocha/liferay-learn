# Updating Liferay Portal CE

Fixes for Liferay Portal CE are delivered as new Portal CE GA releases. For example, CE 7.2 GA2 fixes bugs that exist in CE 7.2 GA1. There is no Patching Tool for Liferay Portal CE. Here are the steps for updating to your Portal CE installation to a new GA release:

1. [Back up your DXP system](../backing-up.md) in case you want to revert to it.

1. Shut down the application server.

1. Install the new Portal CE GA release to a new location or source control branch.

1. Migrate your apps, plugins and modules, and any files that you've created or customized (e.g., `portal-ext.properties`, `web.xml`, and OSGi `.config` files) to the new location/branch.

1. Clean up DXP cache.

    Delete the `[Liferay Home]/osgi/state` folder.

    ```bash
    rm -rf [Liferay Home]/osgi/state
    ```

    Empty the `[Liferay Home]/work` folder.

    ```bash
    rm -rf work/*
    ```

    Delete the application server cache. Please consult the application vendor documentation on where where to find the cache.

    ```warning::
       **Do not delete these two files:** ``patching-backup-deps.zip`` and ``patching-backup.zip``. The Patching Tool creates them in the DXP application's ``WEB-INF`` folder. The Patching Tool examines them to determine previous Fix Pack files to revert before installing a new Fix Pack.
    ```

    ```note::
       If a module's changes are only internal, the changes are invisible to the OSGi framework, the module stays installed, and the module's state persists. Clearing the OSGi bundle state information before the next DXP startup ensures that such modules reinstall with the appropriate state.
    ```

1. Start the application server again.

1. Run the `upgrade:check` [Gogo Shell command](https://help.liferay.com/hc/en-us/articles/360029070351-Using-the-Felix-Gogo-Shell) to list all modules whose data hasn't been upgraded.

1. Use [Gogo Shell commands](../../upgrading-liferay-dxp/upgrade-stability-and-performance/upgrading-modules-using-gogo-shell-commands.md) to upgrade data for these modules.

Congratulations! You've updated your Portal CE installation to the new GA release!