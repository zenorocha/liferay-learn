# Automating Store Emails by Using Notification Templates

Notifications are automated emails sent to users. To send email notifications, first create a _Notification Template_. Notification Templates define the notification sender, trigger, and content of an email notification.

  > **Note:** To use Liferay Commerce's Notifications feature, system administrators _first_ have to configure the Mail settings for Liferay Digital Experience Platform (DXP). See [User Subscriptions and Mailing Lists](https://help.liferay.com/hc/en-us/articles/360017896652-Installing-Liferay-DXP#configuring-mail) for more information.

Once the Mail settings have been configured, follow these steps to create a notification for a received order:

1. Navigate to _Site Administration_ → _Commerce_ → _Settings_.
2. Click the _Notifications_ tab.
3. Click the _Notification Templates_ sub-tab.
4. Click the (+) button to create a new Notification Template.
5. Enter the following:
    * **Name**: New Orders
    * **Description**: New orders template
    * **Account Groups**: (leave blank or designate an **optional** account group)
    * **From Address**: Your store's email address (for example: _orders@yourstore.com_)
    * **From Name**: Name of the store or a customer service representative
    * **Type**: Order Placed
    * **Enabled**: Switch the Toggle to _YES_
    * **Subject**: Email subject (for example: _Your order has been received._)
    * **Body**: Email body \*

    ![Notification Template](./automating-store-emails-by-using-notification-templates/images/01.png)

6. Click _Save_.

The new Notification Template has been saved and your store will send an automated email to buyers after the store has received their order. Once the template is created, a new notification is added to the notification queue whenever an order is placed. Check the _Notifications Queue_ sub-tab when an order has been placed. Liferay Commerce checks the queue at specified intervals to send any unsent notifications.

## Additional Notifications

**Note 1**: \* Liferay Commerce offers two snippets to insert programmatically the order creator's name and the order ID.

* \[%ORDER_CREATOR%\] inserts the user who created the order
* \[%ORDER_ID%\] inserts the Order ID

**Note 2**: An extension point lets you implement other notifications: for a shipped order, a restocked product, a carrier exception, or any other event.

**Note 3**: To change the interval for when Liferay Commerce checks for unsent notifications, navigate to the _Control Panel_ → _Configuration_ → _System Settings_. Click _Orders_ then the _Commerce Notification Queue_. The default values are listed in minutes. Change the values for the Check Interval and the Delete Interval if necessary.

![Changing Intervals](./automating-store-emails-by-using-notification-templates/images/02.png)
