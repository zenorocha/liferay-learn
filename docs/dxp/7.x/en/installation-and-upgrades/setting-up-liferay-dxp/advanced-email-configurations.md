# Advanced Email Configurations

This article documents advanced email configurations. The simplest way to get started is to [use Gmail to send email notifications](./connecting-to-a-mail-server.md). Administrators have the option to configure the built-in mail session using Portal Properties or use their application server's mail session.

## Configuring the Built-in Mail Session Using Portal Properties

To configure the mail session offline or before deploying DXP:

1. Create a [`portal-ext.properties` file](../14-reference/03-portal-properties.md) (if the file does not already exist).

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

1. Replace the default mail session values with your own.

1. Put the `portal-ext.properties` file into the [LIFERAY_HOME](../14-reference/01-liferay-home.md).

DXP connects to the mail session on the next startup.

## Connecting to a Mail Session on the Application Server

Users can opt to configure a mail session for DXP using their application server.

1. Create a mail session on your application server; please see the application server's documentation.

1. Point DXP to that mail session.

1. If using the _Control Panel_, navigate to _Control Panel &rarr; Configuration &rarr; Server Administration &rarr; Mail_.

1. Enter the value in the _JavaMail Properties_ field.

    ![JavaMail](./advanced-email-configurations/images/01.png)

1. Click _Save_.

### Using Portal Properties

1. Alternately, set the `mail.session.jndi.name` portal property in a `${LIFERAY_HOME}/portal-ext.properties` file. Here's an example property:

    ```properties
        mail.session.jndi.name=mail/MailSession
    ```

1. Restart DXP.

The mail server has been connected to DXP and ready to send notifications.

## Additional Information

* [Configuring a Tomcat-Managed Mail Session](../01-installing-liferay-dxp/01-installing-liferay-on-an-application-server/01-installing-liferay-on-tomcat.md#mail-configuration)
* [Configuring a WebSphere-Managed Mail Session](../01-installing-liferay-dxp/01-installing-liferay-on-an-application-server/05-installing-liferay-on-websphere.md#mail-configuration)
* [Apache Tomcat 9 JavaMail Sessions](https://tomcat.apache.org/tomcat-9.0-doc/jndi-resources-howto.html#JavaMail_Sessions)
