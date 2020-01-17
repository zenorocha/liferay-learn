# Starting With the Docker Image

The latest version of Liferay DXP is available as a Docker image. Follow these steps to download and launch the latest Docker image release of Liferay DXP.

1. Get Liferay DXP.

    > **Note:** Don't have Docker? Go here first: [Linux](https://docs.docker.com/install/linux/docker-ce/ubuntu/) | [Windows](https://docs.docker.com/docker-for-windows/install/) | [OSX](https://docs.docker.com/docker-for-mac/install/)

    ```bash
    docker pull liferay/dxp:7.2.10.1
    ```

1. Start Liferay Commerce

    ```bash
    docker run -it -p 8080:8080 liferay/dxp:7.2.10.1
    ```

    > **Note:** Wait until you see `org.apache.catalina.startup.Catalina.start Server startup in [x] milliseconds`

1. Open your browser to `https://localhost:8080`

    > **Note:** Your browser may automatically launch to this URL once the server has completed startup.

## What's Next

Continue our Getting Started walkthrough and learn about the [Setup Wizard](./using-the-setup-wizard.md).

Doing more than just checking things out? See the [Advanced Installation Overview](../advanced-installation-and-upgrades/01-installing-liferay-dxp/02-installation-overview.md) to learn more.

Want to learn more about what you can build with Liferay DXP? Learn how to [Build Solutions on DXP](../building-solutions-on-dxp/README.md).
