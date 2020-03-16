# Alternative Email Configuration Methods

There are several methods of configuring Liferay DXP to connect to a mail server. The simplest way to get started is to [configure mail using through the Server Administration UI](./connecting-to-a-mail-server.md). This article covers alternative methods for configuring mail; Using Portal Properties or using an application server's mail session.

## Configuring the Built-in Mail Session Using Portal Properties

To configure the mail session offline or before deploying DXP:

1. Create a [`portal-ext.properties` file](../../reference/portal-properties.md) (if the file does not already exist).

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

1. Put the `portal-ext.properties` file into the [LIFERAY_HOME](../../reference/liferay-home.md).

DXP connects to the mail session on the next startup.

## Connecting to a Mail Session on the Application Server

Users can opt to configure a mail session for DXP using their application server.

1. Create a mail session on your application server; please see the application server's documentation.

1. If using the _Control Panel_, navigate to _Control Panel &rarr; Configuration &rarr; Server Administration &rarr; Mail_.

1. Enter the value in the _JavaMail Properties_ field.

    ![JavaMail](./alternative-email-configuration-methods/images/01.png)

1. Click _Save_. This points DXP to the mail session on your application server.

The mail server has been connected to DXP and ready to send notifications.

```note::
   Setting the following property in `portal-ext.properties <../reference/portal-properties.md>`__ and restarting your server will have the same effect as setting the value in the Control Panel: mail.session.jndi.name=mail/MailSession
```

## Additional Information

* [Configuring a Tomcat-Managed Mail Session](../../installing-liferay/installing-liferay-on-an-application-server/installing-liferay-on-tomcat.md#mail-configuration)
* [Configuring a WebSphere-Managed Mail Session](../../installing-liferay/installing-liferay-on-an-application-server/installing-liferay-on-websphere.md#mail-configuration)
* [Apache Tomcat 9 JavaMail Sessions](https://tomcat.apache.org/tomcat-9.0-doc/jndi-resources-howto.html#JavaMail_Sessions)
