# Installing a Liferay-Tomcat Bundle

The Tomcat Bundle includes the Apache Tomcat application server with Liferay DXP pre-deployed. It's the easiest, fastest way to install Liferay DXP on premises.

```note::
   If you're using one of the following application servers already, click the name of the one you're using to see instructions for deploying DXP to it: `Tomcat <./installing-liferay-on-an-application-server/installing-dxp-on-tomcat.md>`_, WildFly, JBoss EAP, `WebLogic <./installing-liferay-on-an-application-server/installing-dxp-on-weblogic.md>`_, or `WebSphere <./installing-liferay-on-an-application-server/installing-on-websphere.md>`_.
```

```note::
   To start a Liferay DXP instance fast for touring or demonstration purposes, see `Starting With a Docker Image <../../getting-started/starting-with-a-docker-image.md>`_.
```

## Prerequisites

Liferay DXP requires a **Java JDK 8 or 11**. See [www.java.com](https://www.java.com/) to install a JDK.

## Download DXP

1. Go to the [Help Center](https://help.liferay.com/hc) (subscription) or [Community Downloads](https://www.liferay.com/downloads-community).

2. Navigate to the Liferay DXP version you want.

3. Download a Tomcat Bundle:

| File | Description |
| :--- | :---------- |
| Tomcat Bundle (`.tar.gz`) | GZipped bundle archive that installs on any OS |
| Tomcat Bundle (`.7z`) | 7-Zipped bundle archive that installs on any OS |

## Install DXP

Extract the bundle to a location on your DXP host. This location is called your [Liferay Home](../reference/liferay-home.md).

Congratulations! You've installed Liferay DXP. It's time to configure a database for it.

## Next Steps

* [Configuring a Database](./configuring-a-database.md)
