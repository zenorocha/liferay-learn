# Obtaining DXP 7.2

Before you begin, you should answer a few questions.

* Which version of DXP 7.2 will you install?
* Is your installation for development purposes or are you preparing to run in production?
* Are you installing DXP 7.2 in a clustered environment?
* Which application server do you want DXP 7.2 to run on?
* Are you installing on an existing application server?

Here you'll determine the installation that's best for you and download it.

Anyone can download DXP 7.2 from [liferay.com](https://www.liferay.com). Clicking *Resources &rarr; Community Downloads* takes you to the [Community Downloads page](https://www.liferay.com/downloads-community), where you can access Liferay Portal CE or a trial of the enterprise supported Liferay DXP. The installers are available in several different formats. The formats include a Liferay Tomcat bundle (DXP 7.2 bundled with Tomcat) as well as a DXP 7.2 `.war` (WAR) file for installing DXP 7.2 on an existing application server of choice.

Liferay enterprise subscribers can download Liferay DXP from the [Help Center](https://help.liferay.com/hc).

DXP 7.2 runs on a wide variety of application servers (Check the [Support page](https://help.liferay.com/hc/categories/360000894391-Product-Support) for a complete listing). Here are the ways to install DXP 7.2:

* [Install a Liferay Tomcat bundle](#liferay-tomcat-bundle)
    (Tomcat application server with DXP 7.2 pre-installed).

* [Install the Liferay WAR](#downloading-the-liferay-war-and-dependency-jars)
    (and supporting libraries) onto an existing application server.

## Liferay Tomcat Bundle

The Liferay Tomcat bundle includes the Tomcat application server with DXP 7.2 pre-installed. If you prefer using another application server with DXP 7.2, you must install it manually. If you don't currently have an application server preference, consider starting with the Tomcat bundle. Tomcat is one of the most lightweight and straightforward bundles to configure.

| **Note:** Application server bundles for proprietary application servers such as WebLogic or WebSphere aren't available because the licenses for these servers don't allow for redistribution. DXP 7.2's commercial offering, however, runs just as well on these application servers as it does on the others.

Bundles are released as 7-Zip (`.7z`) and gzipped (`.tar.gz`) compressed file archive formats. [Installing DXP 7.2](./installing-and-configuring-a-bundle.md) demonstrates installing DXP 7.2 from a bundle. Follow its instructions once you've prepared for installing DXP 7.2 (see the next article).

DXP 7.2 bundles might not be appropriate for you. Here are some reasons for installing the DXP 7.2 WAR manually instead of using a bundle.

* There is no DXP 7.2 bundle for the application server you want to use.
* You're installing DXP 7.2 in a clustered environment.
* You're installing to an existing application server.

## Downloading the Liferay WAR and Dependency JARs

Manual installation requires installing the DXP 7.2 WAR and dependency JARs onto the application server. These files are available to download for [DXP](https://customer.liferay.com/downloads) or [Portal CE](https://www.liferay.com/downloads-community):

* DXP 7.2 WAR file
* Dependencies ZIP file
* OSGi Dependencies ZIP file

## Next Steps

* [Optimizing the Application Server](./optimizing-the-application-server.md)
* [Preparing the Database](./preparing-the-database.md)
* [Installing and Configuring the Bundle](./installing-and-configuring-the-bundle.md)
