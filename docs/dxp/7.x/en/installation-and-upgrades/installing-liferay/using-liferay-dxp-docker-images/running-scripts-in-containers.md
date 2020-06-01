# Running Scripts in Containers

If there's more that you want to do in the DXP container beyond setting up Tomcat and DXP files, deploying arifacts, and applying patches, you can use scripts. The container scans for scripts in specific folders at several points in its [lifecycle](./dxp-container-lifecycle-and-api.md). The following table describes the script insertion points.

| Lifecycle Phase | Description | Target Container Folder |
| :-------------- | :---------- | :---------------------- |
| Pre-Configure | Execute scripts before the Configure Phase | `/usr/local/liferay/scripts/pre-configure` |
| Configure | Execute after copying files to `[Liferay Home]` | `/mnt/liferay/scripts` |
| Pre-Startup | Execute scripts before starting up Tomcat | `/usr/local/liferay/scripts/pre-startup` |
| Post-Shutdown | Execute scripts after shutting down Tomcat | `/usr/local/liferay/scripts/post-shutdown` |

The following sections demonstrate creating and running scripts in the above-mentioned phases.

## Running Scripts During the Configure Phase

If there are more ways that you want to configure Tomcat and DXP than what the Configure Phase offers, implement them in a Configure Phase script. Please see [DXP Container Lifecycle and API](./dxp-container-lifecycle-and-api.md#lifecycle) for details on the Configure Phase.

Here are steps for setting up Configure Phase scripts using a bind mount.

1. Create an arbitrary folder for your local configuration scripts.

    ```bash
    mkdir scripts
    ```

    ```tip::
       If you plan to `mount the container's /mnt/liferay folder <./providing-files-to-the-container.md#bind-mounting-a-host-folder-to-mnt-liferay>`_ already, you can put your Configure Phase scripts into a folder called ``scripts`` in your local mount folder to include in the Configure Phase. The ``[local-folder]/scripts`` folder would map to the container's ``/mnt/liferay/scripts`` folder.
    ```

1. Create a script(s) for executing your pre-configuration actions.

    ```bash
    echo "inside some-pre-configure.sh" > scripts/configure-phase-script.sh
    ```

1. Run a Docker container that bind mounts the script's folder to the container's `/mnt/liferay/scripts` folder.

    ```bash
    docker run -v $(pwd)/scripts:/opt/liferay/scripts ...
    ```

The entry point executes the script in the Configure Phase after copying files to `/mnt/liferay/files` and it prints this message:

```messages
[LIFERAY] Executing scripts in /mnt/liferay/scripts:

[LIFERAY] Executing configure-phase-script.sh.
in configure-phase-script.sh
```

## Running Scripts in Other Phases

The container provides ways to execute scripts outside of the Configure Phase too.

| Lifecycle Phase | Description | Target Container Folder |
| :-------------- | :---------- | :---------------------- |
| Pre-Configure | Execute scripts before the Configure Phase | `/usr/local/liferay/scripts/pre-configure` |
| Pre-Startup | Execute scripts before starting up Tomcat | `/usr/local/liferay/scripts/pre-startup` |
| Post-Shutdown | Execute scripts after shutting down Tomcat | `/usr/local/liferay/scripts/post-shutdown` |

Notice that the container's `/usr/local/liferay/scripts` folder has this structure:

```
/usr/local/liferay/scripts
├───pre-configure
├───pre-startup
└───post-shutdown
```

If you create a host folder with the same structure (see below) and populate it with your scripts, you can make your scripts available to the container by mapping your host folder to the `/usr/local/liferay/scripts` folder.

```
[host folder]
├───pre-configure
├───pre-startup
└───post-shutdown
```

Here are generic steps for creating scripts in the subfolders mentioned above:

1. Create an arbitrary parent folder for the script phase folders.

    ```bash
    mkdir [host-folder]
    ```

1. Create script phase folders.

    ```bash
    cd [host-folder]
    mkdir pre-configure pre-startup post-shutdown
    ```

1. Implement your actions in arbitrary scripts in the phase folders.

    ```bash
    echo "inside pre-configure-script.sh" > pre-configure/some-pre-configure-script.sh
    ```

    ```bash
    echo "inside pre-startup-script.sh" > pre-startup/some-pre-startup-script.sh
    ```

    ```bash
    echo "inside some-post-shutdown-script.sh" > post-shutdown/some-post-shutdown-script.sh
    ```

1. Run a Docker container that bind mounts your host folder to the container's `/usr/local/liferay/scripts/` folder.

    ```bash
    docker run -v $(pwd)/[host-folder]:/usr/local/liferay/scripts ...
    ```

The entry point executes the scripts during their respective phases and prints messages like this one:

```messages
[LIFERAY] Executing scripts in /usr/local/liferay/scripts/pre-configure:

[LIFERAY] Executing some-pre-configure-script.sh.
inside some-pre-configure-script.sh
```

## Conclusion

Now you know how to execute scripts in all parts of the container's lifecycle.

## Additional Information

* [DXP Docker Container Basics](./dxp-docker-container-basics.md)
* [DXP Container Lifecycle and API](./dxp-container-lifecycle-and-api.md)
* [Providing Files to the Container](./providing-files-to-the-container.md)