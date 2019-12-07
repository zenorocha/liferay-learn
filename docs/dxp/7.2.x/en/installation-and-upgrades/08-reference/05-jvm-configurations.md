# JVM Configurations

The following JVM configurations are a recommended baseline set of configurations for the functionality and performance of a Liferay DXP installation:

## UTF-8 File Encoding

```properties
  -Dfile.encoding=UTF8
```

## GMT Timezone

```properties
  -Duser.timezone=GMT
```

## Display Four Digit Years

On JDK 11, it is recommended to add this JVM argument to display four-digit years. Since JDK 9, the Unicode Common Locale Data Repository (CLDR) is the default locales provider. CLDR does not provide years in a four-digit format (see [LPS-87191](https://issues.liferay.com/browse/LPS-87191)). The setting `java.locale.providers=JRE,COMPAT,CLDR` works around this issue by using JDK 8's default locales provider.

```properties
  -Djava.locale.providers=JRE,COMPAT,CLDR
```

## Memory Configurations

The recommended maximum heap size is 2GB. Setting the minimum heap size to the maximum heap size value minimizes garbage collections.

```properties
  -Xms2560m -Xmx2560m
```

## Workaround Known Issues

### JDK 11 Illegal Access Warnings

If using JDK 11, _Illegal Access_ warnings may appear in the logs:

```message
WARNING: An illegal reflective access operation has occurred
WARNING: Illegal reflective access by com.liferay.petra.reflect.ReflectionUtil (file:/Users/malei/dev/project/bundles/master-bundles/tomcat-9.0.10/lib/ext/com.liferay.petra.reflect.jar) to field java.lang.reflect.Field.modifiers
WARNING: Please consider reporting this to the maintainers of com.liferay.petra.reflect.ReflectionUtil
WARNING: Use --illegal-access=warn to enable warnings of further illegal reflective access operations
WARNING: All illegal access operations will be denied in a future release
```

This is a known issue: [LPS-87421](https://issues.liferay.com/browse/LPS-87421). As a workaround, these warnings can be eliminated by adding these properties into the application server JVM options:

```properties
JDK_JAVA_OPTIONS="$JDK_JAVA_OPTIONS --add-opens=java.base/java.awt.font=ALL-UNNAMED"
JDK_JAVA_OPTIONS="$JDK_JAVA_OPTIONS --add-opens=java.base/java.io=ALL-UNNAMED"
JDK_JAVA_OPTIONS="$JDK_JAVA_OPTIONS --add-opens=java.base/java.lang=ALL-UNNAMED"
JDK_JAVA_OPTIONS="$JDK_JAVA_OPTIONS --add-opens=java.base/java.lang.reflect=ALL-UNNAMED"
JDK_JAVA_OPTIONS="$JDK_JAVA_OPTIONS --add-opens=java.base/java.net=ALL-UNNAMED"
JDK_JAVA_OPTIONS="$JDK_JAVA_OPTIONS --add-opens=java.base/java.nio=ALL-UNNAMED"
JDK_JAVA_OPTIONS="$JDK_JAVA_OPTIONS --add-opens=java.base/java.text=ALL-UNNAMED"
JDK_JAVA_OPTIONS="$JDK_JAVA_OPTIONS --add-opens=java.base/java.util=ALL-UNNAMED"
JDK_JAVA_OPTIONS="$JDK_JAVA_OPTIONS --add-opens=java.base/sun.nio.ch=ALL-UNNAMED"
JDK_JAVA_OPTIONS="$JDK_JAVA_OPTIONS --add-opens=java.rmi/sun.rmi.transport=ALL-UNNAMED"
JDK_JAVA_OPTIONS="$JDK_JAVA_OPTIONS --add-opens=java.xml/com.sun.org.apache.xerces.internal.parsers=ALL-UNNAMED
```

### Unable to Determine Server Capabilities

If using JDK 11 on Linux or UNIX and are activating Liferay DXP using an LCS 5.0.0 client, the following errors might appear in the logs:

```properties
ERROR [LCS Worker 2][BaseScheduledTask:92] java.lang.reflect.InaccessibleObjectException: Unable to make public long com.sun.management.internal.OperatingSystemImpl.getOpenFileDescriptorCount() accessible: module jdk.management does not
 "opens com.sun.management.internal" to unnamed module @1a3325e5
java.lang.reflect.InaccessibleObjectException: Unable to make public long com.sun.management.internal.OperatingSystemImpl.getOpenFileDescriptorCount() accessible: module jdk.management does not "opens com.sun.management.internal" to unnamed module @1a3325e5
at java.base/java.lang.reflect.AccessibleObject.checkCanSetAccessible(AccessibleObject.java:
at java.base/java.lang.reflect.AccessibleObject.checkCanSetAccessible(AccessibleObject.java:
at java.base/java.lang.reflect.Method.checkCanSetAccessible(Method.java:198)
at java.base/java.lang.reflect.Method.setAccessible(Method.java:192)
```

This is a known issue: [LPS-87506](https://issues.liferay.com/browse/LPS-87506). To workaround this issue, add this property after the application server JVM options:

```properties
--add-opens=jdk.management/com.sun.management.internal=ALL-UNNAMED
```

## Configuration Sample

Here is a sample `setenv.bat|sh` from Tomcat.

```properties
CATALINA_OPTS="$CATALINA_OPTS -Dfile.encoding=UTF-8 -Djava.locale.providers=JRE,COMPAT,CLDR -Djava.net.preferIPv4Stack=true -Duser.timezone=GMT -Xms2560m -Xmx2560m -XX:MaxNewSize=1536m -XX:MaxMetaspaceSize=768m -XX:MetaspaceSize=768m -XX:NewSize=1536m -XX:SurvivorRatio=7"
CATALINA_OPTS="$CATALINA_OPTS --add-opens=java.base/java.io=ALL-UNNAMED"
CATALINA_OPTS="$CATALINA_OPTS --add-opens=java.base/java.lang.reflect=ALL-UNNAMED"
```

## Additional Information

* [Installation Overview](../01-installing-liferay-dxp/02-installation-overview.md)
