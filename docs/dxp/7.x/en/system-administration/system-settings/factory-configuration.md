# Factory Configuration

Configurations supporting multiple entries are called *factory configurations*. 

> Factory Configuration Example: [Adding Organization types](../../users-and-permissions/organizations/adding-a-new-organization-type.md) is supported, and is useful if you need to model real-life hierarchies or enforce hierarchical rules. In Liferay DXP, each Organization type is created via a factory configuration entry in System Settings.

If a service is meant to support factory configurations, its System Settings entry has an Add button. 

![If a System Settings entry has an ADD button, it's suitable for factory configurations.](./factory-configuration/images/01.png)

As with single-instance configurations, you can set factory configurations in the System Settings interface (using the Add button described above) or via configuration files. A standard single-instance configuration file is named with the fully qualified class name of the configuration object, appended by `.config`: 

```bash
my.service.ServiceConfiguration.config
```

If your service supports factory configurations, use the convention of calling the configuration's first instance `-default.config`: 

```bash
my.service.ServiceConfiguration-default.config
```

The next instance contains a unique *subname* (something other than *default*). It's good practice to use a descriptive name that sheds light on when this instance should be used: 

```bash
my.service.ServiceConfiguration-port9080.config
```

In the Organization type example, the default Organization type (aptly named _organization_) is created by a `-default.config` file named

```bash
com.liferay.organizations.internal.configuration.OrganizationTypeConfiguration-default.config
```

This `-default.config` configuration creates the _organization_ Organization type. Following the example from the [Adding a New Organization Type](../../users-and-permissions/organizations/adding-a-new-organization-type.md) article, you could add the _League_ type with a configuration file named 

```bash
com.liferay.organizations.internal.configuration.OrganizationTypeConfiguration-league.config
```

Some System Settings entries that support factory configuration don't ship with a configuration file for the default instance (e.g., the Anonymous User entry). If you export a factory configuration file to obtain the `.config` file, it doesn't use the `-default.config` naming convention. Instead, whether it's the first occurrence or an additional one, it's given a guaranteed unique identifier for its subname:

```bash
com.liferay.user.associated.data.web.internal.configuration.AnonymousUserConfiguration-6befcd73-7c8b-4597-b396-a18f64f8c308.config
```

If you're exporting the configuration file for deployment in a separate system, you can rename part of the exported filename after the `-` to use a more descriptive subname. Be careful though, if you rename the file and deploy it to the same system it was exported from, the new subname marks it as an entirely new configuration. You'll end up with an additional configuration instance in this case, not just a renamed one.

```warning::
   For configuration entries supporting factory configurations, omitting the subname from a `.config` file's name causes System Settings to disallow adding new entries for the configuration entry targeted by this `.config` file. This is caused by a known bug. See [LPS-76352](https://issues.liferay.com/browse/LPS-76352) for more information. Once an improperly named configuration file is deployed, you can't add any entries for the configuration in question from its System Settings entry.

   Deploying an erroneous (lacking a subname) `.config` file doesn't disable anything permanently. Just rename the file using the proper convention described above or remove it entirely and start over.
```

## Forced Factory Configuration

In many cases, configuration files can be used to force a factory configuration scenario, but not all configurations can be used this way. It's best to stick to the intended use cases. Use System Settings as described above to determine if using factory configurations is intended for a configuration entry. If not, use the single occurrence mode of configuration (specifying only one configuration file for the service). 
