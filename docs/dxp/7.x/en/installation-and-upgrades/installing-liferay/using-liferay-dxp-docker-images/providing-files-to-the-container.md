# Providing Files to the Container

The DXP container uses the files you provide to execute the following use cases:

* Configure DXP with `.properties` Files and `.config` files
* Configure Tomcat
* Deploy apps and other artifacts
* Update the Patching Tool
* Patch DXP
* Run scripts

All of the use cases can be triggered on container creation when the container finds files in specific folders within these key container folders:

* `/mnt/liferay`
* `/user/local/liferay/scripts`

The [DXP Container Lifecycle and API](./dxp-container-lifecycle-and-api.md) specifies the scanned subfolders, the phases in which the container scans them, and the actions taken on their files.

You can provide files to the container in several ways, including these:

* [Bind mounts](https://docs.docker.com/storage/bind-mounts/)
* [Volumes](https://docs.docker.com/storage/volumes/)
* [Using `docker cp`](https://docs.docker.com/engine/reference/commandline/cp/)

All of the use cases, except for deploying artifacts and using `.config` files, require making files available on container creation. Bind mounts and volumes accomplish this. Deploying artifacts and applying `.config` files can be accomplished on container creation using bind mounts and volumes, or at run time using `docker cp`.

Bind mounts are used in the examples here as they are simpler than volumes for providing files. As you prepare files for mounting to a container, it's helpful to organize them in a way that's easiest for you to manage. Bind mounting to DXP containers, organizing files, and using `docker cp` are covered here.

Outline:

* [Bind Mount Format](#bind-mount-format)
* [Scanned Container Folders](#scanned-container-folders)
* [Organizing Files for Bind Mounting](#organizing-files-for-bind-mounting)
* [Bind Mounting a Host Folder to `/mnt/liferay`](#bind-mounting-a-host-folder-to-mnt-liferay)
* [Using `docker cp`](#copying-files-to-the-container)

## Bind Mount Format

You can specify any number of bind mounts to a `docker run` command. Each bind mount follows this format:

```
-v [source path in host]:[destination path in container]
```

The bind mount source can be any folder path or file path in the host. The bind mount destination can be any folder path or file path in the container.

## Scanned Container Folders

The container scans these folders.

* `/mnt/liferay/deploy`
* `/mnt/liferay/files` (all files and subfolders are scanned)
* `/mnt/liferay/patching`
* `/mnt/liferay/scripts`
* `/usr/local/liferay/scripts/post-shutdown`
* `/usr/local/liferay/scripts/pre-configure`
* `/usr/local/liferay/scripts/pre-startup`

Please see the [API](./dxp-container-lifecycle-and-api.md#api) for the actions and use cases associated with each folder.

## Organizing Files for Bind Mounting

You can organize DXP container bind mounts in several different ways:

* Bind to one or both of the key folders: `/mnt/liferay` and `/usr/local/liferay/scripts`
* Bind to their subfolders
* Bind to a mix of subfolders and files

The table below shows some example bind mounts and some pros and cons of using them.

### Example Bind Mounts

| Example | Pros | Cons |
| :------ | :------- | :---------- |
| Mounting to `/mnt/liferay`:<br><br>`-v [host-path]:/mnt/liferay` | Centralizes the input files. | Input files must be organized in subfolders that the container expects (see the locations listed above). |
| Mounting to `/mnt/liferay` subfolders separately:<br><br>`-v [host-path]/[folder-1]:/mnt/liferay/deploy -v [host-path]/[folder-2]:/mnt/liferay/files`<br><br><br>Note: `[host-path]` can be the same path or different paths. | Flexibility to use input file groups in different locations on the host. | More host file locations to manage. |
| Mounting individual files:<br><br>`-v [host path]/setenv.sh:/mnt/liferay/files/tomcat/bin/setenv.sh` | Input files are clearly visible in the `docker run` command. | Lengthy docker run commands. Even more host file locations to manage. |

The most general way to provide files to the container's [configuration phase](./dxp-container-lifecycle-and-api.md#lifecycle) is to bind mount a host folder to the container's `/mnt/liferay` folder.

## Bind Mounting a Host Folder to `/mnt/liferay`

If you want to centralize files for configuring, patching, and deploying to DXP, consider bind mounting a host folder to the container's `/mnt/liferay` folder.

```note::
   Most of the examples in the use case articles use this bind mount strategy.
```

Hre are the steps:

1. Designate a folder on your host to serve as a base folder.

1. In the base host folder, create subfolders that correspond to all of the `/mnt/liferay` subfolders that the container acts on. Please see [DXP Container Lifecycle and API](./dxp-container-lifecycle) for container folder details.

    ```bash
    cd [host folder]
    mkdir deploy files patching scripts
    ```

    Result:

    ```
    [host folder]
    ├───deploy
    ├───files
    ├───patching
    └───scripts
    ```

    ```note::
       You don't have to create all of the subfolders, just the ones you're populating.
    ```
1. Populate the subfolders with files for the container to act on.

    For example, you could [add a `portal-ext.properties` file](./configuring-dxp-containers.md#portal-properties) to configure DXP and [add a Security Fix Pack](./patching-dxp-in-docker.md) to install.

    Result:

    ```
    [host folder]
    ├───deploy
    ├───files/portal-ext.properties
    ├───patching/[Security Fix Pack file name].zip
    └───scripts
    ```

1. In your `docker run` command, bind mount your base host folder to the container's `/mnt/liferay` folder.

    ```bash
    docker run -v [host folder path]:/mnt/liferay ...
    ```

Per the [DXP Container Lifecycle](./dxp-container-lifecycle-and-api.md#liferay-phases), your new container acts on the files in (and nested under) your mounted host folder and then starts Tomcat

## Using `docker cp`

If you have a new app, artifact, or `.config` file that you want to deploy to a running container, use `docker cp`. Here's an example of copying an app to the container:

```bash
docker cp ~/my-apps/some-app.lpkg [container]:/mnt/liferay/deploy
```

Note, applying a `.config` file requires copying it to the container's `/mnt/liferay/files/osgi/configs` folder.

## Conclusion

Now you know how to provide files to the container using bind mounts and `docker cp` commands. Please see the [DXP Container Lifecycle and API](./dxp-container-lifecycle-and-api.md) for more details. For use case details, please see these articles:

* [Configuring DXP Containers](./configuring-dxp-containers.md)
* [Installing Apps and Other Artifacts to Containers](./installing-apps-and-other-artifacts-to-containers.md)
* [Patching DXP in Docker](./patching-dxp-in-docker.md)