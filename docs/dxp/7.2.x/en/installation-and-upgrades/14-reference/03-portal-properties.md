# Portal Properties

Administrators can set portal properties to configure and override Liferay DXP features. A Liferay DXP installation's `portal-impl.jar` embeds the default properties file: [portal.properties](https://docs.liferay.com/dxp/portal/7.2-latest/propertiesdoc/portal.properties.html)

Overriding a portal property requires creating an _extension_ portal properties file that specifies the properties you're overriding. It is a best practice to specify only the properties to be overridden in an extension file.

Here's an example of setting Portal's data source to a MySQL database by adding override properties in a `${Liferay Home}/portal-ext.properties` file:

```
jdbc.default.driverClassName=com.mysql.cj.jdbc.Driver
jdbc.default.url=jdbc:mysql://localhost/lportal?characterEncoding=UTF-8&dontTrackOpenResources=true&holdResultsOpenOverStatementClose=true&serverTimezone=GMT&useFastDateParsing=false&useUnicode=true
jdbc.default.username=jbloggs
jdbc.default.password=pass123
```

   > See [Liferay Home](./01-liferay-home.md) for more information about setting `${liferay.home}`.

The [`include-and-override`](https://docs.liferay.com/dxp/portal/7.2-latest/propertiesdoc/portal.properties.html#Properties%20Override) property specifies portal property files that override the defaults. It specifies the order the files are read:

Properties file prioritization (highest to lowest):

1. `${Liferay Home}/portal-setup-wizard.properties`
1. `${user home}/portal-setup-wizard.properties`
1. `${Liferay Home}/portal-ext.properties`
1. `${user home}/portal-ext.properties`
1. `${Liferay Home}/portal-bundle.properties`
1. `${user home}/portal-bundle.properties`
1. `${Liferay Home}/portal.properties`
1. `portal-impl.jar/portal.properties`

**Important Notes**

* `${Liferay Home}/portal-ext.properties` is the most commonly used file for overriding the defaults.
* `${user home}` refers your user's home folder on each operating system (Linux/Unix: `/usr/Liferay`; Windows: `/Users/Liferay`)
