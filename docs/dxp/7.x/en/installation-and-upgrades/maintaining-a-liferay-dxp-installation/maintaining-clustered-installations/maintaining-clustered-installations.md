# Maintaining Clustered Installations

Setting up your Liferay DXP installation to function in a [cluster](../../setting-up-liferay-dxp/clustering-for-high-availability/clustering-for-high-availability.md) provides performance and scalability improvements, but also requires additional consideration to properly support and maintain. This includes deploying new and updated plugins and modules, [installing patches and fix packs](../patching-liferay/patching-liferay.md), changing configurations, and more. The Liferay DXP cluster maintenance methods outlined maximize server uptime and minimize risks for server maintenance. Liferay DXP supports using standard cluster maintenance techniques:

* [Rolling restarts](./rolling-restarts.md): Nodes are shut down and updated one at a time.
* [Blue-Green deployment](./blue-green-deployments.md): Blue-Green involves duplicating the current environment (*blue* environment), updating the duplicate (*green* environment), and cutting over users to the updated environment (green).

The techniques are compared below.

## Cluster Update Techniques

| Update | Rolling Restart | Blue-Green |
| --- | --- | --- |
| Plugin/module installation | &#10004; | &#10004; |
| Plugin/module update (backward-compatible data/schema changes) | &#10004; | &#10004; |
| Plugin/module update (non-backward-compatible data/schema changes) [1](#one) |  | &#10004; |
| Fix pack installation and removal (revertable fix pack) | &#10004; | &#10004; |
| Fix pack installation (non-revertible fix pack) |  | &#10004; |
| Cluster code changes [2](#two) |  | &#10004; |
| Portal property changes | &#10004; | &#10004; |
| System Setting changes via configuration admin files | &#10004; | &#10004; |
| Application server updates | &#10004; | &#10004; |
| JVM setting changes | &#10004; | &#10004; |
| New Java version (minor) | &#10004; | &#10004; |
| New Java version (major) |  | &#10004; |

[<a name="one">1</a>] Data and data schema changes that are not
backward-compatible include, but are not limited to these:

* Modifying data in existing columns
* Dropping columns
* Changing column types
* Changing data formats used in columns (such as changing from XML to JSON)
* Updating a Service Builder service module's data schema to a version outside of the module's required data schema range. A module's `Liferay-Require-SchemaVersion` (specified in its `bnd.bnd`) must match the module's schema version value in the `Release_` table. Installing a module with a new schema version updates the `Release_` table with that schema version and triggers a data upgrade process. If you install such a module on one node, the schema version in the `Release_` table no longer matches the `Liferay-Require-SchemaVersion` of the modules on the other nodes, and the module's Service Builder services become unavailable until the module is installed on the other nodes. Such changes cannot be reverted: the database must be restored from a backup. These schema version changes must be applied while all nodes are shut down.

[<a name="two">2</a>] Cluster communication must stay intact. For this reason, cluster code must not be updated in rolling restarts. The Customer Portal identifies DXP fix packs that contain such changes as non-revertible. Here are packages you must not change in rolling restarts:

* `com.liferay.portal.kernel.cluster`
* `com.liferay.portal.kernel.cluster.*`
* `com.liferay.portal.kernel.exception.NoSuchClusterGroupException`
* `com.liferay.portal.kernel.scheduler.multiple`
* `com.liferay.portal.kernel.scheduler.multiple.*`
* `com.liferay.portal.cache.multiple`
* `com.liferay.portal.cache.multiple.*`
* `com.liferay.portal.scheduler.multiple`
* `com.liferay.portal.scheduler.multiple.*`

## Additional Information

* [Rolling Restarts](./rolling-restarts.md)
* [Blue-Green Deployments](./blue-green-deployments.md)
* [Server Administration](./../../../system-administration/using-the-server-administration-panel/using-the-server-administration-panel.md)
