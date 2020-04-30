# Installing Liferay DXP on JBoss EAP

Installing Liferay DXP on JBoss EAP requires deploying dependencies, modifying scripts, modifying config `xml`s file, and deploying the DXP WAR file. In addition, make the optional database and mail server configurations to optimize the DXP instance.

Liferay DXP requires a Java JDK 8 or 11. See [the compatibility matrix](https://www.liferay.com/documents/10182/246659966/Liferay+DXP+7.2+Compatibility+Matrix.pdf/ed234765-db47-c4ad-7c82-2acb4c73b0f9) to choose a JDK.

Download these files from the [Help Center](https://customer.liferay.com/downloads) (subscription) or from [Liferay Community Downloads](https://www.liferay.com/downloads-community):Administrators must download the following:

* DXP WAR file
* Dependencies ZIP file
* OSGi Dependencies ZIP file

Note that [*Liferay Home*](../../reference/liferay-home.md) is the folder containing the JBoss server folder. After installing and deploying DXP, the Liferay Home folder contains the JBoss server folder as well as `data`, `deploy`, `logs`, and `osgi` folders. `$JBOSS_HOME` refers to the JBoss server folder. This folder is usually named `jboss-eap-[version]`.

Installing DXP on JBoss EAP takes the following steps:

1. [Installing dependencies to the application server](#installing-dependencies)
1. [Configuring the application server for DXP](#configuring-jboss)
1. [Connect to a Database](#connect-to-a-database)
1. [Connect to a Mail Server](#connect-to-a-mail-server)
1. [Deploying the DXP WAR file to the application server](#deploying-dxp)

## Installing Dependencies

1. Create the folder `$JBOSS_HOME/modules/com/liferay/portal/main` if it doesn't exist and extract the JARs from the dependencies ZIP into this folder.
1. Download the database driver `.jar` file and copy it into the same folder. For example, download and extract [MySQL's driver](http://dev.mysql.com/downloads/connector/j/) into the `$JBOSS_HOME/modules/com/liferay/portal/main` folder.
1. Create the file `module.xml` in the `$JBOSS_HOME/modules/com/liferay/portal/main` folder and and declare all the dependencies:

    ```xml
    <?xml version="1.0"?>

    <module xmlns="urn:jboss:module:1.0" name="com.liferay.portal">
        <resources>
            <resource-root path="com.liferay.petra.concurrent.jar" />
            <resource-root path="com.liferay.petra.executor.jar" />
            <resource-root path="com.liferay.petra.function.jar" />
            <resource-root path="com.liferay.petra.io.jar" />
            <resource-root path="com.liferay.petra.lang.jar" />
            <resource-root path="com.liferay.petra.memory.jar" />
            <resource-root path="com.liferay.petra.nio.jar" />
            <resource-root path="com.liferay.petra.process.jar" />
            <resource-root path="com.liferay.petra.reflect.jar" />
            <resource-root path="com.liferay.petra.string.jar" />
            <resource-root path="com.liferay.registry.api.jar" />
            <resource-root path="hsql.jar" />
            <resource-root path="mysql.jar" />
            <resource-root path="portal-kernel.jar" />
            <resource-root path="portlet.jar" />
        </resources>
        <dependencies>
            <module name="javax.api" />
            <module name="javax.mail.api" />
            <module name="javax.servlet.api" />
            <module name="javax.servlet.jsp.api" />
            <module name="javax.transaction.api" />
        </dependencies>
    </module>
    ```

    For a different database, replace the MySQL `.jar` with the driver JAR for the database (e.g., HSQL, PostgreSQL, etc.).

1. Create an `osgi` folder in the [Liferay Home](../../14-reference/01-liferay-home.md) folder. Extract the OSGi Dependencies ZIP file that you downloaded into the `[Liferay Home]/osgi` folder.

    The `osgi` folder provides the necessary modules for DXP's OSGi runtime.

**Checkpoint:**

1. The dependencies files have been unzipped into the `$JBOSS_HOME/modules/com/liferay/portal/main` folder and a database jar.
1. The `module.xml` has listed all JARs in the `<resource-root-path>` elements.
1. The `osgi` dependencies have been unzipped into the `osgi` folder.

### Running DXP on JBoss EAP in Standalone Mode vs. Domain Mode

JBoss EAP can be launched in either *standalone* mode or *domain* mode. Domain mode allows multiple application server instances to be managed from a single control point. A collection of such application servers is known as a *domain*. For more information on standalone mode vs. domain mode, please refer to the section on this topic in the [JBoss EAP Product Documentation](https://access.redhat.com/documentation/en-us/red_hat_jboss_enterprise_application_platform/7.1/html/introduction_to_jboss_eap/overview_of_jboss_eap#operating_modes).

DXP supports JBoss EAP when it runs in standalone mode but not when it runs in domain mode. DXP's auto-deploy does not work with a managed deployment, since JBoss manages the content of a managed deployment by copying files (exploded or non-exploded). This prevents JSP hooks and Ext plugins from working as intended. For example, JSP hooks don't work on JBoss EAP running in managed domain mode, since DXP's JSP override mechanism relies on the application server. Since JSP hooks and Ext plugins are deprecated, however, you may not be using them.

The command line interface is recommended for domain mode deployments.

| **Note:** This does not prevent DXP from running in a clustered environment on multiple JBoss servers. You can set up a cluster of DXP instances running on JBoss EAP servers running in standalone mode. Please refer to the [DXP clustering articles](https://help.liferay.com/hc/articles/360029123831-Liferay-DXP-Clustering) for more information.

## Configuring JBoss

Configuring JBoss to run DXP includes these things:

* Setting environment variables
* Setting properties and descriptors
* Removing unnecessary configurations

There are optional configurations in JBoss EAP to manage DXP's data source and mail session.

Start with configuring JBoss to run DXP.

Make the following modifications to `$JBOSS_HOME/standalone/configuration/standalone.xml`:

1. Locate the closing `</extensions>` tag. Directly beneath that tag, insert these system properties:

    ```xml
    <system-properties>
        <property name="org.apache.catalina.connector.URI_ENCODING" value="UTF-8" />
        <property name="org.apache.catalina.connector.USE_BODY_ENCODING_FOR_QUERY_STRING" value="true" />
    </system-properties>
    ```

1. Add the following `<filter-spec>` tag within the `<console-handler>` tag which is directly below the `<level name="INFO"/>` tag:

    ```xml
    <filter-spec value="not(any(match(&quot;WFLYSRV0059&quot;),match(&quot;WFLYEE0007&quot;)))" />
    ```

1. Add a timeout for the deployment scanner by setting `deployment-timeout="600"` as seen in the excerpt below.

    ```xml
    <subsystem xmlns="urn:jboss:domain:deployment-scanner:2.0">
        <deployment-scanner deployment-timeout="600" path="deployments" relative-to="jboss.server.base.dir" scan-interval="5000"/>
    </subsystem>
    ```

1. Add the following JAAS security domain to the security subsystem `<security-domains>` defined in element `<subsystem xmlns="urn:jboss:domain:security:2.0">`.

    ```xml
    <security-domain name="PortalRealm">
        <authentication>
            <login-module code="com.liferay.portal.security.jaas.PortalLoginModule" flag="required" />
        </authentication>
    </security-domain>
    ```

1. Remove the welcome content code snippets:

    ```xml
    <location name="/" handler="welcome-content"/>
    ```

    and

    ```xml
    <handlers>
        <file name="welcome-content" path="${jboss.home.dir}/welcome-content"/>
    </handlers>
    ```

1. Find the `<jsp-config/>` tag and set the `development`, `source-vm`, and `target-vm` attributes in the tag. Once finished, the tag should look like this:

    ```xml
    <jsp-config development="true" source-vm="1.8" target-vm="1.8"/>
    ```

**Checkpoint:**

Before continuing, verify the following properties have been set in the `standalone.xml` file:

1. The new `<system-property>` is added.
1. The new `<filter-spec>` is added.
1. The `<deployment-timeout>` is set to `360`.
1. The new `<security-domain>` is created.
1. Welcome content is removed.
1. The `<jsp-config>` tag contains its new attributes.

Next, configure the JVM and startup scripts.

In the `$JBOSS_HOME/bin/` folder, modify the standalone domain's configuration script file `standalone.conf` (`standalone.conf.bat` on Windows):

* Set the file encoding to `UTF-8`
* Set the user time zone to `GMT`
* Set the preferred protocol stack
* Increase the default amount of memory available.

| **Important:** For DXP to work properly, the application server JVM must use the `GMT` time zone and `UTF-8` file encoding.

Make the following edits as applicable to the respective operating system:

**Windows:**

1. Comment out the initial `JAVA_OPTS` assignment as demonstrated in the following line:

    ```bash
    rem set "JAVA_OPTS=-Xms1G -Xmx1G -XX:MetaspaceSize=96M -XX:MaxMetaspaceSize=2560m"
    ```

1. Add the following `JAVA_OPTS` assignment one line above the `:JAVA_OPTS_SET` line found at end of the file:

    ```bash
    set "JAVA_OPTS=%JAVA_OPTS% -Dfile.encoding=UTF-8 -Djava.net.preferIPv4Stack=true -Djboss.as.management.blocking.timeout=480 -Duser.timezone=GMT -Xms2560m -Xmx2560m -XX:MaxMetaspaceSize=768m"
    ```

**Unix:**

1. Below the `if [ "x$JAVA_OPTS" = "x" ];` statement, replace this `JAVA_OPTS`
    statement:

    ```bash
    JAVA_OPTS="-Xms1303m -Xmx1303m -XX:MetaspaceSize=96M -XX:MaxMetaspaceSize=2560m -Djava.net.preferIPv4Stack=true"
    ```

    with this:

    ```bash
    JAVA_OPTS="-Djava.net.preferIPv4Stack=true"
    ```

1. Add the following statement to the bottom of the file:

    ```bash
    JAVA_OPTS="$JAVA_OPTS -Dfile.encoding=UTF-8 -Djava.net.preferIPv4Stack=true -Djboss.as.management.blocking.timeout=480 -Duser.timezone=GMT -Xms2560m -Xmx2560m -XX:MaxMetaspaceSize=512m"
    ```

On JDK 11, it's recommended to add this JVM argument to display four-digit years.

```bash
-Djava.locale.providers=JRE,COMPAT,CLDR
```

| **Note:** If using the IBM JDK with the JBoss server, complete some additional steps.

1. Navigate to the `$JBOSS_HOME/modules/com/liferay/portal/main/module.xml` file and insert the following dependency within the `<dependencies>` element:

     `<module name="ibm.jdk" />`

1. Navigate to the `$JBOSS_HOME/modules/system/layers/base/sun/jdk/main/module.xml` file and insert the following path names inside the `<paths>...</paths>` element:

```xml
    <path name="com/sun/crypto" />
    <path name="com/sun/crypto/provider" />
    <path name="com/sun/image/codec/jpeg" />
    <path name="com/sun/org/apache/xml/internal/resolver" />
    <path name="com/sun/org/apache/xml/internal/resolver/tools" />
```

The added paths resolve issues with portal deployment exceptions and image uploading problems.

**Checkpoint:**

1. The file encoding, user time-zone, preferred protocol stack have been set in the `JAVA_OPTS` in the `standalone.conf.bat` file.

1. The default amount of memory available has been increased.

The prescribed script modifications are now complete for the DXP installation on JBoss.

## Connect to a Database

The easiest way to handle database configuration is to let DXP manage the data source. The [Basic Configuration](../../../getting-started/using-the-setup-wizard.md) page lets administrators configure DXP's built-in data source. If using the built-in data source, skip this section.

This section demonstrates configuring a MySQL database. If using a different database, modify the data source and driver snippets as necessary.

If using JBoss to manage the data source, follow these steps:

1. Add the data source inside the `$JBOSS_HOME/standalone/configuration/standalone.xml` file's the `<datasources>` element.

    ```xml
    <datasource jndi-name="java:jboss/datasources/ExampleDS" pool-name="ExampleDS" enabled="true" jta="true" use-java-context="true" use-ccm="true">
        <connection-url>jdbc:mysql://localhost/lportal</connection-url>
        <driver>mysql</driver>
        <security>
            <user-name>root</user-name>
            <password>root</password>
        </security>
    </datasource>
    ```

    Make sure to replace the database name (i.e., `lportal`), user name, and password with the appropriate values.

    | **Note:** If the data source `jndi-name` has to be changed to something different, it is necessary to edit the `datasource` element in the `<default-bindings>` tag.

1. Add the driver to the `standalone.xml` file's `<drivers>` element also found within the `<datasources>` element.

    ```xml
    <drivers>
        <driver name="mysql" module="com.liferay.portal">
            <driver-class>com.mysql.jdbc.Driver</driver-class>
        </driver>
    </drivers>
    ```

    A final data sources subsystem that uses MySQL should look like this:

    ```xml
    <subsystem xmlns="urn:jboss:domain:datasources:5.0">
        <datasources>
            <datasource jndi-name="java:jboss/datasources/ExampleDS" pool-name="ExampleDS" enabled="true" jta="true" use-java-context="true" use-ccm="true">
                <connection-url>jdbc:mysql://localhost/lportal</connection-url>
                <driver>mysql</driver>
                <security>
                    <user-name>root</user-name>
                    <password>root</password>
                </security>
            </datasource>
            <drivers>
                <driver name="mysql" module="com.liferay.portal"/>
            </drivers>
        </datasources>
    </subsystem>
    ```

1. In a [`portal-ext.properties`](../../14-reference/03-portal-properties.md) file in the Liferay Home, specify the data source:

    ```properties
    jdbc.default.jndi.name=java:jboss/datasources/ExampleDS
    ```

The data source is now configured and ready to be connected to the database.

## Connect to a Mail Server

As with database configuration, the easiest way to configure mail is to let DXP handle the mail session. If you want to use DXP's built-in mail session, skip this section and [connect DXP to a mail server](../../connecting-to-a-mail-server.md) in the Control Panel.

If you want to manage the mail session with JBoss, follow these steps:

1. Specify the mail subsystem in the
    `$JBOSS_HOME/standalone/configuration/standalone.xml` file like this:

    ```xml
    <subsystem xmlns="urn:jboss:domain:mail:3.0">
        <mail-session jndi-name="java:jboss/mail/MailSession" >
            <smtp-server ssl="true" outbound-socket-binding-ref="mail-smtp">
                <login username="USERNAME" password="PASSWORD"/>
            </smtp-server>
       </mail-session>
    </subsystem>
    ...
    <socket-binding-group name="standard-sockets" default-interface="public" port-offset="${jboss.socket.binding.port-offset:0}">
    ...
    <outbound-socket-binding name="mail-smtp">
            <remote-destination host="smtp.gmail.com" port="465"/>
        </outbound-socket-binding>
    </socket-binding-group>
    ```

1. In the `portal-ext.properties` file in Liferay Home, reference the mail session:

    ```properties
    mail.session.jndi.name=java:jboss/mail/MailSession
    ```

## Deploying DXP

1. If the folder `$JBOSS_HOME/standalone/deployments/ROOT.war` already exists in the JBoss installation, delete all of its subfolders and files. Otherwise, create a new folder called `$JBOSS_HOME/standalone/deployments/ROOT.war`.
1. Unzip the DXP `.war` file into the `ROOT.war` folder.
1. To trigger deployment of `ROOT.war`, create an empty file named `ROOT.war.dodeploy` in the `$JBOSS_HOME/standalone/deployments/` folder. On startup, JBoss detects this file and deploys it as a web application.
1. Start the JBoss application server by navigating to `$JBOSS_HOME/bin` and running `standalone.bat` or `standalone.sh`.

After deploying DXP, you may see excessive warnings and log messages, such as the ones below, involving `PhaseOptimizer`. These are benign and can be ignored. Make sure to adjust the app server's logging level or log filters to avoid excessive benign log messages.

```log
May 02, 2018 9:12:27 PM com.google.javascript.jscomp.PhaseOptimizer$NamedPass process
WARNING: Skipping pass gatherExternProperties
May 02, 2018 9:12:27 PM com.google.javascript.jscomp.PhaseOptimizer$NamedPass process
WARNING: Skipping pass checkControlFlow
May 02, 2018 9:12:27 PM com.google.javascript.jscomp.PhaseOptimizer$NamedPass process
INFO: pass supports: [ES3 keywords as identifiers, getters, reserved words as properties, setters, string continuation, trailing comma, array pattern rest, arrow function, binary literal, block-scoped function declaration, class, computed property, const declaration, default parameter, destructuring, extended object literal, for-of loop, generator, let declaration, member declaration, new.target, octal literal, RegExp flag 'u', RegExp flag 'y', rest parameter, spread expression, super, template literal, modules, exponent operator (**), async function, trailing comma in param list]
current AST contains: [ES3 keywords as identifiers, getters, reserved words as properties, setters, string continuation, trailing comma, array pattern rest, arrow function, binary literal, block-scoped function declaration, class, computed property, const declaration, default parameter, destructuring, extended object literal, for-of loop, generator, let declaration, member declaration, new.target, octal literal, RegExp flag 'u', RegExp flag 'y', rest parameter, spread expression, super, template literal, exponent operator (**), async function, trailing comma in param list, object literals with spread, object pattern rest]
```
