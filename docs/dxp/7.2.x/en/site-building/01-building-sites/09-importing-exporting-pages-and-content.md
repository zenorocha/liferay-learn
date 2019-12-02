# Importing/Exporting Sites and Content

Export/Import lets you migrate and restore your Site and app data as a LAR (Liferay Archive). There are two primary places Export/Import is used: Sites and apps. You can learn more about exporting/importing app data in the [Exporting/Importing Widget Content](TODO) section. In this section, you'll learn how to export and import content and pages for Sites.

## Site LAR Properties and Requirements

LARs have these properties and requirements:

- LARs are version dependent. They can be imported into a Site on another Liferay Portal server, as long as the Liferay Portal versions on each server are the same.

- Some naming collisions are handled automatically. For example, if the LAR you're importing and the Site both have a page with the same friendly URL, a number is appended to the friendly URL and incremented until the collision no longer occurs. The same is true for category names that collide. 

- You can restore your Site with the latest LAR, but to do so you must delete your Site entirely and then create a new Site with the same name to import the LAR into. This avoids potential data conflicts between content that exists both in the LAR and in the Site.

If you want to regularly move pages from one server to another, you should use Liferay Portal's Staging environment instead of a LAR. See the [Staging](TODO) section for more details.

Also, note that periodically exporting LARs is *not* a backup solution; it should only be used to migrate information between two environments. Please refer to the [Backing up a Liferay Portal Installation](TODO) section for information on backing up Liferay Portal.

## Importing and Exporting Pages

Follow these steps to export and import your Site's pages:

1.  Open the Product Menu and select *Publishing* &rarr; *Export* under your Site's Menu. 

2.  Click *Add* (![Custom Export](../../../images/icon-add.png)). 

    A *New Custom Export* page loads, so you can choose the pages and content you want to export from your Site:
    
    - Site pages (you can select exactly which ones)
    - Page settings
    - Theme
    - Theme settings
    - Logo
    - Application configurations
    - Application content
    - Archived setups
    - User preferences

3.  Enter a Title.

4.  Under *Pages*, select Public or Private Pages and the settings you want to export.
 
5.  Under the *Content* category, select *All* to export all content or specify a date range or time to filter the content to export.

    Note that if you select one of the *Choose* radio selectors or *Change* links, you're given checkboxes for options to choose. Application content can also be selected for export, including the Documents and Media Library, Message Boards, and Web Content assets. You can even export the theme you're using. 
    
6.  Select whether the permissions for your exported pages and content are included.
    
    ![Figure 1: You can configure your export options manually by selecting pages, content, and permissions.](./importing-exporting-pages-and-content/images/01.png)

7.  Click *Export*.

    The menu automatically switches to the *Processes* tab, where you see the status of your exported LAR file. 

8.  Select the *Download* icon (![Download](../../../images/icon-download.png)) to download the export to your local machine and copy it to a secure location for safekeeping or import it into another installation of Liferay Portal. 

9.  To rebuild or revert back to this version of your Site, you can import this file by clicking the *Import* button from the Publishing menu, browsing to it, and selecting it. You can also drag a LAR file inside the dotted area, which also executes the import process.

## Creating Export Templates

Instead of manually creating an export process every time you export pages and/or content, you can create an Export Template to store the export process settings so they can be reused. To create an Export Template, follow these steps:

1.  Open the Product Menu and select *Publishing* &rarr; *Export* under your site's Menu.

2.  Select the *Options* icon (![Options](../../../images/icon-options.png)) from the top right corner of the screen and select *Export Templates*.

3.  Click the *Add* button (![Add Export Template](../../../images/icon-add.png)).

4.  Provide a *Name* and *Description* for the template.

5.  Fill out the configuration options for your export process.

6.  Click *Save*.

Your template is now available to use from the *Export Templates* menu.

## Using Export Templates
 
To use an Export Template, follow these steps:

1.  Click the *Actions* (![Actions](../../../images/icon-actions.png)) Menu next to the Export Template and select *Export*.

    This automatically fills in the fields and options for exporting pages and their content.

2.  Give the export a name.

3.  Click *Export* to generate your LAR file.
