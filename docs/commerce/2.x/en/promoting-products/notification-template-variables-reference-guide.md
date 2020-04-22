# Notification Template Variables Reference Guide

When creating an Email Notification Template, store administrators can insert a variable as a substitute for key values in the Email Content's _Body_ field. Key values include a customer's name, the Order ID, shipping and billing addresses, or a list of items in the order.

![Use these variables in the Email Body field.](./notification-template-variables-reference-guide/images/02.png)

To view the variables available, first select a Notification Template Type and enable it.

![Select a Notification Template type first.](./notification-template-variables-reference-guide/images/01.png)

Once a template type has been selected, expand the _Definition of Terms_ dropdown menu.

## Email Settings

![Use these variables in the Email settings field.](./notification-template-variables-reference-guide/images/03.png)

The following variables are available to populate the Email Settings fields for the senders and addressees:

| Variable | Description |
| --- | --- |
| [%ACCOUNT_ROLE_ORDER_MANAGER%] | Account Order Manager |
| [%ORDER_CREATOR%] | The user that created the order |
| [%ACCOUNT_ROLE_ADMINISTRATOR%] | Account Administrator |
| [%USER_GROUP_NAME%] | User Group Name |

## Orders

![Use these variables Orders emails.](./notification-template-variables-reference-guide/images/05.png)

The following variables are available for Orders-type email notification templates:

| Variable | Description |
| --- | --- |
| [%ORDER_ITEMS%] | A table with all the items included in the order |
| [%ORDER_SHIPPING_ADDRESS%] | The order's shipping address  |
| [%ORDER_BILLING_ADDRESS%] | The order's billing address |
| [%ORDER_ID%] | The order ID |

## Subscription

![Use this variable for Subscriptions.](./notification-template-variables-reference-guide/images/04.png)

The following variables are available for Subscription-type email notification templates:

| Variable | Description |
| --- | --- |
| [%PRODUCT_NAME%] | Product Name |

## Additional Information

* [Automating Store Emails by Using Notification Templates](automating-store-emails-by-using-notification-templates.md)
