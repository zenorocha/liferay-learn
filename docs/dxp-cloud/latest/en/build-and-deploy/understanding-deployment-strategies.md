# Understanding Deployment Strategies

The deployment strategy of a service determines how new versions will be initialized. DXP Cloud provides two deployment strategies for its services: `RollingUpdate` and `Recreate`.

## Differences Between Deployment Strategies

Users expect applications to be available all the time and developers are expected to deploy new versions of them several times a day. In DXP Cloud this is done with the **RollingUpdate** strategy. Rolling updates allow deployments to take place with zero downtime by incrementally updating instances with new ones.

Pros:
* New versions are released with maximum uptime

Cons:
* Full rollout can take time depending on the number of instances

A deployment defined with the **Recreate** strategy will terminate all the running instances before recreating them with the newer version.

Pros:
* Application state entirely renewed

Cons:
* Downtime that depends on both shutdown and boot duration of the application

In general, the `RollingUpdate` strategy is our recommended approach. The `Recreate` strategy can be used in non-production environments or very specific edge cases.

## Configuring Deployment Strategies

By default, the services in DXP Cloud are pre-configured with `RollingUpdate` in order to fit a majority of use cases. However, the deployment strategy for each service is configurable via the `strategy` variable in the service's `LCP.json`:

```json
{
    "id": "myservice",
    "strategy": "Recreate"
}
```

## Additional Information

* [Understanding Deployment Types](./understanding-deployment-types.md)