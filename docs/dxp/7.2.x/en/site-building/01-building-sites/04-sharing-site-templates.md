# Sharing Site Templates

If you want to export a Site that uses Site Templates or Page Templates to a different environment (through a LAR file or remote publication), the templates must be exported and imported manually in advance or the import fails.

To export a Site using a Site Template, follow these steps:

1.  Open the Product Menu and go to *Control Panel* &rarr; *Sites* &rarr; *Site Templates*.

2.  Open the *Actions* Menu (![Actions](../../../images/icon-actions.png)) for the Site Template you want to export and select *Manage*.
 
3.  From the Site Template's *Pages* page, open the Product Menu and select *Publishing* &rarr; *Export* under the Site Template's menu.

4.  Click the *Add* icon (![Add](../../../images/icon-add.png)) to create a new custom export.
 
5.  Select the content and pages you want to export and click *Export*.

6.  Click on the *Download* icon for the template that you exported.

7.  In your target environment (Liferay Portal instance), go to *Control Panel* &rarr; *Sites* &rarr; *Site Templates* and create a new Site Template.

8.  Open the *Actions* Menu (![Actions](../../../images/icon-actions.png)) for the Site Template and select *Manage*.

9.  From the Site Template's Pages page, open the Product Menu and select  *Publishing* &rarr; *Import* under the Site Template's menu and import the Site Template LAR you just downloaded.

Now the Site Template can be used normally in the new environment. For more information on exporting/importing content, see [Importing/Exporting Pages and Content](./09-importing-exporting-pages-and-content.md).
