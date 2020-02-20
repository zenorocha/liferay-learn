# Patching Tool Configuration

The Patching Tool is configured using properties. The `default.properties` file in the tool's root folder defines the default properties---files named `[profile-name].properties` define each patching profile's properties. Here are the patching tool configuration properties:

**`patching.mode`:** Patches contain updated binary and source files. The patching tool has two modes:

1. `binary` (the default): For updating your DXP installation.

2. `source`: For updating source trees that extend DXP.

**`patches.folder`:** Specify where to store patches. The default location is `./patches`.

**`war.path`:** Specify Liferay DXP's path inside your application server. Alternatively, you can specify a DXP `.war` file to patch and deploy to your application server.

**`global.lib.path`:** Specify the location for storing `.jar` files on the global classpath. If you're not sure, search for `portal-kernel.jar`; it's on the global classpath. This property is only valid if your `patching.mode` is `binary`.

**[`liferay.home`](./liferay-home.md):** Specify the parent folder of the `data`, `osgi`, and `tools` folders.

**`source.path`:** Specify the path to your DXP source tree. This property is only valid if your `patching.mode` is `source`.

## Proxy Settings

Service Pack detection is available behind a proxy server. To configure your proxy, use the following settings, making sure to replace `[PROXY_IP_ADDRESS]` with your proxy server's IP address and replace the port numbers with yours:

```properties
### Proxy settings

# HTTP Proxy

#proxy.http.host=[PROXY_IP_ADDRESS]
#proxy.http.port=80
#proxy.http.user=user
#proxy.http.password=password

# HTTPS Proxy

proxy.https.host=[PROXY_IP_ADDRESS]
proxy.https.port=80
proxy.https.user=user
proxy.https.password=password

# SOCKS Proxy

#proxy.socks.host=[PROXY_IP_ADDRESS]
#proxy.socks.port=1080
#proxy.socks.user=user
#proxy.socks.password=password
```

<!-- The linked article below might need to be ported to the learn repo -->

[Configuring the Patching Tool](/docs/7-2/deploy/-/knowledge_base/d/configuring-the-patching-tool) demonstrates using the configuration properties.
