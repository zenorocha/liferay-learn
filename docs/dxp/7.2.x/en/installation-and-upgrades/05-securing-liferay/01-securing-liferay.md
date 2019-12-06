---
header-id: securing-liferay
---

# Securing Liferay

Liferay makes every effort to keep its products secure. By following the OWASP Top 10 (2013) and CWE/SANS Top 25 recommendations, we protect the product against known attacks and security vulnerabilities. Here are some examples: 

- Service Builder protects Liferay Portal's persistence layer by using Hibernate and parameter-based queries. 
- To prevent Cross Site Scripting (XSS), user-submitted values are escaped on output. 
- Liferay Portal includes protection against other common attacks: 
  - CSRF
  - Local File Inclusion
  - Open Redirects
  - Uploading and serving files of dangerous types
  - Content Sniffing
  - Clickjacking
  - Path Traversal
  - Quadratic Blowup XXE
  - Rosetta Flash vulnerability
  - Reflected File Download
  - And more.

!!! qualifier "Note"
    Liferay Portal relies on the application server for sanitizing CRLF in HTTP headers. You should, therefore, make sure this is configured properly in your application server, or you may experience false positives in reports from automatic security verification software such as Veracode. There is one exception to this for Resin, which does not have support for this feature. In this case, Liferay Portal sanitizes HTTP headers.

When setting up Liferay Portal for use, you should review the default security configuration: 

- Authentication 
- Single Sign-On
- Web Services access and authorization

## Permission Checking

Users can be assigned to Sites, Teams, User Groups, or Organizations. Custom Roles can be created, permissions can be assigned to these Roles, and those Roles can be assigned to users. Roles are scoped to apply only in a specific context, such as a Site, Organization, or globally. See [Roles and Permissions](../user-and-system-management/roles-and-permissions.md) for more information.

There are additional security plugins available from [Liferay Marketplace](https://www.liferay.com/marketplace). For example, an Audit plugin tracks user actions, and an AntiSamy plugin helps clear HTML from XSS vectors. 

## Fine-Tuning Security

There are many ways to fine-tune or disable various security features: 

- Disable the Sign In portlet's *Create Account* link
- Configure Liferay Portal's HTTPS web server address
- Configure the list of allowed servers to which users can be redirected
- Configure the list of portlets that can be accessed from any page
- Configure the file types allowed to be uploaded and downloaded. 

Please see [portal properties](https://docs.liferay.com/portal/7.2-latest/propertiesdoc/portal.properties.html) for more information. 

## Secure Configuration and Run Recommendations

Liferay Portal's philosophy is "secure by default." You shouldn't disable built-in protections or allow all values in security white-lists. Such acts may lead to security misconfiguration and an insecure deployment. 

For more information about securing a Liferay Portal installation, please see [our security statement](https://www.liferay.com/security), [the community security team](https://portal.liferay.dev/people/community-security-team), and the resources listed on those pages.

Customers are advised to deploy security patches when they are released. For community and CE deployments, stay secure by always using the latest community version, which contains all previous security patches. 
