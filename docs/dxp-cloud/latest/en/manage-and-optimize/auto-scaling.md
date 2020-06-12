# Auto-scaling

Liferay DXP Cloud's auto-scaling feature automatically creates and destroys instances of the DXP service as needed to optimize performance. This addresses sudden changes such as increased server traffic, memory leaks, or other issues. By default, this feature is *disabled* in every DXP Cloud account.

Using this feature, a service can automatically increase (upscale) the number of Liferay DXP instances to a maximum of 10, or decrease (downscale) to the number specified in the `scale` property in [`LCP.json`](../reference/configuration-via-lcp-json.md). The `scale` property specifies the minimum number of instances to run:

```json
  "scale": 2,
```

```note::
   Auto-scaling is only available for the Liferay DXP service in production environments. For more information on how auto-scaling is charged, see `How Auto-scaling is Charged <https://help.liferay.com/hc/en-us/articles/360030843592-How-Auto-Scaling-is-charged->`_.
```

## JVM Memory Configuration

For auto-scaling to work properly, it is important to set an appropriate memory allocation for your Liferay image's JVM. This allocation is necessary to allow the memory usage to expand or contract depending on the server's load.

Set the memory allocation using the `-Xms` and `-Xmx` flags, within the `liferay` service's `LIFERAY_JAVA_OPTS` environment variable. The `-Xms` flag sets the initial memory allocation when the service starts, while the `-Xmx` flag determines the maximum memory allocation for the JVM. For example, if you have a total of 16 GB provisioned and available for this service, then you may set the property to the following:

```
-Xms4096m -Xmx12288m
```

The recommended configuration is to set the `-Xms` flag using 25% of the available memory, and to set the `-Xmx` flag using 75% of the available memory. See the following table for reference on recommended values, for different levels of memory available to your `liferay` service:

| **Available Memory** | **Recommended LIFERAY_JAVA_OPTS** |
| --- | --- |
| 8 GB | -Xms2048m -Xmx6144m |
| 16 GB | -Xms4096m -Xmx12288m |
| 24 GB | -Xms6144m -Xmx18432m |
| 32 GB | -Xms8192m -Xmx24576m |
| 64 GB | -Xms16384m -Xmx49152m |

```note::
   The ``LIFERAY_JAVA_OPTS`` variable may sometimes be used with other flags, in addition to ``-Xms`` and ``-Xmx``. If other flags are present, then update the environment variable with the memory arguments without removing the others.
```

## Managing Auto-scaling

Follow these steps to enable or disable auto-scaling in the DXP Cloud Management Console:

1. Navigate to the production environment.
1. Navigate to *Services* &rarr; *Liferay* &rarr; *Scale*.
1. If auto-scaling is disabled, click *Enable Auto Scaling* to enable it. If auto-scaling is already enabled, click *Disable Auto Scaling* to disable it.

With auto-scaling enabled, DXP Cloud monitors your service and scales it automatically according to predefined thresholds.

![Figure 1: Enable or disable auto-scaling from your service's Scale tab.](./auto-scaling/images/01.png)

## Specifying Target Average Utilization

System administrators can specify a *target average utilization*. This value is an average of memory and CPU usage across Liferay DXP services. That value threshold must be crossed before auto-scaling is triggered.

For example, if three service instances utilize 70%, 90%, and 95% of memory, respectively, then the average memory utilization is 85%. If the target average
utilization is set to 90, then no upscaling is needed; upscaling in this situation only occurs when the average memory utilization exceeds the target.

The total available memory is specified by the `memory` property in `LCP.json`, as referenced in [Configuration via LCP.json](../reference/configuration-via-lcp-json.md).

Specify the target average utilization in the `autoscale` property of the service's `LCP.json`:

```json
"autoscale": {
    "cpu": 80,
    "memory": 90
}
```

If the `autoscale` property isn't set, the target average utilization defaults to 80 for both CPU and memory utilization.

## Auto-scaling and DXP Activation Keys

An activation key is typically required to be deployed and validated in order to use Liferay DXP on premises. On DXP Cloud when Auto-scaling is enabled, the DXP Cloud team resolves any DXP Activation key issues and will add and remove activation keys on an as needed basis.
