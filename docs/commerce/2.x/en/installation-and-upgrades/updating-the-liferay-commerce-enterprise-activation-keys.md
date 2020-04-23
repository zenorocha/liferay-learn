# Updating the Liferay Commerce Enterprise Activation Keys

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

* [Activating Liferay Commerce Enterprise](./activating-liferay-commerce-enterprise.md)
