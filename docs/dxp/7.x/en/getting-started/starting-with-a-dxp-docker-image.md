# Starting with a DXP Docker Image

The latest version of Liferay DXP is available as a Docker image. Follow these steps to download, launch, and begin touring the latest release of Liferay DXP.

1. Get Liferay DXP.

    ```tip::
       Don't have Docker? Go here first: `Linux <https://docs.docker.com/install/linux/docker-ce/ubuntu/>`_ | `Windows <https://docs.docker.com/docker-for-windows/install/>`_ | `OSX <https://docs.docker.com/docker-for-mac/install/>`_
    ```

    ```bash
    docker pull liferay/portal:7.3.0-ga1
    ```

1. Start Liferay DXP

    ```bash
    docker run -it -p 8080:8080 liferay/portal:7.3.0-ga1
    ```

    ```tip::
       Wait until you see `org.apache.catalina.startup.Catalina.start Server startup in [x] milliseconds` to indicate startup completion.
    ```

1. Open your browser to `https://localhost:8080`

    ![The Liferay DXP initial landing page.](./starting-with-a-dxp-docker-image/images/01.png)

## What's Next

Continue our Getting Started walkthrough and learn about logging in for the first time using [the Admin account](./introduction-to-the-admin-account.md).

Doing more than just checking things out? See the [Installing a Liferay DXP Tomcat Bundle](../installation-and-upgrades/installing-liferay/installing-a-liferay-dxp-tomcat-bundle.md) to learn more.

Want to learn more about what you can build with Liferay DXP? Learn how to [Build Solutions on DXP](../building-solutions-on-dxp/README.md).
