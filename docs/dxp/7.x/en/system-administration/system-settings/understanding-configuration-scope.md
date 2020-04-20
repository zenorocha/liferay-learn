# Understanding Configuration Scope

Settings for Liferay DXP's services and applications are applied at one of four levels, or _scopes_: System, Virtual Instance, Site, or Widget. Settings made in System Settings are set at a system-scoped level. For scopes labeled other than System, the System Settings values act as defaults. In other words, they identify where the system-wide configuration is overridden. True system-scoped configurations (those under a category's _System Scope_ heading) are not overridden anywhere.

<!-- Ideally, I think it would be more helpful for the below image to be a diagram that represents the concentric circles/or hierarchical nature of how scopes work with regards to this configurations. -->
![Some System Settings categories hold entries of multiple scopes.](./understanding-configuration-scope/images/02.png)

## Scope Definitions

**System Scope:** Configuration made for system scoped entries are the final value for the application in a system-wide fashion. They affect the whole system and are not overridden anywhere else.

![Some System Settings entries are system scoped.](./understanding-configuration-scope/images/01.png)

**Virtual Instance Scope:** Configuration at the Virtual Instance level is overridden in Instance Settings.

![Some System Settings are virtual instance scoped.](./understanding-configuration-scope/images/05.png)

**Site Scope:** Configuration at this scope is overridden in each Site.

![Some System Settings are Site scoped.](./understanding-configuration-scope//images/03.png)

**Widget Scope:** Configuration at this scope is overridden in each Widget Instance.

![Some System Settings entries are widget scoped.](./understanding-configuration-scope/images/04.png)

## Example: Configuring and Overriding Blogs Comments

If a configuration changed in System Settings is also configurable at a different scope, the System Settings value is a default that can be overridden. Once a configuration change is made at a more granular scope, a change at the system level does nothing.

For example, allowing comments is configurable for each Blogs widget. Set the default behavior at Control Panel &rarr; Configuration &rarr; System Settings &rarr; Blogs (in the Content and Data category). In the Blogs Entry under Widget Scope, disable the *Enable Comments* checkbox.

Now add a Blog Entry to a Site's Content & Data &rarr; Blogs application. Then go to a public page and add the Blogs Widget to the page. Click the Options button (![Options](../../images/icon-app-options.png)) for the widget and select *Configuration*. You'll see the same Enable Comments checkbox, and its default is now false (unchecked). Checking the box in the Widget Configuration screen breaks its link with the System Settings entry. Changing the System Settings configuration has no effect on this widget anymore.

![Override widget scoped System Settings from the widget itself.](./understanding-configuration-scope/images/06.png)

## System Settings and Instance Settings

Instance Settings <!-- link to Instance Settings --> is similar to System Settings, but configures applications and services at the Virtual Instance scope. Like System Settings, the configuration entries in Instance Settings have a *Reset to Default Values* option. In Instance Settings, this removes the custom configuration you provided and makes the current value (whether default or custom) from the system scope the default at the virtual instance scope.
