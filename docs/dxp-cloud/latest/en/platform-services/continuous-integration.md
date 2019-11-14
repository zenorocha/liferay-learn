# Continuous Integration

DXP Cloud uses [Jenkins](https://jenkins.io/) to power its continuous integration infrastructure service by default. When you send a pull request or push a commit to one of your pre-configured GitHub branches, an automatic and configurable build will be triggered.

By default, this automated build will compile code and can be configured to execute tests. DXP Cloud will build your services and show their status on your environment's Builds page. If the tests fail, you can check the Jenkins dashboard and logs at `ci-companyname-infra.lfr.cloud`.

> **Note:** Continuous integration only works if you deploy from GitHub, not the CLI.

## Additional Information

* [Logging into your DXP Cloud Services](../getting-started/logging-into-your-dxp-cloud-services.md)
* Using the Jenkinsfile
