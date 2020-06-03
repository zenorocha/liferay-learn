# Defining Environment Variables

Environment variables are a set of dynamic placeholders that can affect the way a service behaves within an environment.

There are two ways to define environment variables: via the DXP Cloud Management Console or configuring the `LCP.json` file for each service.

> **Note:** DXP Cloud will always apply the most recent changes to settings. If the latest changes are made in the LCP.json file, upon restart, the environment variables will be reflected in the web console. However, if the environment variables are changed in the web console, the container will be restarted with those new configurations.

## Defining Environment Variables via the DXP Cloud Management Console

While logged into the DXP Cloud Management Console:

1. Click _Services_ in the left menu on the environment (for example, UAT).  
1. Click the *Environment Variables* tab.
1. Enter each environment variable as a key-value pair (for example, to disable clustering):
    * **Key**: `LCP_PROJECT_LIFERAY_CLUSTER_ENABLED`
    * **Value**:  `false`
1. Click *Update Environment Variables*.

The service now restarts with the updated environment variables.

![Figure 1: Defining environment variables via the web console.](./defining-environment-variables/images/01.png)

## Defining Environment Variables via LCP.json

Environment variables can be added by configuring the `LCP.json` by using the `env` property. This example adds the environment variables `MYSQL_ROOT_PASSWORD` and `MYSQL_ROOT_USER` with the values `pass` and `example`, respectively:

```json
{
  "id": "db",
  "image": "mysql",
  "env": {
    "MYSQL_ROOT_PASSWORD": "pass",
    "MYSQL_ROOT_USER": "example"
  }
}
```

## Secret Environment Variables

Normal environment variables do not have special security measures. Any Users that can access your DXP Cloud project can also see the variables for your services.

However, to store sensitive values (such as credentials) as variables, you can use secrets instead. Secrets are encrypted in the backend, and they can be hidden from Users without the _Admin_ role. See [Secrets](./secrets.md) for more information.

## Additional Information

* [Configuration via LCP JSON](../reference/configuration-via-lcp-json.md)
* [Database Service](../platform-services/database-service.md)
* [Secrets](./secrets.md)
