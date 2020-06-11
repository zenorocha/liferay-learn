# Activating Liferay Commerce Enterprise

> **Subscribers**

Liferay Commerce Enterprise is built on Liferay DXP and requires activation in order to fully function.

## Deploying an Activation Key

The activation key is an `XML` file which is copied to the `{liferay.home}\deploy` directory of the Commerce Enterprise installation. To acquire and deploy an activation key follow these steps:

1. [Purchase or add to an existing subscription](https://www.liferay.com/contact-sales) Liferay Commerce Enterprise.
1. Open a [Help Center](https://liferay-support.zendesk.com/agent/) ticket and request a Liferay Commerce activation key.
1. The Liferay Provisioning Team will provide an activation key download.
1. Deploy the activation key to the [`${liferay.home}/deploy`](https://learn.liferay.com/dxp/7.x/en/installation-and-upgrades/reference/liferay-home.html) folder.
1. Verify that a similar activation success message appears in the console:

```
INFO  [fileinstall-C:/Users/Liferay/liferay-commerce-enterprise-2.0.6/osgi/modules][LicenseManager:?] Liferay Commerce license validation passed
INFO  [fileinstall-C:/Users/Liferay/liferay-commerce-enterprise-2.0.6/osgi/modules][LicenseManager:?] License registered for Liferay Commerce
```

Liferay Commerce Enterprise is now ready to be used.

## Updating an Activation Key

Activation keys expire after a set duration based on the terms of a user's subscription. In order to reactivate Liferay Commerce Enterprise, deploy the new key to the `liferay.home/deploy` folder. Be sure to remove any expired keys that have been deployed to the server.

If the expired keys are not removed, there will be an error message in the console during the next server restart:

```
ERROR [main][LicenseManager:?] Liferay Commerce license is expired
```

Follow these steps to reactivate Liferay Commerce Enterprise:

1. Navigate to the folders below:

    * `${liferay.home}/data/license`
    * `${liferay.home}/osgi/modules`

1. Remove any expired Commerce Enterprise activation keys from the directories mentioned above. To know which keys have expired, open any existing `xml` keys `activation-key-commerce-1.xml` and look for the `<expiration-date>` element that has already passed. For example,

    ```xml
    <expiration-date>Saturday, September 23, 2019 2:05:47 PM GMT</expiration-date>
    ```

    ```warning::
       While reviewing and removing expired keys be careful to *not* delete any valid keys, including your valid *DXP* specific activation keys.
    ```

1. Deploy the new activation key to the [`${liferay.home}/deploy`](https://learn.liferay.com/dxp/7.x/en/installation-and-upgrades/reference/liferay-home.html) folder.

    ```tip::
      You do not have to shut down the application server to deploy or remove activation keys.
    ```

## Additional Information

* [Activating a Marketplace App Through a Proxy Server](https://help.liferay.com/hc/en-us/articles/360018427391)
