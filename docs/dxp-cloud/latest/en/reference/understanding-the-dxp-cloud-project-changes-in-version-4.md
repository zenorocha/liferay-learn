# Understanding the DXP Cloud Project Changes in Version 4

Several changes are made between version 3.x and 4.x of the DXP Cloud stack, including the structure of the repository, how `Jenkinsfiles` are used, and where Docker image versions are defined for your services.

**Contents:**

* [Changes to Docker Image Definitions](#changes-to-docker-image-definitions)
* [General Organizational Changes](#general-organizational-changes)
* [Liferay Service Changes](#liferay-service-changes)
* [Search Service Changes](#search-service-changes)
* [CI Service Changes](#ci-service-changes) 
* [Webserver Service Changes](#webserver-service-changes)
* [Backup Service Changes](#backup-service-changes)

## Changes to Docker Image Definitions

Docker images for your services in version 4.x of DXP Cloud are no longer defined in the project's `gradle.properties` file. These are now defined in the `LCP.json` for each service.

Together with the upgrade to the repository's structure, each service's Docker image version is also upgraded from a `3.x.x` version to a `4.x.x` version.

## General Organizational Changes

The biggest change to the repository is that each service's files have been moved to a folder at the root of the repository. The `lcp` folder is removed, so it is no longer in the path for any of these services. These folders themselves have been reorganized to resemble a Liferay workspace structure. <!-- TODO: Point to workspace documentation -->

Several other files previously at the root of the repository (including `gradle.properties`, `build.gradle`, and `settings.gradle`) have also been moved into the `liferay` service.

## Liferay Service Changes

The `liferay` service folder is a Liferay workspace in version 4.x. <!-- TODO: Point to workspace documentation -->

All configurations within the `liferay` service now belong in an environment-specific `configs` directory. Additionally, the `license` folder has been removed; add your licenses into the `deploy` folder instead.

See the following table for the new organization of your `liferay` service configurations:

| **Files** | **Location in 3.x** | **Location in 4.x** |
| --- | --- | --- |
| Files for deployment | lcp/liferay/deploy/{ENV}/ | liferay/configs/{ENV}/deploy/ |
| OSGi configuration files (.cfg or .config) | lcp/liferay/config/{ENV}/ | liferay/configs/{ENV}/osgi/configs/ |
| Other configuration overrides | lcp/liferay/config/{ENV}/ | liferay/configs/{ENV}/ |
| Custom shell scripts | lcp/liferay/script/{ENV}/ | liferay/configs/{ENV}/scripts/ |
| Hotfixes and patching tools | lcp/liferay/hotfix/{ENV}/ | liferay/configs/{ENV}/patching/ |
| Licenses | lcp/liferay/license/{ENV}/ | lcp/configs/{ENV}/deploy/ |

```note::
   Files within the configs/{ENV}/ directory will be copied as overrides into the LIFERAY_HOME directory in the Liferay container in DXP Cloud.
```

### Custom Script Execution

Scripts placed in `liferay/configs/{ENV}/scripts/` will now be run as the `liferay` user, rather than as a root user. If a script must be run as root, then the script must be added to the `Jenkinsfile` instead.

## Search Service Changes

All configurations within the `search` service now belong in an environment-specific `configs` directory. See the following table for the new organization of your `search` service configuration:

| **Files** | **Location in 3.x** | **Location in 4.x** |
| --- | --- | --- |
| Elasticsearch configurations | lcp/search/config/{ENV}/ | search/configs/{ENV}/config/ |
| Custom shell scripts | lcp/search/script/{ENV}/ | search/configs/{ENV}/scripts/ |
| Elasticsearch license (.json) files | lcp/search/license/{ENV}/ | search/configs/{ENV}/license/ |

```note::
   Files in search/configs/{ENV}/ will be copied as overrides into usr/shared/elasticsearch/ in the Search container in DXP Cloud. Thus, configurations in search/configs/{ENV}/config/ such as elasticsearch.yml will be copied into usr/shared/elasticsearch/config/, overriding the default.
```

### Elasticsearch Plugins

Elasticsearch plugins may be installed to your `search` service. To see the installed Elasticsearch plugins, use the shell within the `search` service and run the following command:

```bash
   bin/elasticsearch-plugin list
```

If you would like to install additional Elasticsearch plugins beyond the ones our image installs by default, you can set the `LCP_SERVICE_SEARCH_ES_PLUGINS` environment variable in your `search` service to a comma-delimited list of plugin names to be installed. They will be installed during the service's deployment.

## CI Service Changes

A default `Jenkinsfile` is no longer required in the repository, as a default pipeline is now defined. Any `Jenkinsfile` is now defined in the `ci` folder, rather than the root of the repository.

Multiple `Jenkinsfile` extension points are now available in the `ci` folder to define procedures at different stages of creating a build. <!-- TODO: Add reference to Jenkinsfile-specific article -->

## Webserver Service Changes

All configurations within the `webserver` service now belong in an environment-specific `configs` directory. Additionally, the `deploy` folder for static content has been removed; add your custom content into the `public` folder instead.

See the following table for the new organization of your `webserver` service configuration:

| **File** | **Location in 3.x** | **Location in 4.x** |
| --- | --- | --- |
| Webserver configurations | lcp/webserver/config/{ENV}/ | webserver/configs/{ENV}/conf.d/ |
| Custom scripts | lcp/webserver/script/{ENV}/ | webserver/configs/{ENV}/scripts/ |
| Static content | lcp/webserver/deploy/{ENV}/ | webserver/configs/{ENV}/public/ |

```note::
   Files in /webserver/configs/{ENV}/ will be copied as overrides into /etc/nginx/ in the Webserver container in DXP Cloud. Files in /webserver/configs/{ENV}/public/ will be copied as overrides into var/www/html/.
```

### Webserver Configuration Overrides

You can customize the root location for the `webserver` service by adding a `liferay.conf` file into `webserver/configs/{ENV}/conf.d/`. This will override the default `liferay.conf` available in the `webserver` service image's container. Access the shell in the DXP Cloud Console to see the default `liferay.conf` file as a reference when customizing the root location.

```warning::
   Do not customize the root location using a file name other than liferay.conf, so that this file overrides the default liferay.conf and avoids an error. Other file names are instead used to define additional locations for your webserver.
```

You can also override the default NGINX configuration by adding an `nginx.conf` file into `webserver/configs/{ENV}/`. You can use this to further define the webserver's behavior, overriding the default `nginx.conf` file. See the [official NGINX documentation](https://docs.nginx.com/nginx/admin-guide/basic-functionality/managing-configuration-files/) for more information.

### Configuring the Public Directory

If you wish to add custom static content, then place these files in `webserver/configs/{ENV}/public/`. DXP Cloud will look for this public folder and copy all files inside of it to `/var/www/html`.

You will need to add additional locations within your `conf.d` folder to configure the public folder. For example, to add a `.html` file (such as `index.html`) to a new `webserver/configs/{ENV}/public/static` folder, add a unique `.conf` configuration file to `webserver/configs/{ENV}/conf.d` with the following content:

```
location /static/ {
  root /var/www/html;
}
```

## Backup Service Changes

All configurations within the `backup` service now belong in an environment-specific `configs` directory. This mainly pertains to custom SQL scripts:

| **File** | **Location in 3.x** | **Location in 4.x** |
| --- | --- | --- |
| Custom SQL scripts | lcp/backup/script/{ENV}/ | backup/configs/{ENV}/scripts/ |

## Additional Information

* [Upgrading Your DXP Cloud Stack](./upgrading-your-dxp-cloud-stack.md)