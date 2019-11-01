# Introduction to the Liferay DXP Service

The Liferay DXP service is the heartbeat of any project. It runs the application's Liferay DXP instance and interacts with other services like the web server, Elasticsearch, and MySQL database.

![Figure 1: The Liferay DXP service is one of several services available in DXP Cloud.](./introduction-to-the-liferay-dxp-service/images/01.png)

The Liferay DXP service in DXP Cloud can be used in many of the same ways as an on-premise instance of Liferay DXP. However, there are also several differences in configuration and development workflow when working with an instance in DXP Cloud.

* [Choosing a Version](#choosing-a-version)
* [Deployment (Customization, Patching, and Licensing)](#deployment-customization-patching-and-licensing)
* [Configuration](#configuration)
* [Hot Deploy](#hot-deploy)
* [Enabling Clustering](#enabling-clustering)
* [Environment Variables](#environment-variables-reference)
* [Running Scripts](#running-scripts)

## Choosing a Version

The version of Liferay DXP that you are using is configured within the `gradle.properties` file at the root of your Git repository.

```properties
liferay.workspace.lcp.liferay.image=liferaycloud/liferay-dxp:7.2.10-ga1-3.0.10
```

This version includes the specific service pack and fix pack that your Liferay DXP instance will be based on.

You can check the [Services Changelog](https://help.liferay.com/hc/en-us/sections/360006251311-Services-Changelog) for DXP Cloud to see a reference for each new release. Each new Service update includes Docker images that you can use for your instance.

Use the new version from the release notes to update the `liferay.workspace.lcp.liferay.image` property value. The new Docker image will be used when your instance starts up or the next time you deploy the Liferay service from your repository. You can also use the Docker images for new releases to upgrade the properties for your other services.

> **Note:** if any `LCP.json` files in your repository directly reference the Docker image for a version of Liferay, then these will need to be updated as well when upgrading to a new Docker image.

## Deployment (Customization, Patching, and Licensing)

Deploying custom additions to Liferay DXP involves adding the new module, license, or hotfix to the appropriate locations in the Git repository.

With the exception of the `common/` directory, changes added to a given service's environment folder (e.g., `dev`, `uat`, `prod`) will _only_ be propagated when deploying to the corresponding environment. Changes added to the `common/` directory will _always_ be deployed, regardless of the target deployment environment. This applies to the `config`, `deploy`, `hotfix`, `license`, and `script` directories within `lcp/liferay/`.

See [Overview of the Deployment Workflow](../getting-started/overview-of-the-dxp-cloud-deployment-workflow.md) for more information on how the deployment workflow. For a tutorial on deploying to DXP Cloud see, [Walking Through the Deployment Life Cycle](../build-and-deploy/walking-through-the-deployment-life-cycle.md).

### Themes, Portlets, and OSGi Modules

To install themes, portlets, or OSGi modules, include a WAR or JAR file in one of the folders in `/deploy` in your Liferay DXP service directory.

For example, to deploy a custom JAR file to your development environment (using the `/dev` folder), your Liferay DXP service directory could look like this:

	lcp
    └── liferay
    	├── deploy
    	│   └── dev
    	│       └── com.liferay.apio.samples.portlet-1.0.0.jar
    	└── LCP.json

### Source Code

The source code for new additions can also be included in a CI build. When the build starts, it will automatically compile the source code. Then, behind the scenes, the build will copy the results to the correct `deploy` folder.

A CI build will compile source code within these folders:

* The `modules` folder for new modules
* The `themes` folder for custom themes
* The `wars` folder for exploded WARs

> **Note:** source code will only be included in a deployment if it is deployed from a build in CI.

### Hotfixes

To apply hotfixes, add the hotfix ZIP file to one of the folders in `hotfix/` within the Liferay DXP service directory. When you deploy this change, the hotfix is applied to the Liferay DXP instance.

For example, you can deploy a hotfix to your development environment with a structure like the following:

	lcp
    └── liferay
    	├── hotfix
    	│   └── dev
    	│       └── liferay-hotfix-2-7110.zip
    	└── LCP.json

Note that hotfixes will each need to be re-applied each time the server starts up. For this reason, updating to the latest Fix Pack or Service pack of the Liferay DXP Docker image in your `gradle.properties` file is better than adding many hotfixes into this folder for the long term; you can update the Docker version by replacing the `liferay.workspace.lcp.liferay.image` property in this file. The `gradle.properties` file can be found at the root of the repository.

### Licenses

You can add your own license by putting it into one of the folders in `license/` within the Liferay DXP service directory.

For example, you can add licenses to your development environment with a structure like this in your Liferay DXP service directory:

	lcp
    └── liferay
    	├── license
    	│   └── dev
    	│       └── license.xml
    	│       └── license.aatf
    	└── LCP.json

Behind the scenes, XML licenses are copied to `$LIFERAY_HOME/deploy`, and AATF licenses are copied to `$LIFERAY_HOME/data`.

## Configuration

Applying configurations to the Liferay service, like `portal.properties` changes, requires adding them to the Git repository and pushing the changes to Git. For more information on adding these configuration files, see [Configuring the Liferay DXP Service](./configuring-the-liferay-dxp-service.md).

## Hot Deploy

Hot deploy can be done via the Liferay DXP UI. To do so, navigate to the Control Panel → Apps → App Manager. Then, click the dots in the upper-right corner, and click "Upload." From this screen, you can choose a file from your local file system to deploy and install.

> **Note:** using hot deploy in DXP Cloud is _not_ recommended because any customizations deployed with this method will be lost upon a subsequent DXP service deployment.

## Enabling Clustering

Clustering Liferay DXP in DXP Cloud is a very simplified process compared to doing so in Liferay DXP. Support for clustering is available and enabled out-of-the-box in DXP Cloud. Additional configurations for clustering behavior and scale does require a few extra steps. See [Setting Up Clustering in DXP Cloud](./setting-up-clustering-in-dxp-cloud.md) for more information.

## Running Scripts

Any `.sh` files found in the `script` folder are automatically run prior to starting the service. Scripts may be used for more extensive customizations. However, use caution when doing so. This is the most powerful way to customize Liferay DXP and it can cause undesired side effects.

For example, to include a script that removes all log files, place it in the following directory structure within the project's Git repository:

    lcp
    └──liferay
        ├── script
        │   └── dev
        │       └── remove-log-files.sh
        └── LCP.json

## Environment Variables Reference

Name                                  | Default Value | Description  |
------------------------------------- | ------------- | ------------ |
`LCP_PROJECT_LIFERAY_CLUSTER_ENABLED` | `true` | Whether to enable clustering and communication between nodes. |
`LCP_PROJECT_MONITOR_DYNATRACE_TENANT` |  | A string with eight characters. It's part of the URL (prefix) of your Dynatrace SaaS account. |
`LCP_PROJECT_MONITOR_DYNATRACE_TOKEN` |  | A string with 22 characters that you can find in your Dynatrace account at *Deploy Dynatrace* &rarr; *Start installation* &rarr; *Set up PaaS monitoring* &rarr; *Installer Download*. |
`LIFERAY_JAVA_OPTS` | | JVM options that will be appended to `CATALINA_OPTS` to override the default recommended options. |

## Additional Information

* [Logging Into Your DXP Cloud Services](../getting-started/logging-into-your-dxp-cloud-services.md)
* [Configuring the Liferay DXP Service](./configuring-the-liferay-dxp-service.md)
* [Walking through the Deployment Life Cycle](../build-and-deploy/walking-through-the-deployment-life-cycle.md)
