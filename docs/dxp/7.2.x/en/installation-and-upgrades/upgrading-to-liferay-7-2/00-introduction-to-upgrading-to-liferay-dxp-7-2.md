# Introduction to Upgrading to Liferay DXP 7.2

Upgrading to Liferay DXP 7.2 involves updating your data, files, plugins, and custom code, as well as optimizing and testing the upgrade to ensure it goes as quickly and smoothly as possible for your final production data upgrade. Each step's complexity scales up with the amount of data and number of customizations in your installation. Steps before and during data upgrade testing can potentially be done in parallel.

> **Note:** Dev Studio's [Upgrade Planner](https://help.liferay.com/hc/en-us/articles/360029147451-Liferay-Upgrade-Planner) walks through the upgrade process and automates parts of it. The Planner uses a terse [step listing](../08-reference/06-upgrade-planner-steps.md) you can follow or refer to throughout the upgrade process.

## Planning for the Upgrade

Before starting the upgrade process, it's important to know the biggest tasks and what tasks can be done in parallel. This facilitates planning resources for tackling such tasks.

Data upgrade is the biggest task and the articles that follow focus on other tasks that must be done in preparation.

### Adapting to Feature Changes

New DXP versions can deprecate (but keep present) features, remove features, or [move features into maintenance mode](./99-features-in-maintenance-mode.md). The [DXP 7.2 deprecation handling instructions](./98-handling-deprecations-in-liferay-dxp-7-2.md) explain the ramifications so you can adapt to the changes.

### Upgrading Custom Code and Plugins

Custom code upgrade involves adapting themes and apps you've developed to DXP 7.2. This can be as simple as updating dependencies for the new version, or it may involve major code changes. [Upgrading Code to Liferay DXP 7.2](https://help.liferay.com/hc/en-us/articles/360029316391-Introduction-to-Upgrading-Code-to-Liferay-DXP-7-2) (a separate guide) demonstrates the process. The code upgrade can be done in parallel with the data upgrade.

### Upgrading Marketplace Apps

You must also upgrade your installation's Marketplace apps (Kaleo, Calendar, Notifications, etc.) to their latest version for your current Liferay DXP installation. Troubleshoot any issues with these apps on your current DXP installation before upgrading to DXP 7.2.

### Upgrading your Database

point to the databse upgrade article

### Preparing a New Liferay DXP Server

[New DXP server setup](./05-preparing-a-new-application-server-for-liferay-dxp.md) involves installing DXP 7.2, migrating and updating your portal properties and OSGi properties, and installing any necessary patches.

### Installing Elasticsearch

If you do not already have your own Elasticsearch installation running, you must set one up for Liferay DXP. By default, Liferay DXP ships with an embedded configuration for Elasticsearch. The embedded configuration works great for demo purposes, but is not supported in production. See [Installing Elasticsearch](https://help.liferay.com/hc/en-us/articles/360028711132-Installing-Elasticsearch) for more information.

Once the major preparation tasks are identified, it's time to examine the data upgrade tasks.
