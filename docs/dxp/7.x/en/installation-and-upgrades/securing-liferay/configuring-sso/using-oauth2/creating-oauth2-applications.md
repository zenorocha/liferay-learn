# Creating an OAuth2 Application

When you have an application that can use OAuth 2.0 for authorization, you must register that application so Liferay can recognize it. Do this by accessing *Control Panel* &rarr; *Configuration* &rarr; *OAuth2 Administration*:

1. Click the *Add* (![add](../../../../images/icon-add.png)) button.

1. Fill out the form ([description below](#oauth2-administration-reference)).

1. Click *Save* to save the application.

    ![Figure 1: Adding an application registers it so users can authorize access to their data.](./introduction-to-using-oauth2/images/01.png)

Excellent! Now you know how to add OAuth2 authorization for your application to Liferay Portal! Next, you must define scopes of user data the application can access.

## OAuth2 Administration Reference

**Name:** Give the application a recognizable title.

**Website URL:** Add a link to the application's website.

**Callback URIs:** Enter at least one (line-separated) URI where users should be redirected after they authorize (or refuse to authorize) access to their accounts. This should link to a handler for whichever Allowed Authorization Types you support (see below).

**Client Profile:** Choose a template that filters the authorization types that are appropriate (secure) for that profile. For example, if your application is a web application, choose *Web Application*, and these authorization types are available and selected automatically: Authorization Code, Client Credentials, Refresh Token, and Resource Owner Password Credentials. These are OAuth 2 "flows" documented in the [OAuth2 RFC 6749 Standards Document](https://tools.ietf.org/html/rfc6749). If you want to select authorization types manually, select *Other*.

**Allowed Authorization Types:** Select the defined OAuth 2 [protocol flows](https://tools.ietf.org/html/rfc6749#section-1.2) your application supports. Several common combinations are defined for you in the various Client Profiles above.

After you save the form, it reappears with additional fields:

**Client ID:** The system generates this for you; it's an identifier for your application, so that @product@ knows what application is being authorized to access user data.

**Client Secret:** Click the *pencil* icon to generate a client secret. The secret identifies the client during the authorization process (see figure
1 above). Not all client profiles require a client secret, because some are incapable of keeping it secret! This is when the aforementioned PKCE code challenge and verifier is needed.

**Icon:** Upload an icon that your application's users identify with your application. This is displayed on the authorization screen.

**Privacy Policy URL:** Add a link to your application's privacy policy.

**Token Introspection:** Allow your application to retrieve metadata from the token by requesting it from @product@. This implements [RFC 7662](https://tools.ietf.org/html/rfc7662).
