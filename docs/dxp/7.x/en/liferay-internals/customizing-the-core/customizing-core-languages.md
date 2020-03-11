# Customizing Core Languages

Liferay DXP allows developers to localize the DXP instance and any widget that they create. They can modify the language keys, adapt for languages that are displayed from right to left, and add localized prefixes and suffixes to user names. Lastly, developers can add specific URLs for each locale.  

## Modifying Language Keys

Developers can add or modify certain core UI messages (e.g. _Your request completed successfully._) by [modifying the language keys](https://help.liferay.com/hc/articles/360029122531-Overriding-Language-Keys) that ship by default.

### Right to Left

For languages that are displayed right to left, use the following language properties settings:

```properties
lang.dir=rtl
lang.line.begin=right
lang.line.end=left
```

To display right to left by default, [override these properties globally](https://help.liferay.com/hc/articles/360029122551-Overriding-Global-Language-Keys).

All the global language properties are found inside the `portal-impl.jar`'s `/content` folder.

### Localizing User Names

Administrators can change the prefix and suffix values for a locale. For example, for Spanish, the `language_es.properties` file contains these values:

```properties
lang.user.name.field.names=prefix,first-name,last-name
lang.user.name.prefix.values=Sr,Sra,Sta,Dr,Dra
lang.user.name.required.field.names=last-name
```

For more information, see [Using Liferay Localization Settings](https://help.liferay.com/hc/articles/360029526832-Using-Liferay-s-Localization-Settings).

## Friendly URLs and Locales

You can define unique URLs for specific languages using the `I18nServlet` by editing the instance's `web.xml` file (located inside the `ROOT/WEB-INF` folder):

```xml
<servlet-mapping>
    <servlet-name>I18n Servlet</servlet-name>
    <url-pattern>/ar/*</url-pattern>
</servlet-mapping>
  .
  .
  .
<servlet-mapping>
    <servlet-name>I18n Servlet</servlet-name>
    <url-pattern>/de/*</url-pattern>
</servlet-mapping>
```

The defaults should be sufficient for nearly all circumstances. Because `web.xml` changes require stopping and possibly redeploying Liferay DXP (depending on the application server), test the defaults and make sure modifying these settings are necessary. If this is a clustered environment, make these changes on all the nodes.

## Additional Information

* [Using Liferay Language Settings](https://help.liferay.com/hc/articles/360029526832-Using-Liferay-s-Localization-Settings)
* [Overriding Global Language Keys](https://help.liferay.com/hc/articles/360029122551-Overriding-Global-Language-Keys)
* [Overriding a Module's Language Keys](https://help.liferay.com/hc/articles/360028808452-Overriding-a-Module-s-Language-Keys)
