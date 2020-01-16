# Content Page Elements and Interface

Content Pages, like Widget Pages, are built by dragging and dropping elements onto the page and then configuring the way those elements appear. These elements, called *Fragments*, are described here, along with an overview of the Content Page UI. See [Building Content Pages](./04-building-content-pages.md) to learn how to use these elements to build a Content Page. 

Your tools for building the page are all found on the right side of the page. From top to bottom, these options are available:

- [Sections](#sections)
- [Section Builder](#section-builder)
- [Widgets](#widgets)
- [Contents](#contents)
- [Page Structure](#page-structure)
- [Look and Feel](#look-and-feel) 

Liferay Portal ships with a plethora of Layouts, Sections, Components, and Widgets to use to build pages, and a [web developer can create their own Fragments](TODO) to add to these.

## Sections

Sections are complete Fragments that serve a purpose by themselves. A large banner image with a text overlay is an example of something you might build as a section. 

![Figure 1: A Section named *Banner* being displayed while editing a Content Page.](./content-page-elements/images/01.png)

When you open *Sections* you see a list of Collections available. Initially, you only have the **Basic Sections** Collection which is included out-of-the-box. You can open the Collection and drag Sections directly onto the page.

![Figure 2: Sections contain Fragments that fully define spaces on your page.](./content-page-elements/images/02.png)

## Section Builder

In Section Builder, you start with *Layouts* and *Basic Components*. Add Layouts to the page to provide spaces where you can add Components.

![Figure 3: Sections Builder contains Component Fragments which are intended to be combined to create Sections.](./content-page-elements/images/03.png)

### Layouts

Layouts provide a space where you can add Fragments or Widgets. Each Layout you add fills the width of the page. You can add any number of layouts to the page.

![Figure 4: A 3 Column and 1 Column layout stacked on top of each other.](./content-page-elements/images/04.png)

### Components

Components are small design elements or pieces that add functionality to the page. A Component might be an image with formatting or a block of text with styling pre-applied. While Sections should be complete by themselves, Components work together to build pages piece by piece.

![Figure 5: Here are several of Liferay's out of the box components arranged in a Layout.](./content-page-elements/images/05.png)

## Widgets

The Widgets section functions just like the *Add* menu on a Widget Page. The full list of available widgets is displayed, and you can add them to the page. The main difference is that only the main configuration options for Widgets on Content Pages. Various other configurations like *Look and Feel* are only available for Widgets on Widget Pages.

![Figure 6: The Widgets section provides a list of Widgets that can be added inside of a Layout.](./content-page-elements/images/06.png)

## Contents

Since Liferay DXP 7.3, the Contents section provides a list of the web content that's used on the page. This includes content displayed in a widget and content mapped to content fields. Click the *Contents* button (![Contents](../../images/icon-contents.png)) to open the Contents panel. From this section, you can perform these actions for each piece of content used on the page:

- *Edit:* Edit the web content 
- *Permissions:* Update the web content's permissions
- *View Usages:* See where the web content is used on the site

>**Note:** To edit inline content, you must have the "Edit Inline Content" permission assigned to your Role. However, if you don't have permission to edit the page, you can still edit content (web content, blog, etc.) that you have permission to edit that's displayed through one of these methods: mapped content, web content display, or an Asset Publisher (with manual selection).  

Hover over the content in the list to highlight the widget(s), mapped content fields, and Fragments that display the content on the page.

![Figure 7: You can manage web content on a Content Page from the Contents panel.](./content-page-elements/images/07.png)

>**Note:** Web content that's displayed in an Asset Publisher with dynamic selection isn't listed in the Contents panel. You must manage this content directly from the Web Content admin app in the Control Panel.

## Page Structure

Page Structure provides a high level view of every Fragment and every field within each Fragment on the page. Click on a field in the page structure to highlight it on the page and quickly locate it amongst all the other elements.  

![Figure 8: *Page Structure* shows you a hierarchy of your page.](./content-page-elements/images/08.png)

## Look and Feel

Click the *Look and Feel* icon (![Look and Feel](../../../images/icon-look-and-feel.png)) to change the Theme or manage other options for the page. These options are fully documented in [Configuring Individual Pages](./06-configuring-individual-pages.md#look-and-feel). 

## Comments

You can comment on a Page Fragment to discuss changes and collaborate. Comments are disabled by default, but Administrators can enable them:

1.  Open the Product Menu and go to *Control Panel* &rarr; *Configuration* &rarr; *System Settings* &rarr; *Pages* &rarr; *Content Page Editor*.

2.  Select the *Comments Enabled* checkbox and click *Update*. 

This enables content page comments for all instances. To control this on an instance-by-instance basis, navigate to the same setting in *Instance Settings* (instead of System Settings). 

![Figure 9: Administrators can enable comments for content pages.](./content-page-elements/images/09.png)

If comments are enabled, you can access them via the *Comments* icon (![Comments](../../../../../images/icon-comments.png)). The comments appear for the selected Fragment. These actions are available for Fragment comments:

-   Add new comments and reply to any existing ones. 
-   Resolve comments by clicking the checkbox for each. Resolving a comment hides it from view, unless *Show Resolved Comments* is selected. 
-   Edit and delete your own comments via the Actions button (![Actions](../../../images/icon-actions.png)) for each. 

If you de-select a Fragment or enter the comments UI without a Fragment selected, a list of the Fragments on the page appears with the number of comments for each. Selecting a Fragment then shows its comments. 

![Figure 10: When creating content pages, you and your team can comment on any fragments.](./content-page-elements/images/10.png)

## The Title Bar

The title bar provides navigation back to the Main Menu or live view of the page, a link to page configuration, and the ability to search for other pages. 

![Figure 11: The title bar has several tools built into it.](./content-page-elements/images/11.png)

## Editable Elements

Fragments can have editable elements. After a Fragment has been added to a page, you can click on an editable area to provide your own text, image, or links in place of the default defined in the Fragment. You can also [map these elements](./04-building-content-pages.md#mapping-elements) to content. 

For more information on developing these elements, see [Fragment Specific Tags](TODO).

Now you'll learn about each editable type.

### Editable Text

Editable text can be plain or rich text. Plain text has no special styling. Rich text enables text styles, typographical emphasis, alignment, and list formatting.

![Figure 12: The rich text editor provides a simple WYSIWYG interface with a number of formatting options.](./content-page-elements/images/12.png)

### Editable Images

Editable image elements let you replace the placeholder image with a provided URL or an image from your Documents and Media library. You can also provide a link target for the image.

![Figure 13: Editing an image allows you to enter a URL, select an image from Documents and Media or set a link for the image.](./content-page-elements/images/13.png)

You can also define a link for your image. You'll learn about this next.

### Editable Links

Editable links can be associated with entities that redirect you to a content type or Page (e.g., buttons).

For more information on developing editable links, see [Creating Editable Links](TODO).