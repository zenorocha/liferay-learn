# Activating Liferay Commerce Enterprise

> **Subscribers**

Liferay Commerce Enterprise is built on Liferay DXP and requires activation in order to fully function.

## Deploying an Activation Key

The activation key is an `XML` file which is copied to the `{liferay.home}\deploy` directory of the Liferay Commerce Enterprise installation. To acquire and deploy an activation key follow these steps:

1. Once Liferay Commerce Enterprise has been purchased or added to an existing DXP subscription, open a [Help Center](https://liferay-support.zendesk.com/agent/) ticket and request a Liferay Commerce activation key.
1. The Liferay Provisioning Team will provide an activation key download.
1. Deploy the activation key to the [`${liferay.home}/deploy`](https://learn.liferay.com/dxp-7.x/installation-and-upgrades/reference/liferay-home.html) folder.
1. Verify that the activation success message appears in the console. <!-- @Justin TODO: Add what the actual success message is here. -->

Liferay Commerce Enterprise is now ready to be used.

## Updating an Activation Key

<!-- We should add a sentence or two that explain the use case/purpose for this header: I assume it would sound something like: "Activation keys expire after a set duration of time as determined by a user's subscription. In order to re-activate an instance of Commerce with a new, valid activation key these steps must be followed."

I'd also consider restructuring this section to be:

Activation keys expire after a set duration of time as determined by a user's subscription. In order to reactivate a Commerce Enterprise installation with a new valid activation key follow these steps:

1. First remove any expired keys. To know which keys are expired go to x.
1. Deploy the new key to liferay/home
1. etc.

-->
When updating a Liferay Commerce Enterprise instance with a new activation key, remove any expired keys that have been deployed to the server.

If the expired keys are not removed, there will be an error message in the console:

```
06:30:42,020 ERROR [main][LicenseManager:?] Liferay Commerce license is expired
```

To update a Liferay Commerce Enterprise activation key:

1. Deploy the new activation key to the [`${liferay.home}/deploy`](https://learn.liferay.com/dxp-7.x/installation-and-upgrades/reference/liferay-home.html) folder.

1. Navigate to the folders below:

    * `${liferay.home}/data/license`
    * `${liferay.home}/osgi/modules`

1. Remove any expired Commerce Enterprise activation keys (for example, `activation-key-commerce-1.xml`). <!-- How does someone know which keys are expired? -->

```warning::
   Be careful to not *not* delete any *DXP* specific activation keys.
```

```tip::
   You do not have to shut down the application server to deploy or remove activation keys.
```

## Additional Information

* [Activating a Marketplace App Through a Proxy Server](https://help.liferay.com/hc/en-us/articles/360018427391)
