# Patching DXP in Docker

Liferay provides [patches](../../maintaining-a-liferay-dxp-installation/patching-liferay/patching-liferay.md) that fix DXP issues and a Patching Tool for applying the patches. Fix Packs and Service Packs are provided as new DXP images (on [Docker Hub](https://hub.docker.com/r/liferay/dxp)) that you migrate to. Liferay also provides Security Fix Packs, Hotfixes, and new Patching Tool versions to install to your containers.

| Enterprise subscription

Here are the DXP container patching topics:

* [Installing a Hotfix or Security Fix Pack](#installing-a-hotfix-or-security-fix-pack)
* [Using Fix Pack and Service Pack Images](#using-fix-pack-and-service-pack-images)
* [Updating the Patching Tool](#updating-the-patching-tool)
* [Upgrading the Database for a Patch](#upgrading-the-database-for-a-patch)

## Installing a Hotfix or Security Fix Pack

Installing a Hotfix or Security Fix Pack requires a folder in your volume or bind mount that maps to the container's `/mnt/liferay/patching` folder.

```note::
   Please see `Providing Files to the Container <./providing-files-to-the-container.md>`_ for more information.
```

Here are two methods for installing these patches:

1. [Install to your existing container](#install-to-your-existing-container), if it has an existing qualified volume or bind mount that maps to the `/mnt/liferay/patching` folder.

1. [Install to a new container](#install-to-a-new-container).

### Install to Your Existing Container

Here are the steps for installing the patch to your existing container:

1. Stop your current container.

1. Copy the patch to a folder in your volume or bind mount that maps to the container's `/mnt/liferay/patching` folder.

1. Restart your container.

### Install to a New Container

Here are steps for installing the patch to a new container:

1. Create a host folder and a subfolder called `patching`.

    ```bash
    mkdir -p [host folder]/patching
    ```

1. Copy the patch file to your `[host folder]/patching` folder. For example,

   ```bash
   cp ~/[patch file] [host folder]/patching
   ```

1. Stop your current DXP container, if it's running.

1. Create a container, that includes a bind mount that maps the patch file's folder to the container's `/mnt/liferay/patching` folder. Since this example's patch file is in a folder called `patching`, you can [bind mount to the container's `/mnt/liferay` folder](./providing-files-to-the-container.md#bind-mounting-a-host-folder-to-mnt-liferay).

    ```bash
    docker run ... -v [host folder path]:/mnt/liferay liferay/dxp:[tag]
    ```

    ```note::
       Please see `Providing Files to the Container <./providing-files-to-the-container.md>`_ for more information on specifying bind mounts.
    ```

The Patching Tool installs the patch and DXP launches.

```important::
   If the Patching Tool reports this message: ``[patch file] is incompatible with Patching Tool version [x.y.z]``, install the latest Patching Tool. See `Installing the Patching Tool <#installing-the-patching-tool>`_ for details.
```

## Using Fix Pack and Service Pack Images

Using a new Fix Pack or a new Service Pack requires migrating to a container that is created from an image based on that Fix Pack or Service Pack. Here are steps for creating such a container.

1. Stop your current DXP container.

1. Back up your container's artifacts and configuration files using a source control repository or some other means.

    ```bash
    git commit -a
    ```

1. Download the Fix Pack image or Service Pack image from [Docker Hub](https://hub.docker.com/r/liferay/dxp).

    ```bash
    docker pull liferay/dxp:[tag]
    ```

1. Create a new container that is based on the Fix Pack image or Service Pack image, using qualified volumes or bind mounts to provide your artifacts and configuration files to the container.

    For example, if your files are in host folders at ...

    ```
    [host folder]
    ├───deploy
    ├───files
    ├───patching
    └───scripts
    ```

    then you can [bind mount to the container's `/mnt/liferay` folder](./providing-files-to-the-container.md#bind-mounting-a-host-folder-to-mnt-liferay).

    ```bash
    docker run ... -v [host folder path]:/mnt/liferay liferay/dxp:[tag]
    ```

DXP launches on the new Fix Pack or Service Pack.

## Updating the Patching Tool

If your current Patching Tool is incompatible with the patch you're installing, the Patching Tool reports this message: `[patch file] is incompatible with Patching Tool version [x.y.z]`.

Here are steps to install a new Patching Tool version:

1. Download the latest Patching Tool from the [Customer Portal](https://customer.liferay.com/downloads?p_p_id=com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet&_com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet_productAssetCategoryId=118191019&_com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet_fileTypeAssetCategoryId=118191066).

1. If the Patching Tool ZIP file name doesn't have this format `patching-tool-x.y.z.zip`, where `x.y.z` are the tool's major, minor, and micro version number, rename it to use that format. For example,

    ```bash
    mv patching-tool.zip patching-tool-2.0.15.zip
    ```

1. Install the Patching Tool ZIP file to the container via the container's `/mnt/liferay/patching` folder, in the same way that [Hotfixes and Security Fix Packs are installed](#installing-a-hotfix-or-security-fix-pack).

On restarting your container or running a new container, the container entry point installs the new Patching Tool.

## Upgrading the Database for a Patch

If a patch requires upgrading the database, you must upgrade it using the Database Upgrade Tool in a non-containerized environment, such as a [Liferay Tomcat Bundle installation](../installing-a-liferay-tomcat-bundle.md) or [Liferay on an Application Server](https://learn.liferay.com/dxp-7.x/installation-and-upgrades/installing-liferay/installing_liferay_on_an_application_server.html). Please see [Using the Database Upgrade Tool](../../upgrading-liferay-dxp/upgrade-basics/using-the-database-upgrade-tool.md) for more information.

After the database is upgraded, run your container that uses that database.

## Additional Information

* [Installing Apps and Other Artifacts to Containers](./installing-apps-and-other-artifacts-to-containers.md)
* [DXP Docker Container Basics](./dxp-docker-container-basics.md)
* [Providing Files to the Container](./providing-files-to-the-container.md)
* [DXP Container Lifecycle and API](./dxp-container-lifecycle-and-api.md)
* [Using the Database Upgrade Tool](../../upgrading-liferay-dxp/upgrade-basics/using-the-database-upgrade-tool.md)