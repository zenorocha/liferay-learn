# Setting Up Clustering in DXP Cloud

This article will outline the steps necessary to configure clustering for your Liferay DXP instance in DXP Cloud.

**Contents:**

1. [Enable the Clustering Environment Variable](#enable-the-clustering-environment-variable)
1. [Set the Clustering Scale](#set-the-clustering-scale)
1. [Add Clustering Portal Properties](#add-clustering-portal-properties)
1. [Deploy and Verify](#deploy-and-verify)

## Enable the Clustering Environment Variable

Start from the desired environment in the DXP Cloud Management Console. Then, under `Services`, navigate to `liferay`, and then click `Environment Variables`. Ensure that the `LCP_PROJECT_LIFERAY_CLUSTER_ENABLED` variable is set to `true`. This instructs the image startup process to add the clustering configuration to Liferay DXP.

![Setting LCP_PROJECT_LIFERAY_CLUSTER_ENABLED](./setting-up-clustering-in-dxp-cloud/images/01.png)

## Set the Clustering Scale

The number of nodes for your clustering environment is determined by the `scale` property within the Liferay service's `LCP.json` file (in `lcp/liferay/`). If you are deploying your Liferay service for the first time, or if the `scale` property has not yet been set in the `LCP.json` file, then you must first set the value to `1` and then [deploy the service](../build-and-deploy/overview-of-the-dxp-cloud-deployment-workflow.md#deploy).

```json
{
  "kind": "Deployment",
  "id": "liferay",
  "image": "@liferay.workspace.lcp.liferay.image@",
  "memory": 8192,
  "cpu": 8,
  "scale": 1,
}
```

Once the Liferay service has been deployed with the `scale` property set to `1`, then update this value to the desired number of nodes.

```warning::
Multiple nodes in a clustered environment may conflict with each other if there are any changes to the database schema (such as when you are installing a patch). When this happens, avoid conflicting schema issues by first changing the scale back to 1 and redeploying the Liferay service. Then, change the scale back to the correct number of nodes and redeploy the service again.
```

```note::
Increasing the number of nodes for your Liferay DXP instance may increase the number of CPU cores allocated to your project. If the increased number of CPU cores exceeds the maximum [quota](../manage-and-optimize/quotas.md) for your plan, then the deployment may fail.
```

### Auto-Scaling

Auto-scaling works together with the `scale` attribute in `LCP.json`. If auto-scaling is enabled, then the `scale` property will determine the initial number of instances. The number of instances will then increase according to demand. See [Auto-scaling](../manage-and-optimize/auto-scaling.md) for more information.

## Add Clustering Portal Properties

By default, no additional portal properties are required to enable clustering in DXP Cloud. The necessary configuration to set up clustering will already be copied to a `portal-clu.properties` and `unicast.xml` files in the Docker image when the Liferay DXP service starts up.

However, if additional portal properties for clustering are desired, the properties may still be added to the repository. You can override the clustering-specific portal properties by adding them into the `portal-clu.properties` file within the `config` folder appropriate to the chosen environment. See [Configuring the Liferay DXP Service](./configuring-the-liferay-dxp-service.md) for more about deploying configurations for the DXP service.

## Deploy and Verify

Deploy the configuration changes to the chosen environment to verify that clustering was enabled. See [Overview of the DXP Cloud Deployment Workflow](../build-and-deploy/overview-of-the-dxp-cloud-deployment-workflow.md) for more information.

To check if clustering is working correctly, check the logs of the Liferay DXP instances for the `Accepted View` message from the `JGroupsReceiver` class.

Here is an example in the logs of a successful deployment with clustering:

```shell
Aug 26 09:42:22.778 build-90 [liferay-68b8f6b48d-hdj9t] [dxp] INFO  [Incoming-2,liferay-channel-transport-0,liferay-68b8f6b48d-hdj9t-23003][JGroupsReceiver:91] Accepted view [liferay-68b8f6b48d-r8r5f-1292|8] (3) [liferay-68b8f6b48d-r8r5f-1292, liferay-68b8f6b48d-gzsg4-15389, liferay-68b8f6b48d-hdj9t-23003]
Aug 26 09:42:22.779 build-90 [liferay-68b8f6b48d-hdj9t] [dxp] INFO  [Incoming-1,liferay-channel-control,liferay-68b8f6b48d-hdj9t-17435][JGroupsReceiver:91] Accepted view [liferay-68b8f6b48d-r8r5f-29669|8] (3) [liferay-68b8f6b48d-r8r5f-29669, liferay-68b8f6b48d-gzsg4-48301, liferay-68b8f6b48d-hdj9t-17435]
```

> `Accepted view [liferay-68b8f6b48d-r8r5f-1292|8]` indicates that `liferay-68b8f6b48d-r8r5f-1292` is the master node.
>
> `(3) [liferay-68b8f6b48d-r8r5f-29669, liferay-68b8f6b48d-gzsg4-48301, liferay-68b8f6b48d-hdj9t-17435]` indicates that `(3)` nodes are part of the cluster as well as the IDs of the nodes. This list includes the master node in addition to the slave nodes.

## Additional Information

* [Auto-scaling](../manage-and-optimize/auto-scaling.md)
* [Introduction to the Liferay DXP Service](./introduction-to-the-liferay-dxp-service.md)
* [Configuring the Liferay DXP Service](./configuring-the-liferay-dxp-service.md)
