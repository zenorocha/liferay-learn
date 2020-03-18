# Activating Liferay Commerce Enterprise

> **Subscribers**

Liferay Commerce Enterprise is built on Liferay DXP. In additional to deploying the Liferay Commerce Enterprise `LPKG` file, it is necessary to activate Liferay Commerce Enterprise by deploying an activation key. The activation key is an `XML` file which contains any combination of the DXP instance's hostname, IP address, and MAC address.

```note::
   Only the values listed in the ``XML`` file need to stay constant. For example, the hostname and MAC address fields can be empty and the activation key is registered based on only the IP address. This is very important if Liferay Commerce Enterprise is deployed on DXP Cloud or on Docker because the MAC address cannot be controlled.
```

1. Once the subscriber has purchased the additional Liferay Commerce offering, open a [Help Center](https://liferay-support.zendesk.com/agent/) ticket and request the Liferay Commerce activation key.
1. On the Help Center ticket, provide the following information: your hostname, IP address, and MAC address.
1. The Liferay Provisioning Team will provide instructions on how to download the Commerce activation key.

    ```tip::
       Some activation keys are tied to a particular server. To migrate an activation key to another server, in this circumstance, please contact the Liferay Support Team by opening a `Help Center <https://liferay-support.zendesk.com/agent/>`_ ticket.
    ```

1. Deploy the activation key in the `{liferay.home}\deploy` folder.
1. Verify that the success message appears in the console.
1. Once the activation key has been applied, this instance has been registered.

Liferay Commerce Enterprise is now ready to be used.

## Additional Information

* [Activating a Marketplace App Through a Proxy Server](https://help.liferay.com/hc/en-us/articles/360018427391)
