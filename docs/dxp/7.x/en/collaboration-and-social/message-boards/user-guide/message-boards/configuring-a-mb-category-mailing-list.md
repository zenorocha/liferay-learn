# Configuring a Message Boards Category Mailing List

This article documents how to configure a mailing list for a message board category. Liferay DXP supports both POP and IMAP protocols. (The instructions below use POP. For more information, see [Read Gmail messages on other email clients using POP](https://support.google.com/mail/answer/7104828?hl=en))

To add a mailing list to a Message Boards Category:

 > Note that the steps below apply to updating an existing _Category_ which are virtually the same when they first create the _Category_.

1. On the _Message Boards_ widget (on a site page), click the _Actions_ icon next to a Category (in this example, _Category 1_)
1. Click _Edit_ to modify an existing category.
1. Expand the _Mailing List_ section.
1. Switch the _Active_ toggle to _YES_.
1. Leave the _Allow Anonymous Emails_ toggle as _NO_.
1. Enter the following:
   * **Email address**: the dedicated email address for this category (for example: replies@lunar-resort.com)
   * **Protocol**: POP
   * **Server Name**: the mail server’s host name
   * **Server Port**: The port on which the mail service is running (110)
   * **Use a Secure Network Connection**: check
   * **User Name**: login name (info@lunar-resort.com)
   * **Password**: login credentials
   * **Read Interval (Minutes)**: 5
   * **Email Address (Outgoing)**: use the same email if you want your users to reply to the categories using email.
   * **Use Custom Outgoing Server**: leave blank if using a different mail server than the global default.

    ![Configuring a categories mailing list](./configuring-a-mb-category-mailing-list/images/01.png)

1. Click _Save_.

The mailing list is now active for this category. Users who have subscribed to this category will receive email notifications.
