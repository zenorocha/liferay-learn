# Installation Overview

A performant, resilient, and secure Liferay DXP installation has several different facets to consider. This overview covers the fundamental steps for installing Liferay DXP.

1. [Prerequisites](#prerequisites)
1. [Configuring an Application Server](#configuring-an-application-server)
1. [Connecting a Database](#connecting-a-database)
1. [Running Liferay DXP for the First Time](#running-liferay-dxp-for-the-first-time)
1. [Activating Liferay DXP](#activating-liferay-dxp)
1. [Next Steps](#next-steps)

## Prerequisites

### Java

Liferay Digital Experience Platform requires **JAVA JDK 8 or 11** in order to run. Visit [java.com](https://www.java.com/) to learn more. See [JVM Configurations](../09-reference/05-jvm-configurations.md) for specific information on how to configure the JVM for a Liferay DXP installation.

### Hosting

Liferay DXP is built with flexibility and interoperability in mind and can be run locally, in a Docker Container, or on the cloud. We recommend [DXP Cloud](https://learn.liferay.com/dxp-cloud-latest/index.html) as the best way to get a secure, performant, and scalable Liferay DXP solution up and running quickly.

## Configuring an Application Server

The best starting point for people new to installing Liferay, is the Liferay DXP Tomcat Bundle. Liferay DXP can also be manually deployed to a variety of application servers.

### Using the Tomcat Bundle

Using the Liferay Tomcat bundle is the simplest and fastest way to get started with Liferay DXP. The Liferay Tomcat bundle includes the Apache Tomcat application server with Liferay DXP pre-deployed. Follow these steps to download and unzip the Tomcat bundle:

  ```bash
    curl -L -O https://github.com/liferay/liferay-portal/releases/download/7.2.1-ga2/liferay-ce-portal-tomcat-7.2.1-ga2-20191111141448326.tar.gz
    tar -xzf liferay-ce-portal-tomcat-7.2.1-ga2-20191111141448326.tar.gz
    cd liferay-ce-portal-7.2.1-ga2/
  ```

> **Note:** The `liferay-ce-portal-7.2.1-ga2/` directory represents the [*Liferay Home*](https://help.liferay.com/hc/en-us/articles/360028712272-Liferay-Home) directory.

See [Obtaining Liferay](./03-obtaining-liferay.md) for more information about Liferay Downloads.

Once your application server is ready, see [Connecting a Database](#connecting-a-database) for next steps.

### Manually Deploying to an Application Server

Liferay DXP can be manually deployed to [Tomcat](placeholder-link), [WildFly](placeholder-link), [JBoss EAP](placeholder-link), [WebLogic](placeholder-link), or [WebSphere](./01-installing-liferay-on-an-application-server/05-installing-liferay-on-websphere.md) application servers.

Manual deployments require the use of the Liferay DXP `.war` file and other dependencies. To learn more about these files and other available Liferay DXP downloads see [Obtaining Liferay](./03-obtaining-liferay.md).

## Connecting a Database

Liferay DXP has some defaults configured out of the box to enable faster demonstration - this includes using HSQL as a database. Connecting Liferay DXP to a database is required step for using Liferay DXP beyond basic exploration. See [Connecting a Database](./04-connecting-a-database.md) for more information.

## Running Liferay DXP for the First Time

Once the JVM, application server, and database have been configured, Liferay DXP can be started for the first time. Start the application server using the start script bundled with the application server. For example, with the Tomcat bundle:

```bash
  ./liferay-ce-portal-7.2.1-ga2/tomcat-9.0.17/bin/startup.sh
```

> **Note:** By default, DXP writes log files to `[LIFERAY_HOME]/logs`.

The first time DXP starts, it creates all of its database tables. On completing startup, a web browser is launched that displays the Basic Configuration page (the Setup Wizard). If the Basic Configuration page does not appear automatically, open a browser and navigate to the application server's address and port (for example, `http://localhost:8080`).

See [Using the Setup Wizard](./05-using-the-setup-wizard.md) to learn more.

> **Note:** Experienced users may bypass the Setup Wizard entirely by configuring `setup.wizard.enabled=false` in a portal properties file (`[LIFERAY_HOME]/portal-ext.properties`).

## Activating Liferay DXP

> Subscribers Only

Enterprise Subscribers to Liferay DXP will need to [Activate Liferay DXP](placeholder-link) in order to use the product beyond the initial trial period.

## Next Steps

There are many ways to further configure and customize a Liferay DXP installation, depending on your needs. See the following topics for more information:

* [Setting up Marketplace](./09-setting-up-marketplace.md)
* Configuration Overview
* Installing and Configuring a Search Engine
* Securing Liferay DXP
* Configuring Clustering for High Availability
* Maintaining Liferay DXP
