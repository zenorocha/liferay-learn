# Configuring Your GitLab Repository

Upon receiving a DXP Cloud onboarding email, you're provisioned a GitHub repository hosted in the `dxpcloud` organization. This repository should be used as a template for a team's separate private DXP Cloud development repository and is typically removed after 10 business days. Users are expected to:

1. Transfer the initial provisioned repository to their own private GitLab repository.
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

## Creating a GitLab Repository

First, you'll create a new GitLab repository.

1. Go to [GitLab](https://gitlab.com)
1. Click "New project" button
1. Provide a project slug (the repository name in the url)
1. Configure visibility level to private (free users have unlimited private repositories)
1. Ensure "Initialize repository with a README" is unchecked
1. Click "Create project" button

## Transferring from GitHub to GitLab

Follow these steps to transfer the initial GitHub repository to your own GitLab repository:

1. Clone your initial GitHub repository locally:

    ```git clone git@github.com:dxpcloud/example.git```

1. Add a new Git remote and point to GitLab:

    ```git remote add gitlab git@gitlab.com:example/example.git```

1. Push the cloned repository to the new remote repository:

    ```git push gitlab master```

If you need help creating, cloning, and pushing repositories, see [GitLab's documentation](https://docs.gitlab.com/ee/gitlab-basics/start-using-git.html).

## Generating access tokens for GitLab

Now you'll create an access token that will be used by the Webhook to trigger Jenkins builds.

1. Navigate to [this page](https://gitlab.com/profile/personal_access_tokens)
1. Provide a name and an expiration date for this access token
1. Configure the access token to have the following permissions:
    * api
    * read_repository
    * write_repository
1. Click "Create personal access token" button
1. Copy your access token and save it somewhere (you won't see it again otherwise)

## Connecting GitLab to your Jenkins service

Lastly, you will set four environment variables in the Jenkins service's to point to your new repository:

1. Log in to console and navigate to your Jenkins service in the infra environment
1. Navigate to the "Environment Variables" tab
1. Configure the following environment variables

| Name | Value |
| ---  | ---   |
| `LCP_CI_SCM_PROVIDER` | gitlab  |
| `LCP_CI_SCM_REPOSITORY_OWNER` | <repo_owner> |
| `LCP_CI_SCM_REPOSITORY_NAME` | <repo_name> |
| `LCP_CI_SCM_TOKEN` | <access_token> |

After updating these environment variables, the Jenkins service will restart. Any pushed branches and pull requests in your new repository should now trigger.

## Additional GitLab webhook configurations

Liferay DXP Cloud's Jenkins service automatically creates a webhook for your selected git SCM provider; however, it only creates the default one, and GitLab's default webhook needs some additional configurations to match the functionality of GitHub and BitBucket's webhooks.

1. Navigate to your GitLab repository
1. Go to "Settings" and select "Webhooks"
1. Under "Project Hooks", verify that the created webhook is listed
1. Click "Edit" button for the CI webhook
1. Uncheck "Tags push events" and "Comments"
1. Check "Enable SSL verification"
1. Click "Save changes" button

## Verifying builds and deployments

To confirm that new Git pushes are triggering Jenkins builds:

1. Navigate to the project builds page
1. Assert builds display for the pushes to master and develop
1. Commit a change to the repository and push it to the develop branch
1. Assert build displays for develop branch on builds page
1. Assert build is deployed onto dev environment

To confirm that new Git branches are triggering Jenkins builds:

1. Create a new branch and commit a change
1. Push the branch to GitLab
1. Assert build displays on project builds page

To confirm that new pull requests are triggering Jenkins builds:

1. Create a pull request from the new branch to the develop branch
1. Assert a new build is created for the merge request
1. Click the pills for branch and commit
1. Assert links redirect to the correct GitLab pages
