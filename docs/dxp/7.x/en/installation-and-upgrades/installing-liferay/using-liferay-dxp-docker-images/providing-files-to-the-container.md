# Providing Files to the Container

The DXP container uses the files you provide to execute the following use cases:

* Configure DXP with `.properties` Files and `.config` files
* Configure Tomcat
* Deploy apps and other artifacts
* Update the Patching Tool
* Patch DXP
* Run scripts

You can provide files to the container in several ways, including these:

* [Bind mounts](https://docs.docker.com/storage/bind-mounts/)
* [Volumes](https://docs.docker.com/storage/volumes/)
* [Using `docker cp`](https://docs.docker.com/engine/reference/commandline/cp/)

All of the use cases, except for deploying apps and using `.config` files, require making files available on container creation using bind mounts or volumes, for example.

The use cases are triggered by files you provide to specific subfolders in the following container folders:

* `/mnt/liferay`
* `/user/local/liferay/scripts`

The [DXP Container Lifecycle and API](./dxp-container-lifecycle-and-api.md) specify the subfolders and the container's actions on files in those subfolders. Exercising use cases requires providing files to the appropriate subfolders.

Since most of the user cases are triggered by files at container creation, you must prepare your files and decide how you want to mount those files into the container's subfolders. It's helpful and necessary, in some cases, to organize your files by use case too.

Since preparing bind mounts is simpler than preparing volumes, bind mounts are demonstrated here. Also `docker cp` commands are demonstrated for deploying apps and `.config` files to running containers.

<!--

All of the use cases, except for deploying apps and using `.config` files, require making files available under these folders on container creation. This is done using bind mounts or [volumes](https://docs.docker.com/storage/).

Files must be mapped to appropriate locations under the `/mnt/liferay` and `/user/local/liferay/scripts` container folders to execute the use cases. So you must take care in organizing your files. You could use a strict approach of replicating the folder structures that the container uses, manage files in an ad-hoc manner, or use a hybrid approach.

Since preparing a bind mount is simpler than preparing a volume, bind mounts are demonstrated here. Also `docker cp` commands are demonstrated for deploying apps and `.config` files to running containers.
-->

Outline:

<!--* [Bind Mount Format](#bind-mount-format)-->
* [Organizing Files for Bind Mounting](#organizing-files-for-bind-mounting)
* [Bind Mounting `/mnt/liferay` to a Host Folder](#bind-mounting-mnt-liferay-to-a-host-folder)
* [Using `docker cp`](#copying-files-to-the-container)

## Organizing Files for Bind Mounting

The DXP container expects input files to be within these folders.

* `/mnt/liferay/deploy`
* `/mnt/liferay/files`
* `/mnt/liferay/patching`
* `/mnt/liferay/scripts`
* `/usr/local/liferay/scripts/post-shutdown`
* `/usr/local/liferay/scripts/pre-configure`
* `/usr/local/liferay/scripts/pre-startup`

Please see the [API](./dxp-container-lifecycle-and-api.md#api) for more actions and use cases associated with each folder.

The bind mount format looks like this:

```
-v [source path in host]:[destination path in container]
```

The bind mount source can be any folder path or file path in the host. The bind mount destination can be any folder path or file path in the container.

You can organize DXP container bind mounts in several different ways:

* Bind to one or both of the key folders: `/mnt/liferay` and `/usr/local/liferay/scripts`
* Bind to their subfolders
* Bind to a mix of subfolders and files

The table below shows some example bind mounts.

### Example Bind Mounts

| Example | `-v` Option Format | Benefits | Limitations |
| :------ | :----------------- | :------- | :---------- |
| Mounting to `/mnt/liferay` | `-v [host-path]:/mnt/liferay` | Centralizes the input files. | Input files must be organized in subfolders that the container expects (see the locations listed above). |
| Mounting to `/mnt/liferay` subfolders separately  | `-v [host-path]/[folder-1]:/mnt/liferay/deploy `<br><br>`-v [host-path]/[folder-2]:/mnt/liferay/files`<br><br><br>Note: `[host-path]` can be the same path or different paths. | Flexibility to use input file groups in different locations on the host. | More host file locations to manage. |
| Mounting individual files | `-v [host path]/setenv.sh:/mnt/liferay/files/tomcat/bin/setenv.sh` | Input files are clearly visible in the `docker run` command. | Lengthy docker run commands. Even more host file locations to manage. |

The most general way to provide files to the container's [configuration phase](./dxp-container-lifecycle-and-api.md#liferay-phases) is to bind mount `/mnt/liferay`.

## Bind Mounting `/mnt/liferay` to a Host Folder

If you want to centralize files for configuring DXP, patching DXP, and deploying to DXP, consider bind mounting a host folder to the container's `/mnt/liferay` folder.

1. Designate a folder on your host to serve as a base folder.

1. In the base host folder, create subfolders that correspond to all of the `/mnt/liferay` subfolders that the DXP container acts on. Please see [DXP Container Lifecycle and API](./dxp-container-lifecycle) for container folder details.

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

    For example, you could [add a `portal-ext.properties` file](./configuring-dxp-containers.md#portal-properties) to configure DXP and [add a DXP Fix Pack](./patching-dxp-in-docker.md) to install.

    Result:

    ```
    [host folder]
    ├───deploy
    ├───files/portal-ext.properties
    ├───patching/[Fix Pack file name].zip
    └───scripts
    ```

1. In your `docker run` command, specify a bind mount from the container's `/mnt/liferay` folder to the base host folder.

    ```bash
    docker run -v [host folder path]:/mnt/liferay ...
    ```

Per the [DXP Container Lifecycle](./dxp-container-lifecycle-and-api.md#liferay-phases), your new DXP container acts on the files in (and nested under) your mounted host folder and then starts Tomcat

## Using `docker cp`

If you have a new app, artifact, or `.config` file that you want to deploy to a running container, use `docker cp`. Here's an example of copying an app to the container.

```bash
docker cp ~/my-apps/some-app.lpkg [container]:/mnt/liferay/deploy
```

## Conclusion

Now you know how to provide files to the DXP container using bind mounts and `docker cp` commands. When the DXP container detects files in one of the designated folders, it triggers the appropriate use case. Please see the [DXP Container Lifecycle and API](./dxp-container-lifecycle-and-api.md) for more details. For use case details, please see these articles:

* [Configuring DXP Containers](./configuring-dxp-containers.md)
* [Installing Apps and Other Artifacts to Containers](./installing-apps-and-other-artifacts-to-containers.md)
* [Patching DXP in Docker](./patching-dxp-in-docker.md)