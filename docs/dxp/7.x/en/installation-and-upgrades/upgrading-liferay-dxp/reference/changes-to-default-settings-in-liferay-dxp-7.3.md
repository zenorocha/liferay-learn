# Changes to Default Settings

Most new versions of Liferay DXP include changes to the default settings. If you rely on the defaults from your old version, you should review the changes and decide to keep the defaults from your old version or accept the defaults of the new.

<!-- TODO update with changes from 7.2 to 7.3. jhinkey -->

## Default Settings Changed in 7.0

No existing properties have changed between versions 7.1 and 7.2. However, here are some properties that have changed since version 6.2:

| **Portal Property** | **Old Default** | **Default in DXP 7.2** |
| --- | --- | --- |
| blogs.trackback.enabled | true | false |
| dl.file.entry.thumbnail.max.height | 128 | 300 |
| dl.file.entry.thumbnail.max.width | 128 | 300 |
| layout.set.prototype.propagate.logo | true | false |
| web.server.servlet.check.image.gallery | true | false |

The following properties have been removed:

```properties
organizations.children.types[location]
organizations.children.types[regular-organization]
organizations.country.enabled[location]
organizations.country.enabled[regular-organization]
organizations.country.required[location]
organizations.country.required[regular-organization]
organizations.rootable[location]
organizations.rootable[regular-organization]
organizations.types
users.image.check.token
```

The latest [portal properties reference](https://docs.liferay.com/dxp/portal/7.2-latest/propertiesdoc/portal.properties.html) provides property details and examples. Many properties are now replaced by OSGi configurations, which are accessible through the UI in [System Settings](https://help.liferay.com/hc/en-us/articles/360029131591-System-Settings).
