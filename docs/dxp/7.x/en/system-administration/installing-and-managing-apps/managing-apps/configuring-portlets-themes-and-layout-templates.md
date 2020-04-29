# Configuring Portlets, Themes,  and Layout Templates

The Components listing is the easiest way to configure [portlets](https://help.liferay.com/hc/articles/360029046351-Introduction-to-Portlets), [themes](https://help.liferay.com/hc/articles/360035581011-UI-Architecture#themes), and [layout templates](https://help.liferay.com/hc/articles/360028726612-Layout-Templates). In the Components UI, you can enable/disable them and configure permissions on them.

1. Access the Components UI in the Control Panel, by navigating to _Configuration_ &rarr; _Components_. A table of installed portlets appears.

    ![In the Components UI, you can manage the portlets, themes, and layout templates installed on your DXP instance.](./configuring-portlets-themes-and-layout-templates/images/01.png)

1. Select the tab of the component type to view: _Portlets_, _Themes_, or _Layout Templates_.

1. To configure a component, click its name or select _Edit_ from its Actions button (![Actions](./configuring-portlets-themes-and-layout-templates/images/02.png)). The component's configuration screen appears and displays the component's module ID and plugin ID, a checkbox for activating/deactivating the component, and user roles that can be configured for the component.

    ![You can activate or deactivate a component, and change its permissions.](./configuring-portlets-themes-and-layout-templates/images/03.png)

1. Activate or deactivate the component by checking or unchecking the _Active_ checkbox, respectively.

1. To change a role's permission for the component (e.g., a role's _Add to Page_ permission for a portlet), select the role's _Change_ button in the permissions table. This takes you to the Control Panel's &rarr; _Users_ &rarr; _Roles_ screen, where you can change the role's permissions for the component.

Congratulations! You can use the Components listing to examine and manage installed portlets, themes, and layout templates.

## Additional Information

* [Maintaining Clustered Installations](../../../installation-and-upgrades/maintaining-a-liferay-dxp-installation/maintaining-clustered-installations/maintaining-clustered-installations.md)
* [Blacklisting Apps](./blacklisting-apps.md)