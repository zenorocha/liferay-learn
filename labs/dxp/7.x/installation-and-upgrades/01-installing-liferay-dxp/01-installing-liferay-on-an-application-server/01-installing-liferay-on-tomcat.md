# Installing DXP on Tomcat

Installing Liferay DXP on Tomcat requires deploying dependencies, modifying scripts, modifying config `xml`s file, and deploying the DXP WAR file.

For most administrators, the simplest and easiest way to accomplish this is by [downloading the Liferay DXP Tomcat](../03-obtaining-liferay.md) bundle that is created by Liferay and copying the dependencies, scripts, and `ROOT.xml` provided there. Administrators may also opt to download the dependencies and to create/modify their Tomcat scripts and configurations by hand.

In addition to copying dependencies, scripts, and configurations from the Liferay Tomcat bundle files (or manually downloading and configuring), administrators must also download:

* DXP WAR file
* Dependencies ZIP file
* OSGi Dependencies ZIP file

> **Important:** Review the [Installation Overview](../02-installation-overview.md) and [Connecting a Database](../04-connecting-a-database.md) articles before continuing.

Here are the basic steps for installing DXP on Tomcat:

* [Installing dependencies to the application server](#installing-dependencies)
* [Configuring the application server for DXP](#configuring-tomcat)
* [Deploying the DXP WAR file to the application server](#deploying-product)

[*LIFERAY_HOME*](../../14-reference/01-liferay-home.md) is Tomcat server's parent folder. `$TOMCAT_HOME` refers to Tomcat server folder. It is usually named `tomcat-[version]` or `apache-tomcat-[version]`.

## Installing Dependencies

DXP depends on many JARs included by DXP Tomcat bundle. Some of the bundle's JARs are not strictly required but can still be useful. If not using a bundle, download the Liferay JARs by downloading the *Dependencies* archive and the *OSGi Dependencies* archive and the third-party JARs as described below.

1. Create the folder `$TOMCAT_HOME/lib/ext`, if it does not exist, and extract the JARs from the dependencies ZIP to it. Here are the JARs:

    * `com.liferay.petra.concurrent.jar`
    * `com.liferay.petra.executor.jar`
    * `com.liferay.petra.function.jar`
    * `com.liferay.petra.io.jar`
    * `com.liferay.petra.lang.jar`
    * `com.liferay.petra.memory.jar`
    * `com.liferay.petra.nio.jar`
    * `com.liferay.petra.process.jar`
    * `com.liferay.petra.reflect.jar`
    * `com.liferay.petra.string.jar`
    * `com.liferay.registry.api.jar`
    * `hsql.jar`
    * `portal-kernel.jar`
    * `portlet.jar`

1. Copy the following JARs from a DXP Tomcat bundle (or download them) to the `$TOMCAT_HOME/lib/ext` folder:

    * [`activation.jar`](http://www.oracle.com/technetwork/java/javase/jaf-136260.html)
    * [`ccpp.jar`](http://mvnrepository.com/artifact/javax.ccpp/ccpp/1.0)
    * [`jms.jar`](http://www.oracle.com/technetwork/java/docs-136352.html)
    * [`jta.jar`](http://www.oracle.com/technetwork/java/javaee/jta/index.html)
    * [`jutf7.jar`](http://mvnrepository.com/artifact/com.beetstra.jutf7/jutf7)
    * [`mail.jar`](http://www.oracle.com/technetwork/java/index-138643.html)
    * [`persistence.jar`](http://mvnrepository.com/artifact/org.eclipse.persistence/javax.persistence/2.1.1)
    * [`support-tomcat.jar`](http://mvnrepository.com/artifact/com.liferay.portal/com.liferay.support.tomcat)

1. Copy the JDBC driver for your database to the `$CATALINA_BASE/lib/ext` folder. Here are some common drivers:

    * [`mariadb.jar`](https://downloads.mariadb.org/)
    * [`mysql.jar`](http://dev.mysql.com/downloads/connector/j)
    * [`postgresql.jar`](https://jdbc.postgresql.org/download/postgresql-42.0.0.jar)

1. Create an `osgi` folder in your LIFERAY_HOME. Extract the folders from OSGi ZIP file to the `osgi` folder. The `osgi` folder provides the necessary modules for DXP's OSGi runtime.

**Checkpoint:**

* Your `$CATALINA_BASE/lib/ext` folder has these JARs:
  * `activation.jar`
  * `ccpp.jar`
  * `com.liferay.petra.concurrent.jar`
  * `com.liferay.petra.executor.jar`
  * `com.liferay.petra.function.jar`
  * `com.liferay.petra.io.jar`
  * `com.liferay.petra.lang.jar`
  * `com.liferay.petra.memory.jar`
  * `com.liferay.petra.nio.jar`
  * `com.liferay.petra.process.jar`
  * `com.liferay.petra.reflect.jar`
  * `com.liferay.petra.string.jar`
  * `com.liferay.registry.api.jar`
  * `hsql.jar`
  * `jms.jar`
  * `jta.jar`
  * `jutf7.jar`
  * `mail.jar`
  * `mariadb.jar`
  * `mysql.jar`
  * `persistence.jar`
  * `portal-kernel.jar`
  * `portlet.jar`
  * `postgresql.jar`
  * `support-tomcat.jar`

* The `[LIFERAY_HOME]/osgi` folder has these subfolders:
  * `configs`
  * `core`
  * `marketplace`
  * `modules`
  * `portal`
  * `state`
  * `static`
  * `war`

## Configuring Tomcat

Configuring Tomcat to run DXP includes:

* Setting environment variables
* Specifying a web application context for DXP
* Setting properties and descriptors

Administrators have the option to use either DXP's built-in data source and mail session or configure Tomcat to manage each respectively:

* [Data source](#database-configuration)
* [Mail session](#mail-configuration)

### Configuring Tomcat to run DXP

1. Copy the `setenv.bat`, `setenv.sh`,  `startup.bat`, `startup.sh`, `shutdown.bat`, and `shutdown.sh` files from a DXP bundle to the `$CATALINA_BASE/bin` folder. If not, create the  `setenv.bat` and `setenv.sh` scripts.

    The scripts set JVM options for Catalina, which is Tomcat's servlet container. Among these options is the location of the Java runtime environment. If this environment is not available on the server globally, set its location in in these files so Tomcat can run. Do this by pointing the `JAVA_HOME` environment variable to a DXP-supported JRE:

    ```bash
    export JAVA_HOME=/usr/lib/jvm/java-8-jdk
    export PATH=$JAVA_HOME/bin:$PATH
    ```

    Then configure Catalina's JVM options to support DXP.

    **Unix:**

    ```bash
    CATALINA_OPTS="$CATALINA_OPTS -Dfile.encoding=UTF-8 -Djava.net.preferIPv4Stack=true -Dorg.apache.catalina.loader.WebappClassLoader.ENABLE_CLEAR_REFERENCES=false -Duser.timezone=GMT -Xms2560m -Xmx2560m -XX:MaxMetaspaceSize=512m"
    ```

    **Windows:**

    ```bash
    set "CATALINA_OPTS=%CATALINA_OPTS% -Dfile.encoding=UTF-8 -Djava.net.preferIPv4Stack=true -Dorg.apache.catalina.loader.WebappClassLoader.ENABLE_CLEAR_REFERENCES=false -Duser.timezone=GMT -Xms2560m -Xmx2560m -XX:MaxMetaspaceSize=512m"
    ```

    This does the following:

    1. Sets the file encoding to UTF-8.
    1. Prefers an IPv4 stack over IPv6.
    1. Prevents Tomcat from working around garbage collection bugs relating to static or final fields (these bugs don't exist in DXP and working around them causes problems with the logging system).
    1. Sets the time zone to GMT
    1. Gives the JVM 2GB of RAM
    1. Limits Metaspace to 512MB.

    > **Important:** DXP requires that the application server JVM use the GMT time zone and UTF-8 file encoding.

    > **Note:** On JDK 11, it's recommended to add this JVM argument to display four-digit years.

    ```properties
    -Djava.locale.providers=JRE,COMPAT,CLDR
    ```

    After installation, tune the system (including these JVM options) for performance.

1. If there is a DXP Tomcat bundle, copy its `$CATALINA_BASE/conf/Catalina/localhost/ROOT.xml` file to the corresponding location in the application server. Create the file path if it doesn't exist and the `ROOT.xml` file.

    The `ROOT.xml` file specifies a web application context for DXP which looks like this:

    ```xml
    <Context crossContext="true" path="">

        <!-- JAAS -->

        <!--<Realm
            className="org.apache.catalina.realm.JAASRealm"
            appName="PortalRealm"
            userClassNames="com.liferay.portal.kernel.security.jaas.PortalPrincipal"
            roleClassNames="com.liferay.portal.kernel.security.jaas.PortalRole"
        />-->

        <!--
        Uncomment the following to disable persistent sessions across reboots.
        -->

        <!--<Manager pathname="" />-->

        <!--
        Uncomment the following to not use sessions. See the property
        "session.disabled" in portal.properties.
        -->

        <!--<Manager className="com.liferay.support.tomcat.session.SessionLessManagerBase" />-->

        <Resources>
            <PreResources
                base="${catalina.base}/lib/ext/portal"
                className="com.liferay.support.tomcat.webresources.ExtResourceSet"
                webAppMount="/WEB-INF/lib"
            />
        </Resources>
    </Context>
    ```

     Setting `crossContext="true"` lets multiple web applications use the same class loader. This configuration includes commented instructions and tags for configuring a JAAS realm, disabling persistent sessions, and disabling sessions entirely.

1. Provide Catalina access to the JARs in `$CATALINA_BASE/lib/ext` by opening your `$CATALINA_BASE/conf/catalina.properties` file and appending this value to the `common.loader` property:

    ```properties
    ,"${catalina.home}/lib/ext/global","${catalina.home}/lib/ext/global/*.jar","${catalina.home}/lib/ext","${catalina.home}/lib/ext/*.jar"
    ```

1. Make sure to use UTF-8 URI encoding consistently. Copy the `$CATALINA_BASE/conf/server.xml` file from a 7.2 bundle to the server. If not, open the `$CATALINA_BASE/conf/server.xml` file and add the attribute `URIEncoding="UTF-8"` to HTTP and AJP connectors that use `redirectPort=8443`. Here are examples:

    Old:

    ```xml
    <Connector port="8080" protocol="HTTP/1.1" connectionTimeout="20000" redirectPort="8443" />
    ```

    New:

    ```xml
    <Connector port="8080" protocol="HTTP/1.1" connectionTimeout="20000" redirectPort="8443" URIEncoding="UTF-8" />
    ```

    Old:

    ```xml
    <Connector port="8009" protocol="AJP/1.3" redirectPort="8443" />
    ```

    New:

    ```xml
    <Connector port="8009" protocol="AJP/1.3" redirectPort="8443" URIEncoding="UTF-8" />
    ```

1. Refrain from writing access logs (optional) by commenting out the access log `Valve` element in `$CATALINA_BASE/conf/server.xml`. It's commented out here:

    ```xml
    <!-- <Valve className="org.apache.catalina.valves.AccessLogValve" 
           directory="logs"
           prefix="localhost_access_log" suffix=".txt"
           pattern="%h %l %u %t &quot;%r&quot; %s %b" /> -->
    ```

1. Optionally, set the following log levels in the `$CATALINA_HOME/conf/logging.properties` file:

    ```properties
    org.apache.catalina.startup.Catalina.level=INFO
    org.apache.catalina.startup.ClassLoaderFactory.level=SEVERE
    org.apache.catalina.startup.VersionLoggerListener.level=WARNING
    org.apache.level=WARNING
    ```

1. In `$CATALINA_HOME/conf/web.xml`, set the JSP compiler to Java 8 and set DXP's `TagHandlerPool` class to manage the JSP tag pool. Add the following elements above the `jsp` servlet element's `<load-on-startup>` element.

    ```xml
    <init-param>
        <param-name>compilerSourceVM</param-name>
        <param-value>1.8</param-value>
    </init-param>
    <init-param>
        <param-name>compilerTargetVM</param-name>
        <param-value>1.8</param-value>
    </init-param>
    <init-param>
        <param-name>tagpoolClassName</param-name>
        <param-value>com.liferay.support.tomcat.jasper.runtime.TagHandlerPool</param-value>
    </init-param>
    ```

1. In `$CATALINA_HOME/conf/web.xml`, specify whether the application server should look for extra metadata, such as annotations in the application's JARs and classes. Setting `web-app` element's attribute `metadata-complete="true"` tells the application server there's no extra metadata. This configuration improves application server startup performance. The default is to check for extra metadata.

1. If using Unix, Linux, or Mac OS, make the shell scripts in your `$CATALINA_HOME/bin` and `$CATALINA_BASE/bin` folders executable by running this command in each folder:

    ```bash
    chmod a+x *.sh
    ```

**Checkpoint:**

1. The file encoding, user time-zone, and preferred protocol stack are set in the `setenv.sh`.
1. The default memory available and Metaspace limit are set.
1. `$CATALINA_BASE/conf/Catalina/localhost/ROOT.xml` declares the web application context.
1. The `common.loader` property in `$CATALINA_BASE/conf/catalina.properties`grants Catalina access to the JARs in `$CATALINA_BASE/lib/ext`.
1. `$CATALINA_BASE/conf/server.xml` sets UTF-8 encoding.
1. `$CATALINA_BASE/conf/server.xml` does not declare any valve for writing host access logs. *(optional)*
1. `$CATALINA_HOME/conf/logging.properties` sets the desired log levels.
1. `$CATALINA_HOME/conf/web.xml` sets the tag handler pool and sets Java 8 as the JSP compiler.
1. `$CATALINA_HOME/conf/web.xml` specifies for the application server to refrain from looking for extra metadata. *(optional)*
1. The scripts in Tomcat's `bin` folders are executable.

The application server is configured to run DXP.

### Database Configuration

The easiest way to handle the database configuration is to let DXP manage the data source. If using the [built-in data source](../04-connecting-a-database.md#using-the-built-in-data-source), skip this section.

If administrators want to use Tomcat to manage the data source, follow these steps:

1. Make sure the database server is installed and working. If it's installed on a different machine, verify that DXP machine can access it.
1. Open `$CATALINA_BASE/conf/Catalina/localhost/ROOT.xml` and add data source as a `Resource` in the web application `Context`:

    ```xml
    <Context...>
        ...
        <Resource
            name="jdbc/LiferayPool"
            auth="Container"
            type="javax.sql.DataSource"
            driverClassName="com.mysql.jdbc.Driver"
            url="jdbc:mysql://localhost/lportal?useUnicode=true&amp;characterEncoding=UTF-8"
            username="root"
            password="root"
            maxActive="100"
            maxIdle="30"
            maxWait="10000"
        />
    </Context>
    ```

    The example resource definition above is for a MySQL database named `lportal` that has a user named `root` whose password is `root`. Replace these values with your own.

1. In a `portal-ext.properties` file in **[LIFERAY_HOME]**, specify the data source:

    ```properties
    jdbc.default.jndi.name=jdbc/LiferayPool
    ```

The data source has been configured.

### Mail Configuration

As with database configuration, the easiest way to configure mail is to use the DXP handle the [built-in mail session](https://help.liferay.com/hc/articles/360029031591-Configuring-Mail), skip this section.

If administrators want to use Tomcat to manage the mail session, follow these steps:

1. Open `$CATALINA_BASE/conf/Catalina/localhost/ROOT.xml` and the your mail session as a `Resource` in the web application `Context`. Replace the example mail session values with your own.

    ```xml
    <Context...>
        ...
        <Resource
            name="mail/MailSession"
            auth="Container"
            type="javax.mail.Session"
            mail.pop3.host="pop.gmail.com"
            mail.pop3.port="110"
            mail.smtp.host="smtp.gmail.com"
            mail.smtp.port="465"
            mail.smtp.user="user"
            mail.smtp.password="password"
            mail.smtp.auth="true"
            mail.smtp.starttls.enable="true"
            mail.smtp.socketFactory.class="javax.net.ssl.SSLSocketFactory"
            mail.imap.host="imap.gmail.com"
            mail.imap.port="993"
            mail.transport.protocol="smtp"
            mail.store.protocol="imap"
        />
    </Context>
    ```

1. In the `portal-ext.properties` file in LIFERAY_HOME, enter the mail session values:

    ```properties
    mail.session.jndi.name=mail/MailSession
    ```

The mail session for Tomcat has been configured.

## Deploying the DXP `.war` File

1. If this is manual installation on a clean Tomcat server, delete the contents of the `$CATALINA_BASE/webapps/ROOT` folder. This removes the default Tomcat home page.
1. Extract the DXP `.war` file contents to `$CATALINA_BASE/webapps/ROOT`.

## Starting Liferay DXP on Tomcat

1. Start Tomcat by navigating to `$CATALINA_HOME/bin` and executing `./startup.sh`. Alternatively, execute `./catalina.sh run` to tail DXP's log file. The log audits startup activities and is useful for debugging deployment.

## Next Steps

* [Installation Overview](../02-installation-overview.md)
* Configuration Overview
* Installing and Configuring a Search Engine
* Securing Liferay DXP
* Configuring Clustering for High Availability
* Maintaining Liferay DXP
