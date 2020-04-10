# Continuous Integration

DXP Cloud uses [Jenkins](https://jenkins.io/) to power its continuous integration infrastructure service. When you send a pull request or push a commit to one of your pre-configured GitHub branches, an automatic and configurable build will be triggered.

By default, this automated build will compile code and can be configured to execute tests. DXP Cloud will build your services and show their status on your environment's Builds page. If the tests fail, you can check the Jenkins dashboard and logs at `https://ci-companyname-infra.lfr.cloud`.

> **Note:** Continuous integration only works if you deploy from GitHub, GitLab, or Bitbucket, not the CLI.

## Using the Default Jenkinsfile

In the past, we used to give customers an entire `Jenkinsfile` for them to customize. The problem with this approach is that bug fixes, security fixes, and improvements had to be manually applied, line by line.

Starting with version `liferaycloud/jenkins:2.222.1-3.2.0`, we are introducing the concept of Default Jenkinsfile. We encapsulated all the logic that was previously stored on the Jenkinsfile and moved it to a Jenkins plugin.

This means that all bug fixes, security fixes, and improvements can be applied by us, without any requiring any user action.

Apart from that, we're providing a powerful set of extension points for you to customize every step of the pipeline.

### Enable the Default Jenkinsfile

1. Update to version `liferaycloud/jenkins:2.222.1-3.2.0`
1. Delete the `Jenkinsfile` located on the root folder
1. Add the following environment variable: `LCP_CI_USE_DEFAULT_JENKINSFILE: true`
1. Deploy Jenkins service

## Extending the Default Jenkinsfile

To extend the Default Jenkinsfile, you can add the following files to the `lcp/ci` folder:

- `Jenkinsfile-before-project-build`
- `Jenkinsfile-before-cloud-build`
- `Jenkinsfile-before-cloud-deploy`
- `Jenkinsfile-post-always`

Here is a basic overview of the steps in the CI build process:

1. Load `lcp/ci/Jenkinsfile-before-project-build`, if it exists.
1. Build the Liferay Workspace.
1. Load `lcp/ci/Jenkinsfile-before-cloud-build`, if it exists.
1. Create the DXP Cloud build that you see in console.
1. Load `lcp/ci/Jenkinsfile-before-cloud-deploy`, if it exists.
1. Optionally deploy the build to an environment in the cloud, depending on if
   the current branch has been specified as the deploy branch. This is
   configured through the `LCP_CI_DEPLOY_BRANCH` environment variable. The
   `LCP_CI_DEPLOY_TARGET` environment variable specifies which environment to deploy
   to.
1. Load `lcp/ci/Jenkinsfile-post-always`, if it exists. This will run both when the
   build fails and when it succeeds.

To see how they are used in the default pipeline, simply monitor the Jenkins service startup logs. The full default Jenkinsfile is printed out in the startup logs.

## Reusing Code Between Different Extension Points

You will likely want a way to share code between these extension points. One basic way is to load a groovy script. For example, you could create a groovy file called `lcp/ci/util.groovy` with these contents:

```
def sendSlackMessage(message) {
	println(message)
}

return this
```

Then you could insert the following in `lcp/ci/Jenkinsfile-before-cloud-build`:

```
def util = load("ci/util.groovy")

util.sendSlackMessage("About to create DXP Cloud build...")
```

## Environment Variables Reference

The following environment variables are only used in the default Jenkinsfile. To see what they do please refer to [Jenkins documentation regarding pipeline options](https://jenkins.io/doc/book/pipeline/syntax/#options).

Name                                          | Default Value   | Description |
--------------------------------------------- | --------------- | ----------- |
`LCP_CI_USE_DEFAULT_JENKINSFILE`      | `false`         | Option to enable of disable the Default Jenkinsfile |
`LCP_CI_BUILD_TIMEOUT_MINUTES`        | `30`            | Set a timeout period for the Pipeline run, after which Jenkins should abort the Pipeline  |
`LCP_CI_PRESERVE_STASHES_BUILD_COUNT` | `20`            | Preserve stashes from completed builds, for use with stage restarting |
`LCP_CI_BUILD_NUM_TO_KEEP`            | `10`            | Number of builds that will be stored |
`LCP_CI_BUILD_DAYS_TO_KEEP`           | `14`            | Number of days that builds will be stored |
`LCP_CI_ARTIFACT_NUM_TO_KEEP`         | `1`             | Number of artifacts that will be stored |
`LCP_CI_ARTIFACT_DAYS_TO_KEEP`        | `-1`            | Number of days that artifacts that will be stored |

## Additional Information

* [Logging into your DXP Cloud Services](../getting-started/logging-into-your-dxp-cloud-services.md)
* [Configuring Your GitLab Repository](../getting-started/configuring-your-gitlab-repository.md)
* [Configuring Your Bitbucket Repository](../getting-started/configuring-your-bitbucket-repository.md)
