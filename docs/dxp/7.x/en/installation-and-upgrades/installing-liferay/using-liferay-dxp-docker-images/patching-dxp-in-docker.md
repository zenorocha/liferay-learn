# Patching DXP in Docker

Liferay provides [patches](../../maintaining-a-liferay-dxp-installation/patching-liferay/patching-liferay.md) that fix DXP issues and a Patching Tool for applying patches. Fix Packs and Service Packs are provided as new DXP images (on [Docker Hub](https://hub.docker.com/r/liferay/dxp)) that you migrate to. Security Fix Packs, Hotfixes, and new Patching Tool versions are are downloaded and then installed to the container.

| Enterprise subscription

Here are the DXP container patching topics:

* [Installing a Hotfix or Security Fix Pack](#installing-a-hotfix-or-security-fix-pack)
* [Using Fix Packs and Service Packs](#using-fix-packes-and-service-packs)
* [Installing the Patching Tool](#installing-the-patching-tool)

## Installing a Hotfix or Security Fix Pack

Installing the patch requires a folder in your volume or bind mount that maps to the container's `/mnt/liferay/patching` folder.

```note::
   Please see `Providing Files to the Container <./providing-files-to-the-container.md>`_ for more information.
```

Here are the two methods for installing the patch:

1. Install to your existing container if it has existing qualified volume or bind mount that maps to container's `/mnt/liferay/patching` folder.

1. [Install to a new container](#install-to-a-new-container).

### Install to Your Existing Container

Here are the steps for installing the patch to your existing container:

1. Stop your current DXP container. See [Stopping DXP Containers](./dxp-docker-container-basics.md#stopping-dxp) for details.

1. Copy the patch to a folder in your volume or bind mount that maps to the container's `/mnt/liferay/patching` folder.

1. Restart the DXP container.

### Install to a New Container

Here are steps for installing the patch to a new container:

1. Create a host folder and a subfolder called `patching`.

    ```bash
    mkdir -p [host folder]/patching
    ```

1. Copy the patch file to your `[host folder]/patching` folder.

   ```bash
   cp ~/[patch file] [host folder]/patching
   ```

1. Stop your current DXP container. See [Stopping DXP Containers](./dxp-docker-container-basics.md#stopping-dxp) for details.

1. Run a new container that bind mount that maps to the container's `/mnt/liferay/patching` folder.

    Example 1 - Mounting `/mnt/liferay`:

    ```bash
    docker run ... -v [host folder path]:/mnt/liferay liferay/dxp:[tag]
    ```

    Example 2 - Mounting `/mnt/liferay/patching`:

    ```bash
    docker run ... -v [host folder path]/patching:/mnt/liferay/patching liferay/dxp:[tag]
    ```

The Patching Tool installs the patch and DXP launches.

```important::
   If the Patching Tool reports this message: ``[patch file] is incompatible with Patching Tool version [x.y.z]``, install the latest Patching Tool. See `Installing the Patching Tool <#installing-the-patching-tool>`_ for details.
```

## Using Fix Packs and Service Packs

Using a new Fix Pack or a new Service Packs requires migrating to a container that is created from that image.

<!-- TODO handle case of applying hot fix on top of new fix pack -->

1. Stop your current DXP container. See [Stopping DXP](./dxp-docker-container-basics.md#stopping-dxp) for details.

1. Back up your container's artifacts and configuration files using a source control repository or some other means.

    ```bash
    git commit -a
    ```

1. Run a new container on the Fix Pack image or Service Pack image, using qualified volumes or bind mounts to pass in your artifacts and configuration files.

    For example, if your files are in host folders at ...

    ```
    [host folder]
    ├───deploy
    ├───files
    ├───patching
    └───scripts
    ```

    then you can use a [bind mount](./providing-files-to-the-container.md) to provide the files to the new container.

    ```bash
    docker run ... -v [host folder path]:/mnt/liferay liferay/dxp:[tag]
    ```

DXP launches on the new Fix Pack or Service Pack.

## Installing the Patching Tool

If your current Patching Tool is incompatible with the patch you're installing, the Patching Tool reports this message: `[patch file] is incompatible with Patching Tool version [x.y.z]`.

Here are steps for installing a new Patching Tool version:

1. Download the latest Patching Tool from the [Customer Portal](https://customer.liferay.com/downloads?p_p_id=com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet&_com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet_productAssetCategoryId=118191019&_com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet_fileTypeAssetCategoryId=118191066).

1. Rename the Patching Tool ZIP file to `patching-tool-x.y.z.zip`, where `x.y.z` are the tool's major, minor, and micro version number.

1. Install the Patching Tool ZIP file to the container via the container's `/mnt/liferay/patching` folder, in the same way that [Hotfixes and Security Fix Packs are installed](#installing-a-hotfix-or-security-fix-pack).

On restarting your current container or running a new container, the container entry point installs the new Patching Tool.

## Additional Topics

* [Installing Apps and Other Artifacts to Containers](./installing-apps-and-other-artifacts-to-containers.md)
* [DXP Docker Container Basics](./dxp-docker-container-basics.md)
* [Providing Files to the Container](./providing-files-to-the-container.md)
* [DXP Container Lifecycle and API](./dxp-container-lifecycle-and-api.md)