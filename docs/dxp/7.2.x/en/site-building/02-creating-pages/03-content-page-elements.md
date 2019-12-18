# Content Page Elements and Interface

Content Pages, like Widget Pages, are built by dragging and dropping elements onto the page and then configuring the way those elements appear. These elements, called *Fragments*, are described here, along with an overview of the Content Page UI. See [Building Content Pages](./04-building-content-pages.md) to learn how to use these elements to build a Content Page. 

Your tools for building the page are all found on the right side of the page. From top to bottom, these options are available:

- [Sections](#sections)
- [Section Builder](#section-builder)
- [Widgets](#widgets)
- [Page Structure](#page-structure)
- [Look and Feel](#look-and-feel) 

Liferay Portal ships with a plethora of Layouts, Sections, Components, and Widgets to use to build pages, and a [web developer can create their own Fragments](TODO) to add to these.

## Sections

Sections are complete Fragments that serve a purpose by themselves. A large banner image with a text overlay is an example of something you might build as a section. 

![Figure 1: A Section named *Banner* being displayed while editing a Content Page.](./content-page-elements/images/01.png)

When you open *Sections* you see a list of Collections available. Initially, you only have the **Basic Sections** Collection which is included out-of-the-box. You can open the Collection and drag Sections directly onto the page.

![Figure 2: *Sections* contains Fragments that fully define spaces on your page.](./content-page-elements/images/02.png)

## Section Builder

In Section Builder, you start with *Layouts* and *Basic Components*. Add Layouts to the page to provide spaces where you can add Components.

![Figure 3: *Sections Builder* contains *Component* Fragments which are intended to be combined to create Sections.](./content-page-elements/images/03.png)

### Layouts

Layouts provide a space where you can add Fragments or Widgets. Each Layout you add fills the width of the page. You can add any number of layouts to the page.

![Figure 4: A 3 Column and 1 Column layout stacked on top of each other.](./content-page-elements/images/04.png)

### Components

Components are small design elements or pieces that add functionality to the page. A Component might be an image with formatting or a block of text with styling pre-applied. While Sections should be complete by themselves, Components work together to build pages piece by piece.

![Figure 5: Here are several of Liferay's out of the box components arranged in a Layout.](./content-page-elements/images/05.png)

## Widgets

The Widgets section functions just like the *Add* menu on a Widget Page. The full list of available widgets is displayed, and you can add them to the page. The main difference is that only the main configuration options for Widgets on Content Pages. Various other configurations like *Look and Feel* are only available for Widgets on Widget Pages.

![Figure 6: The Widgets section provides a list of Widgets that can be added inside of a Layout.](./content-page-elements/images/06.png)

## Page Structure

Page Structure provides a high level view of every Fragment and every field within each Fragment on the page. Click on a field in the page structure to highlight it on the page and quickly locate it amongst all the other elements.  

![Figure 7: *Page Structure* shows you a hierarchy of your page.](./content-page-elements/images/07.png)

## Look and Feel

Click the *Look and Feel* icon (![Look and Feel](../../../images/icon-look-and-feel.png)) to change the Theme or manage other options for the page. These options are fully documented in [Configuring Individual Pages](./06-configuring-individual-pages.md#look-and-feel). 

## Comments

You can comment on a Page Fragment to discuss changes and collaborate. Comments are disabled by default, but Administrators can enable them:

1.  Open the Product Menu and go to *Control Panel* &rarr; *Configuration* &rarr; *System Settings* &rarr; *Pages* &rarr; *Content Page Editor*.

2.  Select the *Comments Enabled* checkbox and click *Update*. 

This enables content page comments for all instances. To control this on an instance-by-instance basis, navigate to the same setting in *Instance Settings* (instead of System Settings). 

![Figure 8: Administrators can enable comments for content pages.](./content-page-elements/images/08.png)

If comments are enabled, you can access them via the *Comments* icon (![Comments](../../../../../images/icon-comments.png)). The comments appear for the selected Fragment. These actions are available for Fragment comments:

-   Add new comments and reply to any existing ones. 
-   Resolve comments by clicking the checkbox for each. Resolving a comment hides it from view, unless *Show Resolved Comments* is selected. 
-   Edit and delete your own comments via the Actions button (![Actions](../../../images/icon-actions.png)) for each. 

If you de-select a Fragment or enter the comments UI without a Fragment selected, a list of the Fragments on the page appears with the number of comments for each. Selecting a Fragment then shows its comments. 

![Figure 9: When creating content pages, you and your team can comment on any fragments.](./content-page-elements/images/09.png)

## The Title Bar

The title bar provides navigation back to the Main Menu or live view of the page, a link to page configuration, and the ability to search for other pages. 

![Figure 10: The title bar has several tools built into it.](./content-page-elements/images/10.png)

## Editable Elements

Fragments can have editable elements. After a Fragment has been added to a page, you can click on an editable area to provide your own text, image, or links in place of the default defined in the Fragment. You can also [map these elements](./04-building-content-pages.md#mapping-elements) to content. 

For more information on developing these elements, see [Fragment Specific Tags](TODO).

Now you'll learn about each editable type.

### Editable Text

Editable text can be plain or rich text. Plain text has no special styling. Rich text enables text styles, typographical emphasis, alignment, and list formatting.

![Figure 11: The rich text editor provides a simple WYSIWYG interface with a number of formatting options.](./content-page-elements/images/11.png)

### Editable Images

Editable image elements let you replace the placeholder image with a provided URL or an image from your Documents and Media library. You can also provide a link target for the image.

![Figure 12: Editing an image allows you to enter a URL, select an image from Documents and Media or set a link for the image.](./content-page-elements/images/12.png)

You can also define a link for your image. You'll learn about this next.

### Editable Links

Editable links can be associated with entities that redirect you to a content type or Page (e.g., buttons).

For more information on developing editable links, see [Creating Editable Links](TODO).