# Introduction to Securing Liferay

Liferay DXP is built with security in mind. This includes mitigation of common security vulnerabilities and exploits like those described by the [OWASP Top 10](https://www.owasp.org/index.php/Top_10_2013-Top_10) and the [CWE/SANS Top 25](https://www.sans.org/top25-software-errors/).

There are several aspects of securing a Liferay installation---including, but not limited to, following the best security practices for your hosting environment, database, search provider, application server, and Liferay DXP itself.

```note::
   For example, Liferay DXP relies on the application server for sanitizing CRLF in HTTP headers. You must ensure this is configured properly on the application server. Skipping this configuration may result in security verification products, like Veracode, flagging false positives in security reports.
```

Here you'll learn the basic elements to secure Liferay DXP itself. This includes configuring how users authenticate to your Liferay DXP installation, authorizing users with permissions, configuring secure access to Liferay DXP Web Services, and fine-tuning security features on an as-needed basis.

```important::
   Customers are advised to deploy security patches as they are released. For community and CE installations, we recommend always using the latest community release, which contains all previous security patches.
```

## Authentication

Liferay DXP is flexible in how users may be authenticated to the system. By default, users log into Liferay DXP by using the _Sign In_ widget, which authenticates the user using the portal database. By default, guest users can use the Sign In widget to create accounts with default permissions before logging in. Nearly every element of the default authentication experience can be changed by an administrator. For example,

* Liferay can be [integrated with an SSO to manage](placeholder) authentication.
* Liferay can also be [integrated with LDAP](placeholder) to validate users instead of using the portal database.
* Guest account creation can be [turned off](./authentication-basics.md#disabling-guest-account-creation).

To learn more, see [Configuring Authentication](./authentication-basics.md).

## Permissions

Liferay DXP has a robust role-based access control (RBAC) system. Users can be assigned to Sites, Teams, User Groups, or Organizations. Custom Roles can be created, permissions can be assigned to these Roles, and those Roles can be assigned to Users. Roles are scoped to apply only in a specific context, such as a Site, Organization, or globally. See [Roles and Permissions](../../../users-and-permissions/user-guide/roles-and-permissions/README.md) for more information.

## Securing Web Services

Liferay Web Services have a multi-layered and configurable approach to security and authorization:

* [Service Access Policies](./securing-web-services/setting-service-access-policies.md) control access to remote APIs.
* [Authentication Verifiers](./securing-web-services/using-authentication-verifiers.md) verify provided credentials.
* [Cross-Origin Resource Sharing](./securing-web-services/setting-up-cors.md) configuration can enable retrieving resources from trusted sources only.

See [Securing Web Services](./securing-web-services/securing-web-services.md) to learn more.

## Fine-Tuning Security

There are many ways to fine-tune or disable additional security features:

* Configure Liferay Portal's HTTPS [web server](https://docs.liferay.com/portal/7.2-latest/propertiesdoc/portal.properties.html#Web%20Server) address.
* Configure the list of allowed servers to which users can be [redirected](https://docs.liferay.com/portal/7.2-latest/propertiesdoc/portal.properties.html#Redirect).
* Configure the list of [portlets](https://docs.liferay.com/portal/7.2-latest/propertiesdoc/portal.properties.html#Portlet) that can be accessed from any page.
* Configure the [file types allowed](placeholder) to be uploaded and downloaded.

These features can be configured using [portal properties](https://docs.liferay.com/portal/7.2-latest/propertiesdoc/portal.properties.html).

```warning::
   Liferay Portal's philosophy is "secure by default." Please exercise significant caution when modifying security-specific defaults or white-lists. Such actions may lead to security misconfiguration and an insecure deployment.
```

## Additional Information

For more information about securing a Liferay Portal installation, please see [our security statement](https://www.liferay.com/security), [the community security team](https://portal.liferay.dev/people/community-security-team), and the resources listed on those pages.

There are additional security plugins available from [Liferay Marketplace](https://www.liferay.com/marketplace).

## Next Steps

* [Configuring Authentication](./authentication-basics.md)
* [Securing Web Services](./securing-web-services/securing-web-services.md)
