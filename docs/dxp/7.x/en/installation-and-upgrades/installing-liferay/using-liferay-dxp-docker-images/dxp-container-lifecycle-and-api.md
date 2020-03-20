# DXP Container Lifecycle and API

At a high level, the container entry point starts Tomcat with DXP deployed on it. At a lower level, the container provides an API for these use cases:

* Executing scripts
* Configuring Tomcat and DXP
* Deploying artifacts
* Installing patches
* Updating the Patching Tool

The container provides an API for triggering and configuring these use cases. It executes the use cases in different phases of its lifecycle.

Outline:

* [Lifecycle](#lifecycle)
* [API](#api)

## Lifecycle Phases

After you create a DXP container in an environment, the container entry point executes the following lifecycle phases in that environment:

1. **Pre-configure:** Runs user-provided scripts before configuring Tomcat and DXP.
1. **Configure:** Prepares for running DXP on Tomcat.
    1. Set Tomcat's Java runtime environment.
    1. Copy user-provided files to [Liferay Home](../../reference/liferay-home.md).
    1. Run user-provided scripts.
    1. Deploy user-provided artifacts.
    1. Update the Patching Tool with the user-provided version.
    1. Install user-provided patches.
1. **Pre-startup:** Runs user-provided scripts before starting Tomcat.
1. **Tomcat startup:** Launches Tomcat using the Catalina script.
1. **Post-shutdown:** Runs user-provided scripts after Tomcat stops.

All of the lifecycle phases, except Tomcat startup, act on user-provided files.

## API

The container entry point scans the following container folders for files and uses those files to configure the container, Tomcat, and DXP and act on DXP.

* `/mnt/liferay`
* `/user/local/liferay/scripts`

```note::
   You can pass files to these container folders several different ways, including using `bind mounts <https://docs.docker.com/storage/bind-mounts/>`_, `volumes <https://docs.docker.com/storage/volumes/>`_, and ``docker cp``. See `Providing Files to the Container <./providing-files-to-the-container.md>`_ for more information.
```

The key folders above have subfolders that are designated for specific actions. The subfolders, the actions taken on their files, and associated use cases are listed in lifecycle phase order in the following sections.

The following lifecycle phases act on user-provided files.

* [Pre-Configure Phase](#pre-configure-phase)
* [Configure Phase](#configure-phase)
* [Pre-Startup Phase](#pre-startup-phase)
* [Post-Shutdown Phase](#post-shutdown-phase)

### Pre-Configure Phase

| File Location | Action | Use Cases |
| :------------ | :----- | :-------- |
| `/usr/local/liferay/scripts/pre-configure` | Run scripts in alphabetical order | Running scripts in DXP containers before the Configure Phase |

### Configure Phase

| File Location | Action | Use Cases |
| :------------ | :----- | :-------- |
| `/mnt/liferay/files` | Copy files to corresponding folders under Liferay Home (`/opt/liferay`) | [Configuring DXP Containers](./configuring-dxp-containers.md)<br><br>Configuring Tomcat |
| `/mnt/liferay/scripts` | Run scripts in alphabetical order | Running scripts during configuration |
| `/mnt/liferay/deploy` | Symbolically link `/mnt/liferay/deploy` to `/opt/liferay/deploy` for auto-deploying artifacts at DXP startup.<br><br>At run time, any artifacts copied into `/mnt/liferay/deploy`, into `/opt/liferay/deploy`, or into any folder mounted to either folder are auto-deployed.<br><br>Auto-deployed artifacts are moved to appropriate folders under `/opt/liferay/osgi`. | [Installing apps and other artifacts to DXP Containers](./installing-apps-and-other-artifacts-to-containers.md) |
| `/mnt/liferay/patching` | If a Patching Tool is provided, install it. Install any patches provided. | [Patching DXP in Docker](./patching-dxp-in-docker.md) |

### Pre-Startup Phase

| File Location | Action | Use Cases |
| :------------ | :----- | :-------- |
| `/usr/local/liferay/scripts/pre-startup` | Run scripts in alphabetical order | Running scripts in DXP containers before starting Tomcat |

### Post-Shutdown Phase

| File Location | Action | Use Cases |
| :------------ | :----- | :-------- |
| `/usr/local/liferay/scripts/post-shutdown` | Run scripts in alphabetical order | Running scripts in DXP containers after shutting down Tomcat |

## What's Next

Now that you're familiar with the container lifecycle and API, you can determine the best ways to [provide files to the container](./providing-files-to-the-container.md). You can alternatively start exercising the use cases mentioned in the tables above. They're listed here for your convenience:

* [Configuring DXP Containers](./configuring-dxp-containers.md)
* [Installing Apps and Other Artifacts to Containers](./installing-apps-and-other-artifacts-to-containers.md)
* [Patching DXP in Docker](./patching-dxp-in-docker.md)