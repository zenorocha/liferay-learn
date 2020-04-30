# Store Emails

Liferay Commerce can be configured to send email notifications that are triggered by a variety of store events. Email notifications are comprised of templates that define the content of the email. Notifications can be flexibly configured. A single event trigger (store order) can send emails to different target audiences (a customer, a sales agent, an administrator) and use templates specific to each party.

```note::
   To use Liferay Commerce's Notifications feature, system administrators first have to configure the Mail settings for Liferay Digital Experience Platform (DXP). See `Connecting to a Mail Server <https://learn.liferay.com/dxp-7.x/installation-and-upgrades/setting-up-liferay-dxp/configuring-mail/connecting-to-a-mail-server.html>`_ for more information.
```

## Configuring Store Email Notifications

Once the Liferay Commerce's mail settings have been configured, navigate to the _Control Panel_ &rarr; _Commerce_ &rarr; _Channels_ to begin creating store email notifications.

Email notifications are configured per [channel](../managing-a-catalog/creating-and-managing-products/channels/introduction-to-channels.md).

Using an [accelerator](../starting-a-store/accelerators.md) creates a store, catalog, and channel for you to start with.

![Available Notification Templates](./store-emails/images/02.png)

## Event Triggers

There are ten events which triggers email notifications. Use one of the corresponding out-of-the-box Notification Templates to create a standardized email notification.

| Notification Type | Event |
| --- | ---|
| Order Placed | The store has received an order. |
| Order Processing | The store has begun processing an order. |
| Order Awaiting Shipment | The order is ready to be shipped. |
| Order Partially Shipped | The customer is notified if the items are being shipped separately. |
| Order Shipped | The order has been shipped. |
| Order Completed | The order has been completed; delivery has been made. |
| Subscription Renewed | The subscription (recurring order) has been renewed. |
| Subscription Activated | The subscription has been activated. |
| Subscription Suspended | The subscription has been suspending pending review or action by the store. |
| Subscription Cancelled | The subscription has been cancelled. |

![Available Notification Templates](./store-emails/images/01.png)

## Viewing the Notification Queue

You can view all email notifications in the channel's _Notification Queue_. Here, you can verify that an email has been sent upon the event trigger (for example, an order is placed, shipped, or a subscription is cancelled).

![Message Queues](./store-emails/images/03.png)

By default, the system checks the queue at 15 minute intervals for unsent notifications. See [Configuring the Commerce Notification Queue](./configuring-the-commerce-notification-queue.md) article to learn more about changing the Check Interval.

## Using Placeholder Values in an Email Notification Template

You can personalize the Notification Templates with placeholder values as a substitute for key values in the _Email Settings_ and _Body_ fields. Key values include a customer's name, the Order ID, shipping and billing addresses, and a list of items in the order.

For example, the _Email Body_ field can contain:

```note::
   Dear [%ORDER_CREATOR%],

   Your [%ORDER_ID%] has been shipped to [%ORDER_SHIPPING_ADDRESS%].
```

The Notification Template then parses those variables when sending the email.

See the [Notification Template Variables Reference Guide](./notification-template-variables-reference-guide.md) article to learn more.

## Viewing Order Communications History

Every order logs all related email notifications. Navigate to the _Control Panel_ &rarr; _Commerce_ &rarr; _Orders_. Click on the Order ID then the _Email_ tab. See [Orders Information](../orders-and-fulfillment/orders/order-information.md) to learn more.

![Message Logs are in the Orders information.](./store-emails/images/04.png)

## Additional Information

* [Using Notification Templates](./using-notification-templates.md)
* [Configuring the Commerce Notification Queue](./configuring-the-commerce-notification-queue.md)
* [Notification Template Variables Reference Guide](./notification-template-variables-reference-guide.md)
