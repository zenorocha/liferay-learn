# Configuring External Services in Server Administration

Liferay DXP Users can upload and share any type of file via the Documents and Media library, a customizable and permissions-enabled online repository for files (see [Publishing and Sharing](./../../content-authoring-and-management/documents-and-media/publishing-and-sharing) for more information).

[PDFBox](https://pdfbox.apache.org/) by default generates Liferay DXP's automatic previews for certain file types (mostly PDFs). You can install two additional tools to generate previews for other file types: 

<!--
-   [**OpenOffice:**](https://www.openoffice.org/) or [**LibreOffice:**](https://www.libreoffice.org/)
    Convert and generate previews for many types of documents. 
-->

-   [**ImageMagick:**](https://www.imagemagick.org/script/index.php) Generate higher-quality image previews for many types of images. 

-   [**Xuggler:**](http://www.xuggle.com/xuggler/) Convert and generate previews for audio and video files. 

![Enable ImageMagick, Ghostscript, and Xuggler from the External Services tab.](./configuring-external-services-in-server-administration/images/01.png)

```note::
   As of Liferay 7.1, OpenOffice/LibreOffice is configured in OSGi Configuration Admin instead of Server Administration or portal properties. To adjust these settings, go to System Settings and find the OpenOffice Integration entry. Alternatively, deploy a com.liferay.document.library.document.conversion.internal.configuration.OpenOfficeConfiguration.config file with the settings you need.
```

First install ImageMagick and Xuggler on the server, then use the Server Administration app's External Services tab to configure their use with Liferay DXP. Make sure to choose the correct versions of these tools for your operating system. Install the latest stable versions, as older versions may not run properly with Liferay DXP. ImageMagick must be installed manually, but you can install Xuggler from the Control Panel. 

```tip:::
   Xuggler requires glibc version 2.6 or later on Linux.
```

## Configuring ImageMagick in Server Administration

Before configuring ImageMagick to generate image and PDF previews, install it and its dependency, Ghostscript. This differs by operating system: on Linux, both are likely already installed. They are not likely to be installed on Windows, but may be on macOS.

1. Download and install [ImageMagick](https://www.imagemagick.org/script/index.php).

1. Download and install [Ghostscript](https://www.ghostscript.com/).

Once installed, enable ImageMagick in the Server Administration app's External Services tab, or in a [Portal Properties](./../../installation-and-upgrades/reference/portal-properties.md) file. If using `portal-ext.properties`, add the following lines and make sure the search path points to the directories containing the ImageMagick and Ghostscript executables. You may also need to configure the path for fonts used by Ghostscript when in macOS or Unix environments.

To enable ImageMagick from the Server Administration app's External Services tab,

1. In the *Control Panel*, navigate to *Configuration* &rarr; *Server Administration*, then click the *External Services* tab.

1. Expand the ImageMagick and Ghostscript section and select *Enabled*.

1. Verify that the paths to the ImageMagick and Ghostscript executables are correct.

1. Set the Resource limits to use.

### Configuring ImageMagick in a Portal Properties File

ImageMagick can alternatively be enabled in a [Portal Properties](./../../installation-and-upgrades/reference/portal-properties.md) file. If using `portal-ext.properties`, add the following lines and make sure the search path points to the directories containing the ImageMagick and Ghostscript executables. You may also need to configure the path for fonts used by Ghostscript when in macOS or Unix environments. 

```properties
imagemagick.enabled=true
imagemagick.global.search.path[apple]=/opt/local/bin:/opt/local/share/ghostscript/fonts:/opt/local/share/fonts/urw-fonts
imagemagick.global.search.path[unix]=/usr/local/bin:/usr/local/share/ghostscript/fonts:/usr/local/share/fonts/urw-fonts
imagemagick.global.search.path[windows]=C:\\Program Files\\ImageMagick
```
## Configuring Xuggler in Server Administration

To install and configure Xuggler,

1. In the *Control Panel*, navigate to *Configuration* &rarr; *Server Administration*, then click the *External Services* tab. 

1. In the Xuggler section, select the Xuggler `.jar` file that matches your operating system. Then click *Install*. 

1. Shut down the application server. If you're enabling Xuggler with a Portal Properties file rather than in Server Administration, jump to the [Enabling Xuggler with a Portal Properties File](#enabling-xuggler-wtih-a-portal-properties-file) section. Otherwise, restart your application server now and then perform the next step. 

1. Finish by enabling Xuggler: go back to the External Services tab in Server Administration and select *Enabled*.

   ![Once Xuggler is installed and Liferay DXP is restarted, the Enable check box appears.](./configuring-external-services-in-server-administration/images/02.png)

1. Click *Save*. 

## Enabling Xuggler with a Portal Properties File

Xuggler can alternatively be enabled with a [Portal Properties](./../../installation-and-upgrades/reference/portal-properties.md) file. Add this line to `portal-ext.properties`,

```properties
xuggler.enabled=true
```

Restart the application server to finish enabling Xuggler.
