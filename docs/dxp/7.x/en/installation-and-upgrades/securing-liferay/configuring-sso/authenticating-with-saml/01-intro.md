# Single Sign-On with SAML

Coming soon!

<!-- The SAML (Security Assertion Markup Language) adapter provides Single Sign On (SSO) and Single Log Off (SLO) in your deployment. SAML works by using Identity Providers (IdP) and Service Providers (SP):

**Identity Provider:** A trusted system that provides single sign-on for users to access other websites.

**Service Provider:** A website that hosts applications and grants access only to identified users with proper credentials.

Liferay DXP instances can serve as either Service Provider (SP) or Identity Provider (IdP).

```note::
   A single Liferay DXP instance is *either* the SP or the IdP in your SSO setup; it can't be both. You can, however, use separate instances for both purposes (for example, one instance is the SP and another is the IdP).
```

You can jump right to configuring SAML or learn how it works:

* [Setting Up Liferay as an Identity Provider](./02-setting-up-identity-provider.md)
* [Registering a Service Provider with your Identity Provider](./03-registering-a-service-provider.md)
* [Setting Up SAML as a Service Provider](04-setting-up-service-provider.md)
* [Configuring SP and IdP Connections](05-configuring-sp-and-idp-connections.md)
* [Setting SAML Options](06-configuring-saml.md)
* [How SAML Works](07-how-saml-works.md)

Visit the Liferay Marketplace to install the [SAML adapter](https://web.liferay.com/marketplace/-/mp/application/15188711).

## What's new in Liferay Connector to SAML 2.0

The `5.0.0` version of the application brings the following improvements:

* Liferay DXP acting as a Service Provider (SP) can now connect to multiple Identity Providers (IdP).
* Developers have an extension point for customizing which Identity Providers users can use to sign in.
* Support for stronger Signature Algorithms (like `SHA-256`)
* Signature method algorithm URLs can now be blacklisted from the metadata (for example, disabling `SHA-1`: `http://www.w3.org/2000/09/xmldsig#rsa-sha1`)

```important::
   If you're upgrading from a Liferay SAML adapter prior to version 3.1.0, your portal properties are automatically migrated to System Settings configurations. Please see the [Setting SAML Options](./06-configuring-saml.md) article for details on settings.
``` -->
