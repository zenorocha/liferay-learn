# Using Factory Configuration

Most Liferay DXP System Settings allow just one set of configurations for an entry. To change the configuration, you update the single configuration form, and it applies throughout the [affected configuration scope](./understanding-configuration-scope.md). Less commonly, a configuration supports multiple entries that simultaneously coexist: these are called *factory configurations*. For factory configurations, each configuration set provides a unique configuration. A common usage is for configuring system-scoped connections to third party servers (e.g., LDAP and Elasticsearch). Since each connection to these servers requires unique configuration values, a factory configuration is used to make it possible.

```tip::
    Factory Configuration Example: `Adding Organization types <../../users-and-permissions/organizations/adding-a-new-organization-type.md>`_ is supported, and is useful if you need to model real-life hierarchies or enforce hierarchical rules. In Liferay DXP, each Organization type is created via a factory configuration entry in System Settings.
```

## Identifying Factory Configurations

If a service supports factory configurations, its System Settings entry has an Add button. 

![If a System Settings entry has an ADD button, it supports factory configuration.](./using-configuration-files/images/01.png)

Click the Add button ![Add](../../images/icon-add.png) to add a new set of configuration values.

## Factory Configuration Files

As with single-instance configurations, you can set factory configurations in the System Settings interface (using the Add button described above) or via [configuration files](./using-configuration-files.md). A standard single-instance configuration file uses the fully qualified class name of the configuration object, appended by `.config`: 

```bash
my.service.ServiceConfiguration.config
```

If your service supports factory configurations, use the convention of calling the configuration's first instance `-default.config`. The default Organization type is named in this way: 

```bash
com.liferay.organizations.internal.configuration.OrganizationTypeConfiguration-default.config
```

The next instance contains a unique *subname* (something other than *default*). It's good practice to use a descriptive name that sheds light on when this instance should be used. Following the example from [Adding a New Organization Type](../../users-and-permissions/organizations/adding-a-new-organization-type.md), you could add the _League_ type with a configuration file named 

```bash
com.liferay.organizations.internal.configuration.OrganizationTypeConfiguration-league.config
```

```warning::
   Providing a configuration file with a subname forces a factory configuration scenario, even if the service isn't designed to accept multiple configuration entries. Use the System Settings UI as described above to determine if using factory configurations is supported for a configuration entry. 
```

Some System Settings entries that support factory configuration don't ship with a configuration file for the default instance (e.g., the Anonymous User entry). If you export a factory configuration file to obtain the `.config` file, it doesn't use the `-default.config` naming convention. Instead, whether it's the first occurrence or an additional one, it's given a guaranteed unique identifier for its subname:

```bash
com.liferay.user.associated.data.web.internal.configuration.AnonymousUserConfiguration-6befcd73-7c8b-4597-b396-a18f64f8c308.config
```

If you're exporting the configuration file for deployment in a separate system, you can rename part of the exported filename after the first `-` to use a more descriptive subname. Be careful: if you rename the file and deploy it to the same system it was exported from, the new subname marks it as an entirely new configuration. You'll end up with an additional configuration instance in this case, not just a renamed one.

```warning::
   For configuration entries supporting factory configurations, omitting the subname from a `.config` file's name causes System Settings to disallow adding new entries for the configuration entry targeted by this `.config` file. This is caused by a known bug. See `LPS-76352 <https://issues.liferay.com/browse/LPS-76352>`_ for more information. Once an improperly named configuration file is deployed, you can't add any entries for the configuration in question from its System Settings entry.

   Deploying an erroneous (lacking a subname) `.config` file doesn't disable anything permanently. Rename the file using the proper convention described above or remove it entirely and start over.
```
