# Message Boards Mailing Lists Overview

This article documents an overview on how Message Boards _Categories_ send email notifications using the Mailing List feature.

Note that user subscriptions or mailing lists applies only to a **site-scoped** or **page-scoped message board**. See the [Scoping Your Message Boards](./05-scoping-your-message-boards.md) article to learn how to use scopes. Globally scoped messages boards do not support subscriptions and mailing lists.

The Message Boards app can use mailing lists to send email notifications. Any category in a message board can have its own mailing list. The mailing list mechanism supports both the [POP](https://support.google.com/mail/answer/7104828?hl=en) and the [IMAP](https://support.google.com/mail/answer/7126229?hl=en). POP is the default, but each message board’s mailing list is configured independently.

Before configuring the Message Boards app's email lists, see the [Connecting to a Mail Server](../../../installation-and-upgrades/02-setting-up-liferay-dxp/connecting-to-a-mail-server.md) article for general instructions on how to configure a mail server for the entire DXP instance.

If using the [IMAP](https://support.google.com/mail/answer/7126229?hl=en) protocol for a category’s mailing list, make sure to [configure the IMAP inbox to delete messages](https://support.google.com/mail/answer/78892?hl=en) as they are pulled by the email client that sends messages to the users on the mailing list. Otherwise, each email message retained on the server is sent to the mailing list each time there's a new post or update in the category.

When a mailing list is enabled for a message board category, Message Boards listens to the specific email inbox that’s configured for the mailing list. Enabling the mailing list function lets users on the mailing list reply to the notification messages in their email clients. Message Boards pulls the messages from the email inbox it’s configured to listen to and automatically copies those replies to the appropriate message board thread.

To start, see [Configuring a Message Boards Category Mailing List](./configuring-a-mb-category-mailing-list.md)
