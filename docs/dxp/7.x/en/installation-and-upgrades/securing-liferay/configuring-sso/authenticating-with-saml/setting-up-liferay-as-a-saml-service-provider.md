# Setting up Liferay as a SAML Service Provider

Coming soon!

<!-- Many of these steps are similar to configuring Liferay DXP as a SAML Identity Provider. As a reminder, a single Liferay DXP installation can be configured as a SAML Identify Provider *or* as a SAML Service Provider but not as both. If your installation is already a SAML Identity Provider, use a *different* Liferay installation as a SAML Service Provider.

```note::
   If you have a third party IdP with Liferay DXP as the SP, all messages coming from the IdP must be signed. If they're not, an error message appears and communication between the IdP and Liferay fails.
```

1. Click on *Control Panel* &rarr; *Configuration* and then on *SAML Admin*. Select the *Service Provider* SAML role. Choose your own entity ID. Then click *Save* and a new section entitled Certificate and Private Key appears.

1. The Certificate and Private Key section is for creating a keystore for SAML. Click *Create Certificate* and enter the following information:

    * Your common name (your first and last name)
    * The name of your organization
    * The name of your organizational unit
    * The name of your city or locality
    * The name of your state or province
    * The name of your country
    * The length in days that your keystore will remain valid (how long before the keystore expires)
    * The key algorithm (RSA is the default)
    * The key length in bits (2048 is the default)
    * The key password

    Remember that the keystore has two storage options: file system storage (the default) and Documents and Media storage. By default, the certificate uses the `SHA256` algorithm for encryption and is fingerprinted and self-signed via `MD5` and `SHA256`. When you enter all the required information, click *Save*.

1. After you clicked *Save*, check that you can view information about your certificate or download your certificate. If you can, you successfully created a keystore. After you create a keystore, additional options appear. There are three tabs:

    **General**: Enables or disables SAML SP and manages the required keystore.

    **Service Provider**: This tab manages basic and advanced configurations for the SP.

    **Identity Provider Connection**: This tab manages connections to the IdP. There can be multiple IdP connections.

1. You can also generate an encryption certificate. This is a separate key for encrypting assertions. If you want assertions encrypted, you must generate a key for this. The procedure is exactly the same as generating your certificate in step 2 above.

1. Next, you must configure an Identity Provider connection. Click on the *Identity Provider Connections* tab. Enter a name for the Identity Provider, enter its entity ID, and enter its metadata URL. If you have already followed the previous instructions and configured a separate Liferay DXP installation as an Identify provider, you'd enter the following information:

    * Name: *Liferay IdP*
    * Entity ID: [ID of IdP]
    * Clock Skew: Set the tolerance in milliseconds between SP and IdP.
    * Force Authn: Whether the IdP should force re-authentication regardless of context.
    * Metadata URL: http://localhost:8080/c/portal/saml/metadata (test this URL first)
    * Name Identifier Format: See settings.
    * Attribute Mapping: See settings.
    * Keep Alive URL: See settings.

    ```important::
       The Liferay Connector to SAML 2.0 app supports using *either* a URL to a SAML IdP metadata file *or* an actual (uploaded) SAML metadata XML file. The value entered in the *Metadata URL* field is persisted to the database only when there a metadata URL and there is no specified metadata XML file. Otherwise, Liferay DXP keeps the original metadata URL in its database. This behavior ensures that once a metadata URL has been specified, there is always a metadata URL saved in the database. This way, if you forget the previously entered metadata URL or its format, you can look at the displayed metadata URL and choose to modify the displayed metadata URL or overwrite the previously saved metadata URL by specifying a metadata XML file.
    ```

1. Finally, after you save your certificate and private key information and configure an Identity Provider connection, check the *Enabled* box at the top of the General tab and click *Save*. Liferay is now a SAML Service Provider!

Note that the SAML Service Provider session is tied to the normal session on the application server. Session expiration on the application server terminates the session on the Service Provider but does not initiate single logout.

You can add multiple IdP connections. To add another Identity Provider, click *Add Identity Provider* again and enter the details for the other provider. When users log in, they are asked to choose an identity provider, so be sure to name the providers so users can recognize them.

## Checkpoint

1. A SAML keystore has been generated.

1. Verify the connection to the IdP.

    a. *Name*: generic name for the IdP.

    b. *Entity ID*: the same name of the IdP. If the IdP is another @product@ instance, then it is the same name as the above example.

    c. *Metadata URL*: The IdP's metadata as a URL or as an XML file.

    d. If the IdP is another @product instance, ensure its corresponding Service Provider Connection for this SP is enabled.

1. On the *General* tab, the *Enabled* checkbox has been checked.

1. Once *Enabled* checkbox has been checked, the service provider's metadata becomes available:

```
[host]:[port]/c/portal/saml/metadata
```

## Setting Up Liferay DXP as a SAML Service Provider in a Clustered Environment

You can use the Liferay Connector to SAML 2.0 app as an SSO solution for a clustered @product@ environment. If your multi-node cluster is behind a load balancer, you must enable all the nodes as SPs, and they must share the same keystore manager.

If using the Filesystem Keystore Manager (the default):

1. Configure each node of your [Liferay cluster](../../../02-setting-up/07-performance/01-clustering.md) as a SAML service provider as above.

1. Copy the keystore file (`[Liferay Home]/data/keystore.jks`, by default) from the first node to the remaining nodes. This file is the Java keystore that's created by the SAML Provider app. The keystore contains the valid or self-signed certificate managed by the SAML connector app.

1. Verify that the service provider metadata has been generated to be used either as a URL or an XML file. The metadata is the same for all nodes because of the same database back-end. The IdP's request goes through the load balancer.

1. At this point, all  nodes have the same SAML SP configuration and each of them can respond to web requests and handle the SAML protocol. To test your SSO solution, sign into Liferay via your load balancer, navigate to a few pages of a few different sites, and then log out.

If using the Document Library Keystore Manager, skip step 2 because the keystore file is stored in the database shared by all the nodes.

Now you know how to configure Liferay DXP either as a SAML identity provider or a service provider. You also know how to configure SAML in a clustered environment. -->
