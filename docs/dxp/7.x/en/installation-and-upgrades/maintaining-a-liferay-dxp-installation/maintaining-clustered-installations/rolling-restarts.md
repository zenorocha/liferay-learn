# Performing Rolling Restarts

The rolling restart cluster maintenance process involves shutting down and updating nodes one at a time (while the other nodes are running) until they're all updated. This method maximizes uptime while you update your cluster. Rolling restarts can be used in container and image based environments.

Here are the rolling restart steps:

1. Shut down one cluster node (JVM instance).

2. Update/modify the deployment for that node (see the maintenance scenarios that follow).

3. Start the node.

4. Repeat these steps for all other cluster nodes.

    ```note::
      Maintenance scenarios vary in how they behave in rolling restarts. For example, UI changes in a plugin update are only visible on the updated nodes. Users on nodes that haven't been updated don't see the UI changes. Maintenance scenarios might have specific cases that cannot be performed in rolling restarts --- the scenario descriptions mention these cases.
    ```

The maintenance scenarios eligible for rolling restart are described below.

## New Modules and Plugins

For a new plugin or module (one that does not already exist in the cluster) to be eligible for rolling restart it must not modify data, or delete or rename database columns in a way that breaks compatibility with existing plugins or modules.

## Updating Existing Modules and Plugins

For a new version of an existing plugin or module to be eligible for rolling restart, it must not modify data or delete or rename database columns in a way that breaks compatibility with the existing version of the plugin or module.

## Applying Fix Packs

> Subscription

The Customer Portal identifies [fix packs](../installing-patches/introduction-to-installing-patches.md) that are not revertible, and therefore ineligible for rolling restart. All other fix packs are eligible.

## Reverting Fix Packs

> Subscription

Revertible fix packs can be removed in rolling restarts.

## Portal Properties controlled by portal-ext.properties

[Portal Properties](../../reference/portal-properties.md) file changes can be applied in rolling restarts.

## System Settings controlled by Configuration Admin Files

[System configuration](../../reference/system-properties.md) files can be applied in rolling restarts.

## Application Server or JVM setting modifications

Modifications to application server and JVM settings can be done in rolling restarts.

## Java Version Updates

Minor version updates of Java can be applied in rolling restarts. Major version updates are not supported in rolling restarts, and should instead be done when all cluster nodes are shut down.

All rolling restart eligible updates can be applied using the rolling restart steps listed earlier. Other updates must be done differently as described next.

## Related Topics

* [Blue Green Deployment](./blue-green-deployments.md)
* [Introduction to Clustering Liferay DXP](../../setting-up-liferay-dxp/configuring-clustering-for-high-availability/01-introduction-to-clustering-liferay-dxp.md)
* [Installing Patches](../installing-patches/introduction-to-installing-patches.md)
