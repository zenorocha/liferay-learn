# System Settings and Configuration Scope

While browsing the categories of System Settings, you'll notice that clicking into a topic (for example, Blogs) reveals entries at different scopes. All the settings here act at the system scope. For scopes labeled other than System, these configurations act as defaults. In other words, they identify where the system-wide configuration is overridden. True system-scoped configurations (those under a category's _System Scope_ heading) are not overridden anywhere.  There are four values that you'll see under Scope:

**System Scope:** Any System Settings configuration made for system scoped entries becomes the final value for the application in a system-wide fashion. It affects the whole system and isn't overridden anywhere else. 

![Some System Settings entries are system scoped.](./system-settings-and-configuration-scope/images/system-settings-system-scope.png)

**Virtual Instance Scope:** Configuration at the Virtual Instance level is overridden in Instance Settings.

![Some System Settings are virtual instance scoped.](./system-settings-and-configuration-scope/images/system-settings-instance-scope.png)

**Site Scope:** Configuration at this scope is overridden in each site. 

![Some System Settings are site scoped.](./system-settings-and-configuration-scope/images/system-settings-site-scope.png)

**Widget Scope:** Configuration at this scope is overridden in each Widget Instance (like the Blogs example below). 

![Some System Settings entries are widget scoped.](./system-settings-and-configuration-scope/images/system-settings-application-scope.png)

If a configuration changed in System Settings is also configurable at a different scope, the System Settings value acts as a default that can be overridden. Once a configuration change is made at a more granular scope, making a change at the system level doesn't do anything. 

For example, allowing comments is configurable for each Blogs Entry. Set the default behavior at Control Panel &rarr; Configuration &rarr; System Settings &rarr; Blogs. In the Blogs Entry under Widget Scope, disable the *Enable Comments* checkbox. 

Now add a Blog Entry to a Site's Content & Data &rarr; Blogs application. Then go to a public page and add the Blogs Widget to the page. Click the Options button (![Options](../../images/icon-app-options.png)) for the widget and select *Configuration*. You'll see the same Enable Comments checkbox, and its default is now false (unchecked). Checking the box in the Widget Configuration screen breaks its link with the System Settings entry. Changing the System Settings configuration has no effect on this widget anymore.

<!--
CHECK ACCURACY
If an application is configurable from Instance Settings and System Settings, use System Settings to configure it whenever possible. If you use Instance Settings and later want to revert to using the System Settings default configurations, use the *Reset Values* button from the Instance Settings entry. 

![Some Instance Settings entries have a *Reset Values* button so you can safely revert your configuration changes, falling back to the System Settings defaults.](./system-settings-and-configuration-scope/images/instance-settings-reset-values.png)

The Reset Values button removes configuration values from the database so you can rely on the defaults that were provided out-of-the-box. If there is no Reset Values button for an Instance Settings entry, once you use Instance Settings to configure the application, you can't later decide to use System Settings. Only changes to Instance Settings are recognized. 
-->
