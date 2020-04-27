# Activating Liferay Commerce Enterprise

> **Subscribers**

Liferay Commerce Enterprise is built on Liferay DXP. In additional to deploying the Liferay Commerce Enterprise `LPKG` file, it is necessary to activate Liferay Commerce Enterprise by deploying an activation key. The activation key is an `XML` file which is then deployed in the Liferay Commerce Enterprise instance.

## Deploying an Activation Key

1. Once the subscriber has purchased the additional Liferay Commerce offering, open a [Help Center](https://liferay-support.zendesk.com/agent/) ticket and request the Liferay Commerce activation key.
1. The Liferay Provisioning Team will provide instructions on how to download the Commerce activation key.
1. Deploy the activation key in the `{liferay.home}\deploy` folder.
1. Verify that the success message appears in the console.
1. Once the activation key has been applied, this instance has been registered.

Liferay Commerce Enterprise is now ready to be used.

## Updating an Activation Key

When users are updating the Liferay Commerce Enterprise instance with a new activation key, they must remove any expired keys.

If the expired keys are not removed, there will be an error message in the console:

```
"06:30:42,020 ERROR [main][LicenseManager:?] Liferay Commerce license is expired"
```

To update your Liferay Commerce Enterprise activation key:

1. Deploy the new activation key in the `${liferay.home}/deploy` folder (See the [Liferay Home](https://learn.liferay.com/dxp-7.x/installation-and-upgrades/reference/liferay-home.html) article to learn more).
1. Navigate to the folders below:

    * `${liferay.home}/data/license`
    * `${liferay.home}/osgi/modules`

1. Delete the expired Commerce Enterprise activation keys (for example, `activation-key-commerce-1.xml`).

```tip::
   Do *not* delete any of the DXP activation keys.
```

```tip::
   You do not have to shut down the application server to deploy or remove activation keys.
```

## Additional Information

* [Updating the Liferay Commerce Enterprise Activation Keys](./updating-the-liferay-commerce-enterprise-activation-keys.md)
* [Activating a Marketplace App Through a Proxy Server](https://help.liferay.com/hc/en-us/articles/360018427391)
