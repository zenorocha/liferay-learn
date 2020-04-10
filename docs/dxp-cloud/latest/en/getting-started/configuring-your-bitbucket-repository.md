# Configuring Your Bitbucket Repository

Upon receiving a DXP Cloud onboarding email, you're provisioned a GitHub repository hosted in the `dxpcloud` organization. This repository should be used as a template for a team's separate private DXP Cloud development repository and is typically removed after 10 business days. Users are expected to:

1. Transfer the initial provisioned repository to their own private Bitbucket repository.
1. Integrate that repository with the Jenkins (CI) service in DXP Cloud using a Webhook.

## Preparing the Jenkins service

Before you start, make sure that you're running the following Jenkins service or higher:

```
liferaycloud/jenkins:2.222.1-3.2.0
```

If not, then follow these steps to upgrade:

1. Update to version `liferaycloud/jenkins:2.222.1-3.2.0`
1. Delete the `Jenkinsfile` located on the root folder
1. Add the following environment variable: `LCP_CI_JENKINS_USE_DEFAULT_JENKINSFILE: true`
1. Deploy Jenkins service

> Note: if you've customized your Jenkinsfile, follow this guide to [extend the Default Jenkinsfile](../platform-services/continuous-integration.md#extending-the-default-jenkinsfile).

## Creating a Bitbucket Repository

First, you'll create a new Bitbucket repository.

1. Go to [Bitbucket](https://bitbucket.org)
1. Click the "+" icon in the sidebar under the search icon
1. Click "Repository"
1. Provide a name for the repository
1. Ensure access level is set to private
1. Set "Include a README?" to "No"
1. Click "Create repository" button

## Transferring from GitHub to Bitbucket

Follow these steps to transfer the initial GitHub repository to your own Bitbucket repository:

1. Clone your initial GitHub repository locally:

    ```
git clone git@github.com:dxpcloud/example.git
    ```

1. Add a new Git remote and point to Bitbucket:

    ```
git remote add bitbucket git@bitbucket.org:example/example.git
    ```

1. Push the cloned repository to the new remote repository:

    ```
git push bitbucket master
    ```

If you need help creating, cloning, and pushing repositories, see [Bitbucket's documentation](https://confluence.atlassian.com/bitbucket/create-a-git-repository-759857290.html).

## Generating app password for BitBucket

Now you'll create an access token that will be used by the Webhook to trigger Jenkins builds.

1. From your user settings page, under "Access Management" click "App passwords"
1. Click "Create app password" button
1. Provide a label for the app password
1. Grant the app the following permissions
    * `Pull request - read, write` (this should also flag Repositories - read, write)
    * `Webhooks -  read, write`
1. Click "Create" button
1. Copy the app password (BitBucket's equivalent of a personal access token)

## Connecting BitBucket to your Jenkins service

Lastly, you will set four environment variables in the Jenkins service's to point to your new repository:

1. Log in to console and navigate to your Jenkins service in the infra environment
1. Navigate to the "Environment Variables" tab
1. Configure the following environment variables

| Name | Value |
| ---  | ---   |
| `LCP_CI_SCM_PROVIDER` | bitbucket  |
| `LCP_CI_SCM_REPOSITORY_OWNER` | <repo_owner> |
| `LCP_CI_SCM_REPOSITORY_NAME` | <repo_name> |
| `LCP_CI_SCM_TOKEN` | <app_password> |

After updating these environment variables, the Jenkins service will restart. Any pushed branches and pull requests in your new repository should now trigger.

## Verifying builds and deployments

To confirm that new Git pushes are triggering Jenkins builds:

1. Navigate to the project builds page
1. Assert builds display for the pushes to master and develop
1. Commit a change to the repository and push it to the develop branch
1. Assert build displays for develop branch on builds page
1. Assert build is deployed onto dev environment

To confirm that new Git branches are triggering Jenkins builds:

1. Create a new branch and commit a change
1. Push the branch to BitBucket
1. Assert build displays on project builds page

To confirm that new pull requests are triggering Jenkins builds:

1. Create a pull request from the new branch to the develop branch
1. Assert a new build is created for the merge request
1. Click the pills for branch and commit
1. Assert links redirect to the correct BitBucket pages
