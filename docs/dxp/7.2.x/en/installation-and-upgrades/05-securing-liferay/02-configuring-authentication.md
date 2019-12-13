# Configuring Authentication

By default, Liferay DXP uses the *Sign In* widget to authenticate users. 

> **Note:** The Sign In widget appears on the default home page at `http[s]://[server-name:port]/web/guest/home`. If the Sign In widget is unavailable on any page, it can be accessed directly via its URL: `http[s]://[server-name:port]/c/portal/login`.

![The default Liferay home page](./configuring-authentication/images/01.png)

You can configure other ways of authenticating users and/or applications:

* [LDAP](../06-sso/06-ldap.md)
* [SAML](../06-sso/08-saml.md)
* [Kerberos](../06-sso/05-kerberos.md)
* [OpenID Connect](../06-sso/02-openid-connect.md)
* [Token-Based solutions](../06-sso/01-token-based-authentication.md)
* [OAuth 2.0](../06-sso/07-oauth-2.md)

[Authentication Verifiers](./04-securing-web-services/04-using-auth-verifiers.md) can manage authentication for remote applications, and
[Authentication Pipelines](../../platform/frameworks/authentication-pipelines.md) define the ways users are validated by one or several systems. 

## Using and Configuring the Sign In Widget

The Sign In widget checks and stores user credentials in the portal database and can also check against users stored in an LDAP server. The Sign In widget's behavior can be configured and customized in several ways.

### Authentication Types

When using the Sign In widget, users can be configured to log in using one of three authentication types:

| Authentication Type | Description | Used by Default? |
| --- | --- | --- |
| Screen Name | Determined by administrator or user at account creation | No |
| Email Address | Determined by administrator or user at account creation  | Yes |
| User ID | Automatically generated when the account is created | No |

> **Note:** Only one authentication type can be used at a time.

Regardless of the authentication type, users must always enter a password. [Password Policies](../../user-and-system-administration/password-policies.md) can be created and configured to place restrictions on password length, special characters, or other requirements.

_Authentication Type_ can be configured by an Administrator through the Control Panel or through a properties file.

#### Configuring Authentication Type Through the Control Panel

1. Navigate to the Control Panel
1. Click on *Configuration* &rarr; *Instance Settings* &rarr; *Platform* &rarr; *User Authentication*
1. Choose an option under the *How do users authenticate?* selector.

    ![Figure 1: You can select from three types of authentication.](./configuring-authentication/images/03.png)

#### Configuring Authentication Type Using Properties

To use the [`portal-ext.properties`](https://help.liferay.com/hc/en-us/articles/360028712292-Portal-Properties) file, paste in the below properties and uncomment the desired authentication type:

```properties
company.security.auth.type=emailAddress
#company.security.auth.type=screenName
#company.security.auth.type=userId
```

### Disabling Guest Account Creation

To prevent guest users from creating new user accounts:

1. Navigate to the Control Panel &rarr; *Configuration* &rarr; *Instance Settings* &rarr; *Platform* &rarr; *User Authentication*.
1. Un-check *Allow strangers to create accounts?*.
1. Click *Save*.

    ![Figure 2: Guests can't create accounts if this box is unchecked.](./configuring-authentication/images/04.png)

### Preventing Password Resets

If users should not be able to reset their own passwords, you can configure this from the same screen:

1. Navigate to the Control Panel &rarr; *Configuration* &rarr; *Instance Settings* &rarr; *Platform* &rarr; *User Authentication*.
1. Uncheck *Allow users to request password reset links?*.
1. Click *Save*.

### Configuring CAPTCHA or reCAPTCHA

Prevent bots from creating and logging into accounts by enabling CAPTCHA or reCAPTCHA:

1. Navigate to the Control Panel &rarr; *Configuration* &rarr; *System Settings* &rarr; *Security Tools* &rarr; *CAPTCHA*.

    ![The CAPTCHA configuration screen.](./configuring-authentication/images/02.png)

    > **Note:** By default, _Create Account CAPTCHA_ and _Send Password CAPTCHA_ are enabled. If necessary, enable Message Boards CAPTCHA.

1. Choose a CAPTCHA engine. By default, Simple CAPTCHA is enabled. You can also select Google's reCAPTCHA, which requires you configure the external service separately. If you select reCAPTCHA, supply your public and private key from Google.
1. The other options allow developers to customize the Simple CAPTCHA engine.
1. Click *Save* when finished.

## Additional Information

* [Securing Liferay](./01-securing-liferay.md)
* [Securing Web Services](./04-securing-web-services/01-securing-web-services.md)
