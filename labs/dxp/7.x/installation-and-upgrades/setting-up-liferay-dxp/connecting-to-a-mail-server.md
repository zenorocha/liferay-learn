# Connecting to a Mail Server

Liferay DXP uses a mail server and SMTP to send email notifications for a variety of purposes: user registration and password management, site membership notifications, and content updates, to name a few. If you have not already created a mail session, use DXP"s built-in- mail session.

Alternately, if there is already a mail session on the application server, connect DXP to it.

Connecting the mail session to DXP or on the application server requires the following information:

* Incoming POP server and port
* POP user credentials
* Outgoing SMTP server and port
* SMTP user credentials
* All optional JavaMail properties

To learn how to find the mail settings, see:

* [Read Gmail messages on other email clients using POP](https://support.google.com/mail/answer/7104828?hl=en)
* [Check Gmail through other email platforms](https://support.google.com/mail/answer/7126229?hl=en)

**Warning**: If using the [IMAP](https://support.google.com/mail/answer/7126229?hl=en) protocol for a category’s mailing list, make sure to [configure the IMAP inbox to delete messages](https://support.google.com/mail/answer/78892?hl=en) as they are pulled by the email client that sends messages to the users on the mailing list. Otherwise, each email message retained on the server is sent to the mailing list each time there's a new post or update in the category.

## Configuring DXP Built-in Mail Session

To configure the built-in mail session setup, administrators can use either of these methods:

* Control Panel
* Portal properties

### Built-in Mail Session in the Control Panel

After deploying DXP, follow these steps to configure the mail session from the Control Panel:

1. Sign in as the administrative user (the user specified on the [Basic Configuration page](../installing-liferay/running-liferay-dxp-for-the-first-time.md)).
1. Navigate to *Control Panel &rarr; Configuration &rarr; Server Administration &rarr; Mail*.
1. Enter your values for the following fields:

    * **Incoming POP Server:** (POP server hostname)
    * **Incoming Port:** (POP server port, such as, _465_)
    * **Use a Secure Network Connection:** Flagged.
    * **User Name:** joe.bloggs
    * **Password:** *****
    * **Outgoing SMTP Server:** (SMTP server hostname)
    * **Outgoing Port:** (SMTP server port, such as, _110_)
    * **Use a Secure Network Connection:** Flagged
    * **User Name:** joe.bloggs
    * **Password:** *****
    * **Manually specify additional JavaMail properties to override the above configuration:** If there are additional properties you need to specify, supply them here.

      ![Configuring a Mail Server](./connecting-to-a-mail-server/images/01.png)

1. Click *Save*.

For more information, please see the [Mail Server Reference](./mail-server-configuration-reference.md).

DXP connects to the mail session immediately.

### Built-in Mail Session Portal Properties

To configure the mail session offline or before deploying DXP:

1. Create a [`portal-ext.properties` file](../reference/portal-properties.md) (if the file does not already exist).

1. Copy these default property settings into the `portal-ext.properties` file:

    ```properties
    mail.session.mail=false
    mail.session.mail.pop3.host=pop.gmail.com
    mail.session.mail.pop3.password=*******
    mail.session.mail.pop3.port=465
    mail.session.mail.pop3.user=joe.bloggs
    mail.session.mail.smtp.auth=true
    mail.session.mail.smtp.host=smtp.gmail.com
    mail.session.mail.smtp.password=*******
    mail.session.mail.smtp.port=110
    mail.session.mail.smtp.user=joe.bloggs
    mail.session.mail.store.protocol=pop3
    mail.session.mail.transport.protocol=smtp
    ```

1. Replace the default mail session values with your own. (See the example above.)
1. Put the `portal-ext.properties` file into the [LIFERAY_HOME](../reference/liferay-home.md).

DXP connects to the mail session on the next startup.

## Connecting to a Mail Session on the Application Server

Users can opt to configure a mail session for DXP using their application server. One example is found in [Configuring a Tomcat-Managed Mail Session](../01-installing-liferay-dxp/01-installing-liferay-on-an-application-server/01-installing-liferay-on-tomcat.md#mail-configuration)

1. Create a mail session on your application server; please see the application server's documentation.
1. Point DXP to that mail session.
1. If using the _Control Panel_, navigate to _Control Panel &rarr; Configuration &rarr; Server Administration &rarr; Mail_.
1. Enter the value in the _JavaMail Properties_ field.

    ![JavaMail](./connecting-to-a-mail-server/images/02.png)

1. Click _Save_.
1. Alternately, set the `mail.session.jndi.name` portal property in a `${LIFERAY_HOME}/portal-ext.properties` file. Here's an example property:

    ```properties
        mail.session.jndi.name=mail/MailSession
    ```

The mail server has been connected to DXP and ready to send notifications.

## Additional Information

* [Configuring a Tomcat-Managed Mail Session](../01-installing-liferay-dxp/01-installing-liferay-on-an-application-server/01-installing-liferay-on-tomcat.md#mail-configuration)
* [Mail Server Configuration Reference](./mail-server-configuration-reference.md)
* [Configuring a WebSphere-Managed Mail Session](../installing-liferay/installing-liferay-on-an-application-server/installing-liferay-on-websphere.md#mail-configuration)
* [Apache Tomcat 9 JavaMail Sessions](https://tomcat.apache.org/tomcat-9.0-doc/jndi-resources-howto.html#JavaMail_Sessions)
