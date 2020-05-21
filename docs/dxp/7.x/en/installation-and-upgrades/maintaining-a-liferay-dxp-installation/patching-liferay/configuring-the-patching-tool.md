# Configuring the Patching Tool

The Patching Tool can be adapted to the way you installed DXP. The tool's auto-discovery option is the easiest way to configure the Patching Tool. If you installed DXP on an application server or if you need to proxy Patching Tool requests, you can configure the Patching Tool manually where you need to.

**Outline:**

* [Automatic Configuration Using `auto-discovery`](#automatic-configuration-using-auto-discovery)
* [Testing the Configuration](#testing-the-configuration)
* [Manual Configuration](#manual-configuration)
* [Using Patching Profiles](#using-patching-profiles)

## Automatic Configuration Using `auto-discovery`

The Patching Tool's `auto-discovery` command scans for DXP files and writes their paths to a properties file that it uses for patching.

Follow these steps to automatically configure the Patching Tool:

1. Open a command line to your `patching-tool` folder:

    ```bash
    cd patching-tool
    ```

1. Run the auto-discovery command.

    If [Liferay Home](../../reference/liferay-home.md) is the Patching Tool's parent folder, run this command:

    ```bash
    ./patching-tool.sh auto-discovery
    ```

    If [Liferay Home](../../reference/liferay-home.md) is in a different location, specify the Liferay Home path to the command:

    ```bash
    ./patching-tool.sh auto-discovery [path to Liferay Home]
    ```

The tool writes the configuration to the file `default.properties`.

If you specify the wrong path to Liferay Home or if Liferay Home is not in the parent folder, the Patching Tool reports an error like this:

```
The .liferay-home has not been detected in the given directory tree.

Configuration:
patching.mode=binary
war.path=../tomcat-9.0.17/webapps/ROOT/
global.lib.path=../tomcat-9.0.17/lib/ext/
liferay.home=**[please enter manually]**

The configuration hasn't been saved. Please save this to the default.properties file.
```

Resolve the issue using one of these ways:

* If the Liferay Home is in the Patching Tool's tree, create a `.liferay-home` file in the Liferay Home folder and re-run the `auto-discovery` command.
* Specify the Liferay Home path in the `liferay.home` property in your properties file (e.g., `default.properties`).

## Testing the Configuration

When the Patching Tool is configured, running the `info` command reports all product information and patch information like this:

```
/patching-tool>./patching-tool.sh info
Loading product and patch information...
Product information:
  * installation type: binary
  * build number: 7210
  * service pack version:
    - available SP version: 1
    - installable SP version: 1
  * patching-tool version: 2.0.13
  * time: 2019-12-05 14:02Z
  * host: 91WRQ72 (8 cores)
  * plugins: no plugins detected
  ...
```

If the information isn't correct, edit the configuration manually.

## Manual Configuration

Edit the Patching Tool properties file. The `auto-discovery` command creates a `default.properties` file by default or creates the file (e.g., [Patching Profile](#using-patching-profiles)) you specify to it.

### General Properties

| Property | Description |
| :------- | :---------- |
| `global.lib.path` (`binary` mode only) | Specifies the location for storing `.jar` files on the global classpath. Hint: `portal-kernel.jar` is on the global classpath. |
| `liferay.home` | Specifies the [Liferay Home](../../reference/liferay-home.md) folder, which is typically the parent folder to DXP's `osgi` and `tools` folders. |
| `module.framework.core.path` | Path to DXP's `osgi/core` folder. |
| `module.framework.marketplace.path` | Path to DXP's `osgi/marketplace` folder. |
| `module.framework.modules.path` | Path to DXP's `osgi/modules` folder. |
| `module.framework.portal.path` | Path to DXP's `osgi/portal` folder. |
| `module.framework.static.path` | Path to DXP's `osgi/static` folder. |
| `patches.folder` | Specifies where to store patches. The default location is `./patches`. |
| `patching.mode` | Patches contain updated binary and source files. The mode determines which file type to apply.<br><br>* `binary` (the default): For updating your DXP installation.<br>* `source`: For updating source trees that extend DXP. |
| `source.path` (`source` mode only) | Specifies the DXP source tree location. |
| `war.path` | Specifies the path to your DXP web application (the path to its exploded folder structure or to its `.war` file). |

### Proxy Settings

Service Pack detection is available behind a proxy server. To configure your proxy, use one of the following setting groups and replace all of the values, including `[PROXY_IP_ADDRESS]`:

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

## Using Patching Profiles

You can create profiles for multiple runtimes by running auto-discovery or creating profiles manually. To auto-discover a DXP runtime, run the Patching Tool with parameters like this:

```bash
./patching-tool.sh [name of profile] auto-discovery [path/to/Liferay Home]
```

This runs the same discovery process and writes the profile information to a file called `[name of profile].properties`. Alternatively, you can create and edit profile property files in your `patching-tool` folder.

Once you've created a profile, you can use it in your Patching Tool commands. For example, this command installs a patch using a profile file called `test-server.properties`:

```bash
./patching-tool.sh test-server install
```

## Additional Information

* [Installing Patches](./installing-patches.md)
* [Installing the Patching Tool](./installing-the-patching-tool.md)