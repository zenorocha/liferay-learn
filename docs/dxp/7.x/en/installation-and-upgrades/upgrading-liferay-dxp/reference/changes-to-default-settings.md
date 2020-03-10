# Changes to Default Settings

Most new versions of Liferay DXP include changes to the default settings. If you rely on the defaults from your old version, you should review the changes and decide to keep the defaults from your old version or accept the defaults of the new.

The settings changes are listed by release.

* [Default Settings Changed in 7.3](#default-settings-changed-in-7-3)
* [Default Settings Changed in 7.2](#default-settings-changed-in-7-2)
* [Default Settings Changed in 7.1](#default-settings-changed-in-7-1)
* [Default Settings Changed in 7.0](#default-settings-changed-in-7-0)

## Default Settings Changed in 7.3

| **Portal Property** | **7.2 Default** | **7.3 Default** |
| --- | --- | --- |
| image.io.use.disk.cache | true | false |
| setup.database.jar.url[com.mysql.cj.jdbc.Driver] | http* | https* |
|  cluster.link.channel.properties.control | see [value](https://docs.liferay.com/dxp/portal/7.2-latest/propertiesdoc/portal.properties.html) | jgroups/udp_control.xml |
| cluster.link.channel.properties.transport.0= | see [value](https://docs.liferay.com/dxp/portal/7.2-latest/propertiesdoc/portal.properties.html) | jgroups/udp_transport.xml |
| jsonws.web.service.paths.excludes | *blank* | /user/update-password |
| retry.data.source.max.retries | 100 | 0 |
| admin.obfuscated.properties | see [value](https://docs.liferay.com/dxp/portal/7.2-latest/propertiesdoc/portal.properties.html) | see [value](https://docs.liferay.com/ce/portal/7.3-ga1/propertiesdoc/portal.properties.html) |
| spring.configs | see [value](https://docs.liferay.com/dxp/portal/7.2-latest/propertiesdoc/portal.properties.html) | dropped META-INF/fabric-spring.xml and META-INF/asset-spring.xml |
| session.shared.attributes | see [value](https://docs.liferay.com/dxp/portal/7.2-latest/propertiesdoc/portal.properties.html) | dropped org.apache.struts.action.LOCALE |
| session.phishing.protected.attributes | see [value](https://docs.liferay.com/dxp/portal/7.2-latest/propertiesdoc/portal.properties.html) | added SETUP_WIZARD_PASSWORD_UPDATED |
| json.deserialization.whitelist.class.names | see [value](https://docs.liferay.com/dxp/portal/7.2-latest/propertiesdoc/portal.properties.html) | added com.liferay.portal.kernel.util.GroupSubscriptionCheckSubscriptionSender and com.liferay.portal.kernel.util.SubscriptionSender |
| module.framework.services.ignored.interfaces | see [value](https://docs.liferay.com/dxp/portal/7.2-latest/propertiesdoc/portal.properties.html) | added com.liferay.trash.kernel.service.* |
| module.framework.properties.org.osgi.framework.bootdelegation | see [value](https://docs.liferay.com/dxp/portal/7.2-latest/propertiesdoc/portal.properties.html) | dropped javax.validation and javax.validation.* |
| module.framework.web.generator.excluded.paths | see [value](https://docs.liferay.com/dxp/portal/7.2-latest/propertiesdoc/portal.properties.html) | added WEB-INF/lib/jackson-databind.jar and WEB-INF/lib/portletmvc4spring-framework.jar; dropped WEB-INF/lib/spring-webmvc-portlet.jar |
| admin.obfuscated.properties |  see [value](https://docs.liferay.com/dxp/portal/7.2-latest/propertiesdoc/portal.properties.html) | dropped captcha.engine.recaptcha.key.private |

## Default Settings Changed in 7.2

| **Portal Property** | **7.1 Default** | **7.2 Default** |
| --- | --- | --- |
| hot.deploy.listeners | see [value](https://docs.liferay.com/dxp/portal/7.1-latest/propertiesdoc/portal.properties.html) | dropped com.liferay.portal.deploy.hot.SpringHotDeployListener |
| spring.configs | see [value](https://docs.liferay.com/dxp/portal/7.1-latest/propertiesdoc/portal.properties.html) | dropped META-INF/cluster-spring.xml, META-INF/comment-spring.xml, META-INF/monitoring-spring.xml |
| jdbc.default.driverClassName | com.mysql.jdbc.Driver | com.mysql.cj.jdbc.Driver |
| jdbc.default.url | see [value](https://docs.liferay.com/dxp/portal/7.1-latest/propertiesdoc/portal.properties.html) | added &serverTimezone=GMT |
| ehcache.multi.vm.config.location | /ehcache/liferay-multi-vm-clustered.xml | /ehcache/liferay-multi-vm.xml |
| company.security.send.password | true | false |
| locales | see [value](https://docs.liferay.com/dxp/portal/7.1-latest/propertiesdoc/portal.properties.html) | added kk_KZ and ta_IN |
|locales.beta | see [value](https://docs.liferay.com/dxp/portal/7.1-latest/propertiesdoc/portal.properties.html) | added iw_IL, kk_KZ, and ta_IN; dropped ar_SA and sv_SE |
| locales.enabled | added ar_SA and sv_SE; dropped iw_IL |
| session.timeout.auto.extend.offset | 0 | 10 |
| default.guest.public.layout.nam | Welcome | Home |
| default.user.private.layout.name | Welcome | My Dashboard |
| default.user.public.layout.nam | Welcome | My Profile |
| default.user.public.layout.column-1 | *blank* | com_liferay_contacts_web_portlet_ProfilePortlet |
| field.enable.com.liferay.portal.kernel.model.Contact.male | true | false |
| setup.database.driverClassName[mysql] | com.mysql.jdbc.Driver | com.mysql.cj.jdbc.Driver |
| setup.database.jar.url[com.mysql.cj.jdbc.Driver] | http://repo1.maven.org/maven2/mysql/mysql-connector-java/5.1.23/mysql-connector-java-5.1.23.jar | http://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.15/mysql-connector-java-8.0.15.jar |
| module.framework.services.ignored.interfaces | see [value](https://docs.liferay.com/dxp/portal/7.1-latest/propertiesdoc/portal.properties.html) | dropped com.liferay.portal.cache.thread.local.ThreadLocalCacheAdvice, com.liferay.portal.dao.jdbc.util.DataSourceSwapper, com.liferay.portal.dao.jdbc.util.DataSourceSwapper, com.liferay.portal.messaging.async.AsyncAdvice, com.liferay.portal.resiliency.service.PortalResiliencyAdvice, com.liferay.portal.search.IndexableAdvice, com.liferay.portal.security.access.control.AccessControlAdvice, com.liferay.portal.systemevent.SystemEventAdvice, org.aopalliance.* |
| module.framework.system.packages.extra | see [value](https://docs.liferay.com/dxp/portal/7.1-latest/propertiesdoc/portal.properties.html) | added com.mysql.cj.jdbc |
| module.framework.properties.org.osgi.framework.bootdelegation | see [value](https://docs.liferay.com/dxp/portal/7.1-latest/propertiesdoc/portal.properties.html) | added com.liferay.expando.kernel.model |
| module.framework.web.generator.excluded.paths | see [value](https://docs.liferay.com/dxp/portal/7.1-latest/propertiesdoc/portal.properties.html) | dropped WEB-INF/lib/aopalliance.jar and WEB-INF/lib/aopalliance-1.0.jar |
| com.liferay.portal.servlet.filters.strip.StripFilter | true | false |
| login.create.account.allow.custom.password | false | true |


## Default Settings Changed in 7.1

| **Portal Property** | **7.0 Default** | **7.1 Default** |
| --- | --- | --- |
| portlet.add.default.resource.check.whitelist | see [value](https://docs.liferay.com/ce/portal/7.0-latest/propertiesdoc/portal.properties.html) | see [value](https://docs.liferay.com/dxp/portal/7.1-latest/propertiesdoc/portal.properties.html) |
| spring.configs | see [value](https://docs.liferay.com/ce/portal/7.0-latest/propertiesdoc/portal.properties.html) | added META-INF/security-spring.xml; dropped META-INF/message-boards-spring.xml, META-INF/security-spring.xml, and META-INF/service-configurator-spring.xml |
| javascript.barebone.files | see [value](https://docs.liferay.com/ce/portal/7.0-latest/propertiesdoc/portal.properties.html) | *blank* |
| javascript.everything.files | see [value](https://docs.liferay.com/ce/portal/7.0-latest/propertiesdoc/portal.properties.html) | *blank* |
| users.screen.name.allow.numeric | false | true |
| users.update.user.name.com.liferay.message.boards.kernel.model.MBMessage renamed | | users.update.user.name.com.liferay.message.boards.model.MBMessage |
| session.timeout | 30 | 15 |
| session.phishing.protected.attribute | see [value](https://docs.liferay.com/ce/portal/7.0-latest/propertiesdoc/portal.properties.html) | added OPEN_ID_CONNECT_SESSION |
| auth.token.ignore.actions | see [value](https://docs.liferay.com/ce/portal/7.0-latest/propertiesdoc/portal.properties.html) | dropped /login/login |
| default.user.private.layout.regular.theme.id | userdashboard_WAR_userdashboardtheme | classic_WAR_classictheme |
| default.user.public.layout.regular.theme.id | userprofile_WAR_userprofiletheme | classic_WAR_classictheme |
| layout.friendly.url.keywords | see [value](https://docs.liferay.com/ce/portal/7.0-latest/propertiesdoc/portal.properties.html) | added `a` |
| editor.wysiwyg.portal-web.docroot.html.portlet.announcements.edit_entry.jsp | ckeditor | alloyeditor |
| editor.wysiwyg.portal-web.docroot.html.portlet.message_boards.edit_message.bb_code.jsp | ckeditor_bbcode | alloyeditor_bbcode
| editor.wysiwyg.portal-web.docroot.html.portlet.message_boards.edit_message.html.jsp | ckeditor | alloyeditor |
| browser.cache.disabled | false | true |
| browser.cache.signed.in.disabled | false | true |
|  lock.expiration.time.com.liferay.message.boards.kernel.model.MBThread renamed | | lock.expiration.time.com.liferay.message.boards.model.MBThread |
| module.framework.properties.org.osgi.framework.bootdelegation | see [value](https://docs.liferay.com/ce/portal/7.0-latest/propertiesdoc/portal.properties.html) | added javax.validation, javax.validation.*, jdk.*, weblogic.jndi, weblogic.jndi.* |
| memory.scheduler.org.quartz.scheduler.jobFactory.class | org.quartz.simpl.SimpleJobFactory | org.quartz.simpl.PropertySettingJobFactory |
| persisted.scheduler.org.quartz.scheduler.jobFactory.class | org.quartz.simpl.SimpleJobFactory | org.quartz.simpl.PropertySettingJobFactory |
| com.liferay.portal.servlet.filters.jsoncontenttype.JSONContentTypeFilter | true | false |
| dl.entry.columns | see [value](https://docs.liferay.com/ce/portal/7.0-latest/propertiesdoc/portal.properties.html) | added document-type |
| ratings.upgrade.thumbs.class.names | see [value](https://docs.liferay.com/ce/portal/7.0-latest/propertiesdoc/portal.properties.html) | replace `com.liferay.message.boards.kernel.model.*` with `com.liferay.message.boards.model.*` in values |

## Default Settings Changed in 7.0

Here are some properties that have changed since version 6.2:

| **Portal Property** | **6.2 Default** | **7.0 Default**|
| --- | --- | --- |
| blogs.trackback.enabled | true | false |
| dl.file.entry.thumbnail.max.height | 128 | 300 |
| dl.file.entry.thumbnail.max.width | 128 | 300 |
| layout.set.prototype.propagate.logo | true | false |
| web.server.servlet.check.image.gallery | true | false |

The latest [portal properties reference](https://docs.liferay.com/dxp/portal/7.2-latest/propertiesdoc/portal.properties.html) provides property details and examples. Many properties are now replaced by OSGi configurations, which are accessible through the UI in [System Settings](https://help.liferay.com/hc/en-us/articles/360029131591-System-Settings).

## Related Topics

* [Breaking Changes in 7.2](https://help.liferay.com/hc/en-us/articles/360028832132-Breaking-Changes)
* [Breaking Changes in 7.1](https://help.liferay.com/hc/en-us/articles/360017902892-Breaking-Changes)
* [Breaking Changes in 7.0](https://help.liferay.com/hc/en-us/articles/360017892092-Breaking-Changes)

