# Quick Start Guide

Follow these steps to download the latest release of Liferay Commerce and get started.

## Let's Go

1. Get Liferay Commerce

    >_Don't have Docker_? Go here first: [Linux](https://docs.docker.com/install/linux/docker-ce/ubuntu/) | [Windows](https://docs.docker.com/docker-for-windows/install/) | [OSX](https://docs.docker.com/docker-for-mac/install/)

    ```bash
    docker pull liferay/commerce:2.0.5
    ```

1. Start Liferay Commerce

    ```bash
    docker run -it -p 8080:8080 liferay/commerce:2.0.5
    ```

    > Wait until you see `org.apache.catalina.startup.Catalina.start Server startup in [x] milliseconds`

1. Open your browser to `https://localhost:8080`

## What's Next

Doing more than just checking things out? Learn more about [Installation and Upgrades](../../installation-and-upgrades/README.md).

Want to get a store up and running in minutes? Learn about [Accelerators](../../starting-a-store/accelerators.md).
