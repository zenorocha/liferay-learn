# Blue-Green Deployments

Blue-green is a deployment technique in which you duplicate your production environment (the *blue* environment) and modify the duplicate (the *green* environment) with software and data changes. When you've successfully tested the green environment, you cut users over from the blue environment to the green environment. Blue-green eliminates system down time.

Data changes and data schema changes require special attention. Custom plugin/module data schema changes that break compatibility with existing code must be introduced over several releases in which the data is transitioned and maintained in old and new columns until the old columns are unnecessary.

Data and schema changes require these steps:

1. Create a new column.

1. Copy the data to the new column.

1. Maintain both columns until the old column is no longer used by any cluster nodes.

1. Delete the old column in the next release.

For more information, refer to these blue-green deployment articles:

* [BlueGreenDeployment](http://martinfowler.com/bliki/BlueGreenDeployment.html)
* [Implementing Blue-Green Deployments with AWS](https://www.thoughtworks.com/insights/blog/implementing-blue-green-deployments-aws)

## Related Topics

* [Rolling Restarts](./rolling-restarts.md)
* [Introduction to Clustering Liferay DXP](../../setting-up-liferay-dxp/configuring-clustering-for-high-availability/01-introduction-to-clustering-liferay-dxp.md)
* [Installing Patches](../installing-patches/introduction-to-installing-patches.md)
