# Activating Liferay DXP

> Subscription Required

There are two ways to activate a Liferay DXP instance:

* Using an XML activation key from [Liferay Support](https://help.liferay.com/hc/en-us).
* Online activation through Liferay Connected Services (LCS).

## Using an XML Key

To activate Liferay DXP using an XML activation key follow these steps:

1. Request a Liferay DXP acivation key by opening a [Help Center](https://liferay-support.zendesk.com/agent/) ticket.
1. The Liferay Provisioning Team will provide instructions on how to download the activation key.
    > **Note:** that the activation key is tied to a particular server. To migrate an existing key to a different server, please contact the Liferay Support Team by opening a [Help Center](https://liferay-support.zendesk.com/agent/) ticket.
1. Deploy the activation key in the `{liferay.home}\deploy` folder.
1. Verify that the success message appears in the console.

    <!-- ```
    success message example
    ``` -->

1. Once the activation key has been applied, this instance has been registered.

Liferay DXP is now ready to be used.

## Using LCS

Liferay DXP 7.0 introduced LCS as a way to activate Liferay DXP instances. LCS can also install fix packs, monitor each instance's performance, and help administrators automatically manage Liferay DXP subscriptions. See the [LCS documentation](https://help.liferay.com/hc/articles/360029032071-Introduction-to-Managing-Liferay-DXP-with-Liferay-Connected-Services) for instructions on activating the instances with LCS.

> **Note:** Administrators must use LCS for activation of Elastic subscriptions. Otherwise, LCS for activation is optional. Instead request an XML activation key from Liferay Support.

To learn how to activate Liferay DXP using LCS see [this article](https://help.liferay.com/hc/articles/360029032071-Introduction-to-Managing-Liferay-DXP-with-Liferay-Connected-Services).

<!-- ## Additional Information

* Helpful Links to additional or related information -->
