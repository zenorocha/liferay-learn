# Configuring Your GitHub Repository

Upon receiving a DXP Cloud onboarding email, you're provisioned a GitHub repository hosted in the `dxpcloud` organization. This repository should be used as a template for a team's separate private DXP Cloud development repository and is typically removed after 10 business days. Users are expected to:

1. Transfer the initial provisioned repository to their own private GitHub repository.
1. Integrate that repository with the Jenkins (CI) service in DXP Cloud using a Webhook.

## Transferring the Repository

Follow these steps to transfer the initial repository to your own GitHub repository:

1. Create a new private GitHub repository.
1. Clone your initial `dxpcloud` repository locally.
1. Push the cloned repository from step two to the remote repository you created in step one.

If you need help creating, cloning, and pushing GitHub repositories, see
[GitHub's documentation](https://help.github.com).

## Integrating with the Jenkins Service

Now you must integrate your new repository with the Jenkins service in DXP
Cloud. To do this, you must set up a webhook in GitHub that pushes to the
Jenkins service:

1. In GitHub, go to your repository's *Settings* page and select *Webhooks*.
1. Click *Add Webhook*. This opens the *Add webhook* form.
1. In the *Payload URL* field, add the domain of your DXP Cloud `infra` environment's Jenkins service. For example, the URL of the `infra` environment's `ci` service for a project named `acme` is `https://ci-acme-infra.lfr.cloud/github-webhook/`. Note that the relative path `github-webhook` is required to integrate with the Jenkins GitHub plugin.
1. In the *Content type* selector menu, select *application/json*.
1. Leave the *Secret* field blank and ensure that *Enable SSL verification* is selected.

    ![Figure 1: Specify the payload URL and content type, and enable SSL verification.](./configuring-your-github-repository/images/webhook-1.png)

1. Under *Which events would you like to trigger this webhook?*, select *Let me select individual events*. A list of events then appears.

1. Select *Pushes* and *Pull Requests* from the list of events.

    ![Figure 2: You need to select individual events for this webhook.](./configuring-your-github-repository/images/webhook-2.png)

    ![Figure 3: Select Pushes, and Pull Requests.](./configuring-your-github-repository/images/webhook-3.png)

1. Make sure *Active* is selected, then click *Add webhook*.

    ![Figure 4: Set the webhook to Active and finish creating it.](./configuring-your-github-repository/images/webhook-4.png)

### Setting Environment Variables

Lastly, you must set two environment variables in the Jenkins service's `LCP.json` to point to your new repository:

Name | Default Value | Description |
| --- | --- | --- |
| `GITHUB_REPOSITORY` |   | Point to your new GitHub repository (remote) |
| `GITHUB_TOKEN` |   | Point to a personal access token that you created for your GitHub organization. For instructions on creating and accessing this token, see [GitHub's documentation](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line). |

After updating these environment variables, deploy a new build with the changes. Any pushed branches and pull requests in your new repository should now trigger a Jenkins build.

## Verifying Builds

Pushed branches and pull requests should trigger builds that you can see or deploy from the _Builds_ tab in the DXP Cloud console. After setting up integration with the Jenkins service, a good next step to verify these builds, to ensure that the integration was successful.

### Verifying Builds from Pushed Branches

To confirm that new Git pushes are triggering Jenkins builds:

1. Make a change to the repository (like adding a file), then commit it to the branch:

    ```bash
    git commit -m "Add file to test builds"
    ```

1. Push the branch up to GitHub:

    ```bash
    git push origin branch-name
    ```

1. Navigate to the _Builds_ page in the DXP Cloud console.

1. Verify that the build displays for the pushed branch on the _Builds_ page.

### Verifying Builds from Pull Requests

To confirm that new pull requests are triggering Jenkins builds:

1. Create a pull request from the any branch to the `develop` branch.

1. Verify that a new build is created for the pull request.

1. Navigate to the _Builds_ page in the DXP Cloud console.

1. Click the links for the branch and commit in the appropriate build.

1. Verify that the links redirect to the correct GitHub pages.

## Additional Information

* [Configuring Your BitBucket Repository](./configuring-your-bitbucket-repository.md)
* [Configuring Your GitLab Repository](./configuring-your-gitlab-repository.md)