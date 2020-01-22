# Mail Server Configuration Reference

Liferay DXP uses a mail server and SMTP to send email notifications. This article serves as a reference for all the values required to connect successfully a DXP instance to a mail server.

To manage DXP's mail settings, navigate to *Control Panel &rarr; Configuration &rarr; Server Administration &rarr; Mail*.

![Configuring a Mail Server](./mail-server-configuration-reference/images/01.png)

> **Note:** Sample values which have been populated are for a _development_ environment. Replace the values for a production environment.

| Field | Description |
| --- | --- |
| Incoming POP Server | The hostname for a server running the Post Office Protocol. DXP checks this mailbox for incoming messages, such as message board replies. |
| Incoming Port | The port on which the POP server is listening. |
| Use a Secure Network Connection | The checkbox to enable whether to use an encrypted connection when connecting to the POP server. |
| User Name | The user ID DXP uses to log into the POP server. |
| Password | The password DXP uses to log into the POP server. |
| Outgoing SMTP Server | The hostname for a server running the Simple Mail Transfer Protocol. DXP uses this server to send emails, such as password change emails and other notifications. |
| Outgoing Port | The port on which the SMTP server is listening. |
| Use a Secure Network Connection | Use an encrypted connection when connecting to the SMTP server. |
| User Name | The user ID DXP uses to log into the SMTP server. |
| Password | The password DXP uses to log into the SMTP server. |
| Manually specify additional JavaMail properties to override the above configuration| This field is for any additional JavaMail settings. |

## Additional Information

* [Connecting to a Mail Server](../setting-up-liferay-dxp/connecting-to-a-mail-server.md)
