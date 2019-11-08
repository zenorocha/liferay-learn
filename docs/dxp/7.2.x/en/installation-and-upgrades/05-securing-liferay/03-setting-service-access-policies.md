# Service Access Policies

*Service Access Policies* comprise a layer of web service security that defines services or service methods that can be invoked remotely. You can apply many of them at once to produce a combined effect. They are the [second layer of security](./01-securing-liferay.md#web-services) (after IP permissions) for web services. 

Service Access Policies define a whitelist for methods exposed via web service invocation. You can use wildcards to define classes and methods that are whitelisted. Note that Service Access Policies respect the permissions system. If a policy grants a user access to a remote service, that user must still have the appropriate permissions to invoke that service. 

## Default Service Access Policies

To view and manage Service Access Policies, go to *Control Panel* &rarr; *Configuration* &rarr; *Service Access Policy*. There are 16 Service Access Policies enabled by default. Six of these have to do with the system: 

**ASSET_ENTRY_DEFAULT:** Allows the view counter for assets to be updated when an asset is retrieved.

**CALENDAR_DEFAULT:** Makes it possible to search public events in the calendar.

**SYNC_DEFAULT:** Allows only the `com.liferay.sync.service.SyncDLObjectService.getSyncContext` method. It applies to every Liferay Sync request, including unauthenticated Sync requests.

**SYNC_TOKEN:** Allows `com.liferay.sync.service.*`, meaning that any API function that's a method of a class in this package can be invoked. It applies to Sync requests which are accompanied by an authentication token.

**SYSTEM_DEFAULT:** Allows access to country/region services by JavaScript calls, so users can switch languages on the fly. Applies to every request, including unauthenticated requests.

**SYSTEM_USER_PASSWORD:** Allows any method to be invoked. Of course, since API functions include permission checks, this call works only if the user has the required permission. It applies to requests for which `AuthVerifierResult.isPasswordBasedAuthentication` is `true`: i.e., whenever user authentication took place using a password. If you want to completely disallow certain API functions from being invoked, you can change the `SYSTEM_USER_PASSWORD` policy to something more restrictive than `*`.

`SYNC_DEFAULT` and `SYSTEM_DEFAULT`, as their names suggest, are default service access policies. Default service access policies are applied to all incoming requests, including unauthenticated requests. 

The other 10 policies have to do with OAuth and JSON web services: 

**OAUTH2_analytics.read/write:** Integrates with [Liferay Analytics Cloud](https://www.liferay.com/products/analytics-cloud), allowing it access to JSON web services. 

**OAUTH2_everything/read/documents/userprofile/write:** The Everything policies grant access to all the JSON web services for various reasons. Everything is everything: all JSON web services (matches `*`). The others match method signatures appropriate to their description. For example, OAUTH2_everything.read matches all methods starting with `fetch`, `get`, `has`, `is`, or `search`. 

**OAUTH_READ/WRITE:** These provide access to JSON web services via the OAuth 1.0a plugin. 

The default configuration makes available corresponding scopes that provide access to all web services shipped with the system. The scopes must be assigned to OAuth 1 or 2 applications before they become usable. Administrators should review the ones you want to use and disable the others. 

You can create new Service Access Policies. 

## Creating Service Access Policies

When creating or editing service access policies, keep these points in mind:

- Service access policy names must be unique per portal instance.
- Service access policy names can include only these allowed characters:

```
0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz#:@-./_
```

- Service access policy titles can be localized; service access policy names cannot be localized.
- Allowed service signatures must be entered one per line. Wildcards (`*`) are allowed for both class names and method names. The `#` symbol must be used to separate a class name from a method name. 

For example, `com.liferay.portal.kernel.service.UserService` allows any method from the `UserService` class to be invoked. `com.liferay.document.library.kernel.service.DLAppService#get*` allows any method from the `DLAppService` that starts with `get` to be invoked. Thus, 

```java
com.liferay.portal.kernel.service.UserService
com.liferay.document.library.kernel.service.DLAppService#get*
```

allows any method from the `UserService` class to be invoked and any method from the `DLAppService` whose name starts with `get` to be invoked. 

To create a new Service Access Policy, follow this procedure: 

1.  Navigate to the *Configuration* &rarr; *Service Access Policy* section of the Control Panel. 
 
2.  Click *Add* (![add](../../images/icon-add.png)). 
 
3.  Give your policy a name. 

4.  Flip the switch to enable your policy.

5.  If you want the policy applied to unauthenticated requests as well as authenticated requests, flip the switch labeled *Default*. 

6.  Give your policy a localized title. 

7.  Under Allowed Service Signatures, start typing the fully qualified name of a service class that's installed. Code completion helps you find the class. For example, if you're creating a policy for Liferay's Knowledge Base application, you could enter `com.liferay.knowledge.base.service.KBArticleService`. 

8.  Under Method Name, start typing a service method call. Again, code completion helps you. For Knowledge Base, you could enter `getKBArticle`. 

9.  To specify another service or method, click the plus icon to add another entry. 

10. When done, click *Save*. 

!!! qualifier "Note"
    If you know all the method signatures ahead of time, you can click *Switch to Advanced Mode* and enter them all in one field on separate lines. 

Liferay applications can declare their own default policies (the `SYNC_DEFAULT` policy is a good example). This policy can then be changed or disabled by administrators. In this case, the plugin can still verify that the policy exists so there is no need to redefine or update it.

By default, Liferay's tunneling servlet uses the `SYSTEM_USER_PASSWORD` service access policy. You can, however, create your own policy for the tunneling servlet and use the property `service.access.policy.name` for the `TunnelingServletAuthVerifier` to specify that your policy should be used instead.

## Configuring the Service Access Policy Module

Liferay's service access policy functionality is provided by the Service Access Policy module. This module includes the following important classes:

- `com.liferay.portal.kernel.security.service.access.policy.ServiceAccessPolicy`: defines the public interface for `ServiceAccessPolicy`.
- `com.liferay.portal.kernel.security.service.access.policy.ServiceAccessPolicyManager`: defines the public interface for retrieving instances of `ServiceAccessPolicy`.
- `com.liferay.portal.kernel.security.service.access.policy.ServiceAccessPolicyManagerUtil`: bridges service access policy functionality to the parts of Liferay's core that have not yet been modularized.
- `com.liferay.portal.kernel.security.service.access.policy.ServiceAccessPolicyThreadLocal`: makes `ServiceAccessPolicy` instances active.

Liferay's Service Access Policy module resides in the `modules/apps/service-access-policy` folder in the source code. When running, these three bundles provide the service access policy functionality (they're in the `[Liferay Home]/osgi/modules` folder):

- `com.liferay.service.access.policy.api.jar`
- `com.liferay.service.access.policy.service.jar`
- `com.liferay.service.access.policy.web.jar`

These modules provide the service access policy management UI that's accessible from the Control Panel. They also provide the interface and default implementation for `ServiceAccessPolicy`.

To configure the Service Access Policy module, navigate to the Control Panel, click on *System Settings*, and find the *Service Access Policies* module in the Security section. Click on its name to edit it. Here, you can edit the default service access policy configuration. You can also force a default policy to be applied even when no policies are applied by the `AuthVerifier`.

There's also an `AuthenticatedAccessControlPolicy`. This policy doesn't do anything if a `ServiceAccessPolicyManager` implementation is present. If the service access policy module is disabled, however, the `AuthenticatedAccessControlPolicy` provides a fallback that still requires authenticated access for web services.

## Summary

Great! Now you know service access policies can restrict access to @product@'s web services. Custom service access policies can be created by portal administrators. They are applied by the portal's token authenticator, e.g., by OAuth.

## Related Topics

[Creating Service Access Policies](../../platform/service-access-policies.md) 
