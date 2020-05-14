# Upgrading Your DXP Cloud Project to Version 4

Upgrading your repository to use the new structure in DXP Cloud version 4 allows you to take advantage of the Liferay workspace within your repository, keep your services up to date, and use a range of other features. See the [list of new features](#new-features) to learn more.

Upgrading to the new repository structure involves downloading an [upgrade script](https://github.com/LiferayCloud/stack-upgrade/archive/release.zip) specifically for this purpose.

## Reviewing Key Changes

Review the following changes from running the script that will affect how you manage your repository:

* In the new repository structure, image versions for each service are always declared in their `LCP.json` files instead of the repository's `gradle.properties` file. All service images are automatically updated from `3.x` to `4.x` versions.

* Each service's files have been moved to a folder at the root of the repository. The `lcp` folder is removed.

* The `Jenkinsfile` is moved to the `ci` service folder. A default pipeline is now defined in the new Jenkins image version, so a default `Jenkinsfile` is no longer required.

* The `liferay` service folder is now a Liferay workspace. <!-- Point to workspace documentation? -->

* Within the Liferay workspace, configurations now belong in a `configs` subdirectory. The old `config`, `deploy`, `scripts`, and `hotfixes` folders are removed in favor of environment-specific locations within the new `configs` folder (`configs/{ENV}`, `configs/{ENV}/deploy`, configs/{ENV}/scripts`, and `configs/{ENV}/patching`, respectively).

    Note that all configurations at the root of `configs/{ENV}` override files within that environment's `LIFERAY_HOME`, in the Liferay container in DXP Cloud.

* Customizations to the search service now belong in environment-specific locations within the new `configs` subdirectory of the `search` folder. Custom shell scripts belong in `configs/{ENV}/scripts` and licenses belong in `search/configs/{ENV}/license`.
   
    Note that all configurations at the root of `configs/{ENV}` are copied to that environment's `usr/share/elasticsearch` folder, in the search container in DXP Cloud.

* Customizations to the webserver service now belong in environment-specific locations within the new `configs` subdirectory of the `webserver` folder. Static content belongs in `configs/{ENV}/public`, custom shell scripts belong in `configs/{ENV}/scripts`. Customize the root location for your webserver within a `webserver/configs/{ENV}/conf.d/liferay.conf`.

    Note that all configurations at the root of `configs/{ENV}` are copied to that environment's `etc/nginx` folder, in the webserver container in DXP Cloud.

## Running the Upgrade Script

```warning::
   Before you upgrade, make sure your repository is on a clean branch with no uncommitted files. Otherwise, these files may be deleted during the script execution.
```

Perform the following steps to upgrade:

1. Download the [upgrade script](https://github.com/LiferayCloud/stack-upgrade/archive/release.zip), and extract it into the root of your local DXP Cloud repository:

    ```bash
       curl https://github.com/LiferayCloud/stack-upgrade/archive/release.zip -O
       unzip -d /path/to/project/folder/ release.zip
    ```

1. Run the upgrade script:

    ```bash
       cd /path/to/project/folder
       ./upgrade-script.sh
    ```

1. Read the script's starting output, and enter your project's ID at the prompt:

    ```bash
       After the upgrade has run, you can completely undo and rerun it with the following commands:

	    git checkout <original-branch-name> && git reset --hard && git branch -D upgrade-workspace; ./upgrade-workspace.sh

       Press enter to continue: 
       Please enter your project id: lfrlearn
    ```

1. At the prompt, authenticate into the DXP Cloud Console.

1. Enter the number corresponding to the Liferay version to use for your services:

    ```bash
       1) 7.0
       2) 7.1
       3) 7.2
       Please select the Liferay DXP version, which will determine the Liferay CLOUD image set in liferay/LCP.json and the Liferay image set in liferay/gradle.properties: 3
    ```

1. At the prompt, enter a comma-delimited list of the environments you use for your project files (not including `common`):

    ```bash
       Please enter a comma-delimited list of the different environments in your project, apart from the "common" environment.
       For example, you can write "dev,prd". This script will only copy files from these environments and the common environment.
       Taking the webserver service as an example, if you enter "dev", files will be copied from lcp/webserver/config/dev to webserver/configs/dev/conf.d.
       However, files in lcp/webserver/config/anotherenv would be ignored and deleted.

       Please enter a comma-delimited list of environments: dev,uat,prd
    ```

    ```note::
       Only enter the names of Liferay environments that you add files to in your project repository. Do not add the infrastructure (`infra`) environment.
    ```

1. If you want to install elasticsearch plugins to all of your Liferay environments, enter a comma-delimited list of their names at the prompt. Otherwise, press enter.

The script creates and checks out a new branch in your repository, with the upgrade script added to your `.gitignore` file.

Your repository is now reorganized into a structure where the `liferay` folder is now a Liferay workspace, and you services are upgraded to 4.x services.

## Next Steps

After your local repository has changed, you may want to [deploy the new service versions](../build-and-deploy/walking-through-the-deployment-life-cycle.md) to a development environment.

<!-- You may also want to explore some of the new functionality in the new versions of your DXP Cloud services. See the following articles for more information... -->