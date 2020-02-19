# Understanding Deployment Types

The deployment type of a service determines many different facets of how the service functions, including performance, memory usage, and access to files or volumes. DXP Cloud provides two deployment types for its services: `Deployment` and `StatefulSet`.

## Differences Between Deployment Types

The **Deployment** type features the following:

* Network File System (NFS) is mounted onto a directory available to this service
* Network identifiers are random (e.g., `liferay-89f9f559`, `liferay-d1267401`)
* Deployment and scaling are unordered
* Automated rolling updates are unordered

Meanwhile, the **StatefulSet** type features the following:

* Service is allocated a dedicated SSD
* Network identifiers are stable and unique (e.g., `search-0`, `search-1`)
* Deployment and scaling are ordered
* Automated rolling updates are ordered

The following summarizes some distinguishing characteristics between the `Deployment` and `StatefulSet` types:

| **Type** | **Purpose** | **Resource Usage and Startup Time** | **Dedicated SSD for Local Volumes** | **Access to NFS** | **Ordered Startup / Scaling** |
| --- | --- | --- | :---: | :---: | :---: |
| **Deployment** | Stateless applications with the use of NFS | Consumes less resources and starts up faster than `StatefulSet` type | X | ✓ | X |
| **StatefulSet** | Stateful applications | Consumes more resources and starts up slower than `Deployment` type | ✓ | X | ✓ |

In general, the `Deployment` type is more lightweight and allows for faster deployments, as well as shared, persisted volumes between services (for shared files, like the document library). The `StatefulSet` type is more costly for deployments and resource usage (including the total memory and CPUs allocated for your project), but persists data through deployments and gains improved file access performance by using a dedicated SSD.

### Persisted Volumes (NFS) vs SSD Storage

The Network File System (NFS) is available to all `Deployment` type services. NFS will persist regardless of whether a service is re-deployed or even deleted. Any volumes stored outside of NFS, however, are lost upon the service being re-deployed.

The volumes stored in NFS are also available to all `Deployment` type services. NFS is used out-of-the-box for the `Liferay` and `Backup` services to share access to the document library. See [Configuring Persistent File System Volumes](./configuring-persistent-file-storage-volumes.md) for more information on configuring volumes for NFS.

`StatefulSet` type services instead have a dedicated SSD for all volume storage. The dedicated SSD available to `StatefulSet` type services is not accessible to other services. Volumes stored on the SSD will persist on re-deployment, but not after service deletion.

## How DXP Cloud's Services are Configured

The following details how the services in DXP Cloud are pre-configured out-of-the-box:

* The _Liferay_ and _Backup_ services use the **Deployment** type, so that they can share access to the document library, which is stored in  NFS.

* The _Database_ and _Web Server_ services also use the **Deployment** type, so that they can remain lightweight and start up quickly.

* The _CI_ service uses the **StatefulSet** type, so that it can take advantage of the extra file access speed from having a dedicated SSD.

* The _Search_ service also uses the **StatefulSet** type, so that it can take advantage of extra speed for searches, and so that search indices stored on the SSD are not lost if the service restarts.

## Configuring Deployment Types

By default, the services in DXP Cloud are pre-configured in order to fit a majority of use cases. However, the deployment type for each service is configurable via the `kind` variable in the service's `LCP.json`:

```json
{
    "id": "search",
    "kind": "StatefulSet"
}
```

**Note:** the deployment type of the services in DXP Cloud must only be changed with caution, as it may result in data loss or impacted performance.

## Additional Information

* [Configuring Persistent File System Volumes](./configuring-persistent-file-storage-volumes.md)