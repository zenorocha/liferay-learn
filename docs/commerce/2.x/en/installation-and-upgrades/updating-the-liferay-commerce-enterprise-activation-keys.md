# Updating the Liferay Commerce Enterprise Activation Keys

When users are updating the Liferay Commerce Enterprise instance with a new activation key, they must remove any expired keys.

If the expired keys are not removed, there will be an error message in the console:

```
"06:30:42,020 ERROR [main][LicenseManager:?] Liferay Commerce license is expired"
```

This article walks users through on how to update their Liferay Commerce Enterprise's activation keys.

The expired activation keys are found in the following folders:

To update your Liferay Commerce Enterprise activation key:

1. Deploy the new activation key in the `${liferay.home}/deploy` folder.
1. Navigate to the folders below:

    * `${liferay.home}/data/license`
    * `${liferay.home}/osgi/modules`

1. Delete the expired Commerce Enterprise activation keys (for example, `activation-key-commerce-1.xml`).
1. Do *not* delete any of the DXP activation keys.

```tip::
   You do not have to shut down the application server to deploy or remove activation keys.
```

## Additional Information

* [Activating Liferay Commerce Enterprise](./activating-liferay-commerce-enterprise.md)
