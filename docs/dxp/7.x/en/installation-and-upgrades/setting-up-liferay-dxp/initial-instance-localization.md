# Initial Instance Localization

Liferay DXP supports localization by language, time zone, and more. The English (US) language translation and GMT time zone are the defaults, but DXP has over 40 translations and can be set to any time zone. Localization is scoped for virtual instances, widgets in each instance, and individual users. As you set up DXP, you can configure the virtual instance default language and time zone using these interfaces:

* [Portal Properties](#portal-properties): Specify defaults in a properties file before starting the application server.
* [Setup Wizard](#setup-wizard): Set defaults via a UI as a part of launching DXP.
* [Control Panel](#control-panel): Modify defaults via a UI after launching the DXP instance.

## Portal Properties

If you want to configure the default virtual instance's localization before starting DXP, use a [`portal-ext.properties` file](../reference/portal-properties.md).

| **Portal Property** | **Description** |
| :------------------ | :-------------- |
| `company.default.locale` | Set it to any available locale, defined for the [`locales`](https://docs.liferay.com/ce/portal/7.3-ga2/propertiesdoc/portal.properties.html#Languages%20and%20Time%20Zones) portal property. |
| `company.default.time.zone` | Set it to any of the time zones defined in the [`time.zones`](https://docs.liferay.com/ce/portal/7.3-ga2/propertiesdoc/portal.properties.html#Languages%20and%20Time%20Zones) portal property. |

For example,

```properties
company.default.locale=pt_PT
company.default.time.zone=Europe/Lisbon
```

The properties above localize the virtual instance for users in Lisbon, Portugal.

## Setup Wizard

The [Setup Wizard](../installing-liferay/running-liferay-for-the-first-time.md) sets the DXP instance's default language and time zone. They're available to select in the _Default Language_ and _Time Zone_ selectors.

![Use the Setup Wizard to set the DXP instance's default language and time zone](./initial-instance-localization/images/01.png)

The Setup Wizard is enabled by default for [Liferay-Tomcat Bundles](../installing-liferay/installing-a-liferay-tomcat-bundle.md) and [application server installations](../installing-liferay/installing_liferay_on_an_application_server.html).

If you have already launched DXP, change the instance's default language and time zone in the Control Panel.

## Control Panel

A virtual instance's default language and time zone can be modified using the instance's _Localization_ page. See [Configuring a Virtual Instance Localization](../../system-administration/virtual_instances.html) <!-- placeholder link for now--> for instructions.

## Conclusion

You have configured your DXP instance's default language and time zone. If want to explore more information on localizing DXP, including how to facilitate choosing locales, please see [Site Localization](../../site-building/06-site-settings/site_localization.html)<!-- placeholder link for now-->.

## Additional Information

* [Configuring a Virtual Instance Localization](../../system-administration/virtual_instances.html)

* [Overriding Global Language Keys](https://help.liferay.com/hc/en-us/articles/360029122551-Overriding-Global-Language-Keys)

* [Localizing Your Application](https://help.liferay.com/hc/en-us/articles/360028746692-Localizing-Your-Application)