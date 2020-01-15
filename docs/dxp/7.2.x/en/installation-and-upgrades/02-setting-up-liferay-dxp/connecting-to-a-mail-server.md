# Connecting to a Mail Server

Liferay DXP 7.2 uses a mail server and SMTP to email notifications. To enable the DXP 7.2 instance to send notifications, it is highly recommended to use DXP 7.2's built-in mail session to configure mail. Administrators can configure the built-in mail session before or after deploying DXP 7.2. Alternatively, administrators can configure DXP 7.2 to use a mail session on the application server.

Creating a mail session in DXP 7.2 or on the application server requires the following information:

* Incoming POP Server and port
* POP User Name
* POP Password
* Outgoing SMTP Server and port
* SMTP User Name
* SMTP Password
* All optional JavaMail properties

## Configuring DXP 7.2's Built-in Mail Session

The built-in mail session setup can be done using either of these methods:

* Control Panel
* Portal properties

### Built-in Mail Session in the Control Panel

After deploying DXP 7.2, you can configure the mail session from the Control Panel.

1. Sign in as the administrative user (the user specified on the [Basic Configuration page](../01-installing-liferay-dxp/05-using-the-setup-wizard.md)).
1. Navigate to *Control Panel &rarr; Configuration &rarr; Server Administration &rarr; Mail*.
1. Enter the following:

    * **Incoming POP Server:** (POP server hostname) (for example, _gmail.com_)
    * **Incoming Port:** (POP server port) (for example, _465_)
    * **Use a Secure Network Connection:** Flagged.
    * **User Name:** acme.org
    * **Password:** *****
    * **Outgoing SMTP Server:** (SMTP server hostname) (for example, _gmail.com_)
    * **Outgoing Port:** (SMTP server port) (for example, _115_)
    * **Use a Secure Network Connection:** Flagged
    * **User Name:** acme.org
    * **Password:** acme.org
    * **Manually specify additional JavaMail properties to override the above configuration:** If there are additional properties you need to specify, supply them here.

    ![Configuring a Mail Server](./connecting-to-a-mail-server/images/01.png)

1. Click *Save*.

For more information, please see the [Mail Server Reference](./mail-server-reference.md).

DXP 7.2 connects to the mail session immediately.

### Built-in Mail Session Portal Properties

If configuring the mail session offline or before deploying DXP 7.2:

1. Create a [`portal-ext.properties` file](../14-reference/03-portal-properties.md) (if the file does not already exist).

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
1. Put the `portal-ext.properties` file into the [LIFERAY_HOME](../14-reference/01-liferay-home.md).

DXP 7.2 connects to the mail session on the next startup.

## Configuring a Mail Session on the Application Server

Administrators can manage a mail session for DXP 7.2 on the application server.

1. Create a mail session on your application server; please see each application server's documentation.
1. Point DXP 7.2 to that mail session using the Control Panel or portal properties. Here are instructions for both:

    * Configure the JNDI name in the *Mail* page at *Control Panel &rarr; Configuration &rarr; Server Administration &rarr; Mail*. Enter the value in the _JavaMail Properties_ field.
    * Set a `mail.session.jndi.name` portal property in a `${LIFERAY_HOME}/portal-ext.properties` file. Here's an example property:

        ```properties
            mail.session.jndi.name=mail/MailSession
        ```

Lastly, configure the instance's email senders.

## Configuring Default Email Senders

Email senders are the default name and email address DXP 7.2 uses to send administrative emails and announcement emails. Default email senders are configured in the [`portal-ext.properties` file](../14-reference/03-portal-properties.md).  

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

    **Note:** The following emails are blacklisted by default and cannot be used in any DXP 7.2 installation:

    * `noreply@liferay.com`
    * `test@liferay.com`
    * `noreply@domain.invalid`
    * `test@domain.invalid`

    Otherwise, DXP 7.2 logs a `WARN` trace:

    ```
    Email xxx will be ignored because it is included in mail.send.blacklist
    ```

1. Restart the application server.

The mail server has been configured and ready to send notifications.

## Additional Information

* [Configuring a WebSphere-Managed Mail Session](../01-installing-liferay-dxp/01-installing-liferay-on-an-application-server/05-installing-liferay-on-websphere.md#mail-configuration)
