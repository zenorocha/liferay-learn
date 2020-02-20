# Connecting to a Mail Server

Liferay DXP uses a mail server and SMTP to send email notifications for a variety of purposes: user registration and password management, site membership notifications, and content updates, to name a few. In order for Liferay DXP to send email notifications we recommend configuring the built-in mail session. As an alternative, you can opt to configure and use your application server's mail session.

Creating a mail session in DXP or on the application server requires the following information:

* Incoming POP Server and port
* POP User Name
* POP Password
* Outgoing SMTP Server and port
* SMTP User Name
* SMTP Password
* All optional JavaMail properties

<!-- Let's provide some information here that can help someone who DOES NOT have this information or know where to start to find this information - some helpful information or links. For example: "To learn more about this topic see: x." Maybe can we create supplemental articles to this one that say explain how to use gmail as an SMTP server to send emails from Liferay (if this actually works) something more practical. https://portaldevelopment.wordpress.com/2008/06/16/sending-email-in-liferay-portal/ , https://www.siteground.com/kb/google_free_smtp_server/ , https://docs.bitnami.com/bch/apps/drupal/configuration/configure-smtp/ for reference. -->

## Configuring DXP Built-in Mail Session

The built-in mail session setup can be done using either of these methods:

* Control Panel
* Portal properties

### Built-in Mail Session in the Control Panel

After deploying DXP, you can configure the mail session from the Control Panel.

1. Sign in as the administrative user (the user specified on the [Basic Configuration page](../installing-liferay/running-liferay-dxp-for-the-first-time.md)).
1. Navigate to *Control Panel &rarr; Configuration &rarr; Server Administration &rarr; Mail*.
1. Enter the following:

    * **Incoming POP Server:** (POP server hostname)
    * **Incoming Port:** (POP server port) (for example, _465_)
    * **Use a Secure Network Connection:** Flagged.
    * **User Name:** acme.org
    * **Password:** *****
    * **Outgoing SMTP Server:** (SMTP server hostname)
    * **Outgoing Port:** (SMTP server port) (for example, _115_)
    * **Use a Secure Network Connection:** Flagged
    * **User Name:** acme.org
    * **Password:** *****
    * **Manually specify additional JavaMail properties to override the above configuration:** If there are additional properties you need to specify, supply them here.

      ![Configuring a Mail Server](./connecting-to-a-mail-server/images/01.png)

1. Click *Save*.

For more information, please see the [Mail Server Reference](./mail-server-configuration-reference.md).

DXP connects to the mail session immediately.

### Built-in Mail Session Portal Properties

To configure the mail session offline or before deploying DXP:

1. Create a [`portal-ext.properties` file](../reference/03-portal-properties.md) (if the file does not already exist).

1. Copy these default property settings into the `portal-ext.properties` file:

    ```properties
    mail.session.mail=false
    mail.session.mail.pop3.host=localhost
    mail.session.mail.pop3.password=
    mail.session.mail.pop3.port=110
    mail.session.mail.pop3.user=
    mail.session.mail.smtp.auth=false
    mail.session.mail.smtp.host=localhost
    mail.session.mail.smtp.password=
    mail.session.mail.smtp.port=25
    mail.session.mail.smtp.user=
    mail.session.mail.store.protocol=pop3
    mail.session.mail.transport.protocol=smtp
    ```

1. Replace the default mail session values with your own. (See the example above.)
1. Put the `portal-ext.properties` file into the [LIFERAY_HOME](../reference/01-liferay-home.md).

DXP connects to the mail session on the next startup.

## Configuring a Mail Session on the Application Server

Users can opt to configure a mail session for DXP using their application server.

1. Create a mail session on your application server; please see the application server's documentation.
1. Point DXP to that mail session using the Control Panel or portal properties. <!-- What does both mean? --> Here are instructions for both:

    * Configure the JNDI name in the *Mail* page at *Control Panel &rarr; Configuration &rarr; Server Administration &rarr; Mail*. Enter the value in the _JavaMail Properties_ field. <!-- screenshot -->
    * Set a `mail.session.jndi.name` portal property in a `${LIFERAY_HOME}/portal-ext.properties` file. Here's an example property:

        ```properties
            mail.session.jndi.name=mail/MailSession
        ```

Lastly, configure the instance's email senders.

## Configuring Default Email Senders

<!-- This section does not fit the title of the article. Either should change the article name, or break this out. -->

Email senders are the default name and email address DXP uses to send administrative emails and announcement emails. Default email senders are configured in the [`portal-ext.properties` file](../reference/03-portal-properties.md).  

Here are some important configurations:

* Admin email configuration:

    ```properties
    admin.email.from.name=Joe Bloggs
    admin.email.from.address=test@domain.invalid
    ```

* Announcements email configuration:

    ```properties
    announcements.email.to.name=
    announcements.email.to.address=noreply@domain.invalid
    ```

1. Replace the names and email addresses above with your values.

    **Note:** The following emails are blacklisted by default and cannot be used in any DXP installation:

    * `noreply@liferay.com`
    * `test@liferay.com`
    * `noreply@domain.invalid`
    * `test@domain.invalid`

    Otherwise, DXP logs a `WARN` trace:

    ```
    Email xxx will be ignored because it is included in mail.send.blacklist
    ```

1. Restart the application server.

The mail server has been configured and ready to send notifications.

## Additional Information
<!-- Should tomcat be here? -->
* [Mail Server Configuration Reference](./mail-server-configuration-reference.md)
* [Configuring a WebSphere-Managed Mail Session](../installing-liferay/installing-liferay-on-an-application-server/installing-liferay-on-websphere.md#mail-configuration)
