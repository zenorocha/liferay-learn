# Configuring Persistent File Storage Volumes

Administrators can configure the volumes for their services in DXP Cloud depending on their deployment type (`Deployment` or `StatefulSet`). Volumes can be stored either with persistent shared storage (NFS) or with dedicated storage (SSD), depending on the deployment type. This article documents how to configure volumes via a service's `LCP.json` file. See [Understanding Deployment Types](./understanding-deployment-types.md) for more information on deplyoment types.

1. Choose the folders that contain the data to be persisted (for example `/liferay/opt/data`).
1. Navigate to the `LCP.json` file in the repository for the specific environment (for example, `lcp/liferay`).
1. Add the `volumes` configuration to the `LCP.json` file. This configuration must contain a key for each volume. For example, the following configuration contains a `data` key for `/liferay/opt/data`:

```json
{
    "id": "lfr",
    "memory": 6144,
    "cpu": 4,
    "volumes": {
        "data": "/liferay/opt/data"
    }
}
```

## Sharing Volumes Between Different Services

Volumes are shared between all instances within a single service, but only volumes in `Deployment` type services may be shared with other services in the same environment using NFS. Volumes shared in this way are persisted even if the services are deleted, because they will be stored in NFS.

To share a volume:

1. Navigate to the `LCP.json` file in the Github repository for the service (`[ProjectID]/lcp/liferay/LCP.json`).
1. Enter the following:
     * service's ID
     * location (absolute path) of the content to be shared
     * the same volume key for the different services

In the following example, `service1` and `service2` will share files from `/documents/images` using a shared volume in NFS. This way, both services can access the files within the volume via the key and declared file paths.

The first service (`service1`) shares photos from `/documents/images`:

```json
{
  "id": "service1",
  "volumes": {
    "photos": "/documents/images"
  }
}
```

The second service (`service2`) declares a volume in the same location, allowing it to share it via NFS:

```json
{
  "id": "service2",
  "volumes": {
    "photos": "/documents/images"
  }
}
```

Both services will be able to access the specified volume in NFS on the next deployment after the services are restarted.

> **Note:** To delete your service volumes, you can delete the environment that your services belong to. However, volumes for `StatefulSet` type services can be deleted by deleting the single service.

## Additional Information

* [Configuring Your Github Repository](../getting-started/configuring-your-github-repository.md)
* [Configuring via LCP.json](../reference/configuration-via-lcp-json.md)
* [Understanding Deployment Types](./understanding-deployment-types.md)
