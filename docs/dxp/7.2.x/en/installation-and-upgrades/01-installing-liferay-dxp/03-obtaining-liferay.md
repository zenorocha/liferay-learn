# Obtaining Liferay DXP

There are several options for downloading and installing Liferay DXP.

## Tomcat Bundle

The best starting point for _most_ people is the Liferay DXP Tomcat Bundle. Using the Liferay Tomcat bundle is the simplest and fastest way to get started with Liferay DXP. The Liferay Tomcat bundle includes the Apache Tomcat application server with DXP pre-deployed.

## Docker Image

A Docker image may also be used to get started quickly on Liferay DXP. Docker images may be obtained from [Docker Hub](https://hub.docker.com/u/liferay).

## WAR and Dependency JARs

A `.war` file is also provided that can be deployed to any [supported application server](https://help.liferay.com/hc/categories/360000894391-Product-Support) along with the supporting dependency JARs. This method of installation requires a user to install DXP by deploying the Liferay DXP `.war` and dependencies to an application server.

* DXP 7.2 WAR file
* Dependencies ZIP file
* OSGi Dependencies ZIP file

## Downloads

Users may visit the [Community Downloads page](https://www.liferay.com/downloads-community) to review available Liferay DXP downloads. Liferay Enterprise Subscribers can download Liferay DXP and related resources from [Help Center](https://help.liferay.com/hc).

The following downloads are available:

|File|Description|
|---|---|
| Client | Contains third party dependencies  |
| Dependencies | Contains portal dependency `.jar` files |
| Docs | Contains available Javadocs, DTDs, Taglib docs, and Properties documentation  |
| OSGi (`zip`) | Contains all Liferay DXP OSGi modules required for a complete installation |
| Source | Contains the Liferay DXP source code |
| SQL | Contains Liferay DXP SQL scripts that can be used to prepare a supported database for use with Liferay DXP |
| Tools | Contains the Liferay Upgrade Client tool |
| Tomcat Bundle (`tar.gz`) | `tar.gz` archive format suitable for installation on any OS |
| Tomcat Bundle (`7zip`) | `.7ip` archive format suitable for installation on any OS |
| Liferay `.war` | Used to deploy Liferay DXP to any supported application server |

## Next Steps

* [Installation Overview](./02-installation-overview.md)
* [Connecting a Database](./04-connecting-a-database.md)
* [Using the Setup Wizard](./05-using-the-setup-wizard.md)
