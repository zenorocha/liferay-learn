# Building Content Pages

Several Fragments are available by default that you can use to build your Content Page. You can also [develop your own Page Fragments](TODO). Once you've [added a Content Page](./02-adding-a-page-to-a-site.md) and have the [Content Page elements](./03-content-page-elements.md) you need (Sections, Components, Widgets, etc.), follow these steps to build your Content Page:

1. If you're not already on your Content Page, open the Product Menu and go to *Site Builder* &rarr; *Pages* under your Site's Menu. Content Pages can't be edited live; they must be edited through the *Site Builder*.

1. Open the *Actions* Menu for the Content Page in the Public or Private Page Set and select *Edit*, or go to the Content Page on the Site and click the pencil icon ![pencil](../../../../icon-pencil.png) in the Control Menu to edit the Content Page. You're presented with a blank page at first.

  ![A Content Page is blank to begin with. You must add Fragments to it to build it.](./building-content-pages/images/01.png)

1. Add a combination of these Page Fragment UI pieces to build the foundation for the Content Page. See [Content Page Elements](./03-content-page-elements.md) for an explanation of these elements. Click the UI element below that you want to add and follow the instructions in the section:

  * [Component](#add-a-component)
  * [Layout](#add-a-layout)
  * [Section](#add-a-section)
  * [Widget](#add-a-widget)
  
  ![Add Fragments to the page to create the mockup you want.](./building-content-pages/images/02.png)

1. Modify the editable portions of the Page Fragments to complete the design for the Content Page. Click the editable element below that you want to update and follow the instructions in the section:

  * [Images](#modify-editable-images)
  * [Links/buttons](#modify-editable-links)
  * [Text](#modify-editable-text)

  You can also map the editable fragments. Follow the instructions in the [Mapping Fragments](#mapping-fragments) section to learn how.

  ![Modify the Fragments to display the content you want.](./building-content-pages/images/03.png)

1. As you work, a draft of the page is automatically saved. Click the *Publish* button in the top right to make the updates available to the live page.

## Add a Section

1. Open the Sections Menu.

1. Open the Collection that the Section belongs to and drag it directly onto the page.

1. Optionally edit the Section's background color (![Background Color](../../../../images/icon-color.png)), background image, and spacing. Since these options are available to marketers and Administrators editing a page, the options are limited, and the color palette can be set by the Fragment developer.

  ![The Section management tool provides powerful tools, but with the training wheels still on.](./building-content-pages/images/04.png)

1. [Complete the remaining steps to build the Content Page](#building-the-content-page).

## Add a Layout

1. Open the *Section Builder* Menu and open the *Layouts* panel. 

1. Drag the Layout onto the page, above or below an existing Layout or Section.
    
1. Optionally resize the Layout's columns. Click inside the Section containing the Layout and drag one of the blue handles that appear left or right to adjust the column widths.

1. Optionally specify a background image for a Layout from Section Builder. Click the Layout, select *Layout Background Image*, and define the image to display.

  ![Layouts have options for background color, background image, and spacing.](./building-content-pages/images/05.png)

  ```note::
    Mapping a Layout background image is available in Liferay DXP 7.2 SP1+ and Liferay Portal 7.2 GA2+.
  ```

1. [Complete the remaining steps to build the Content Page](#building-the-content-page).

## Add a Component

1. Open the *Section Builder* Menu and open the Collection that the Component belongs to. By default, only the *Basic Components* Collection is available.

1. Drag a Component to a column of an existing Layout, or add it outside an existing Layout to automatically place it in a one column Layout. While Sections should be complete by themselves, Components work together to build pages piece by piece. Repeat this step to add as many Components as you need. Multiple Components can be added to one column.

1. Optionally modify the basic styling of the Component. Click the Component and select the Fragment Configuration Cog icon. Any changes you make are applied live. You can remove, duplicate, and configure the Components you add to the page.

  ![Add some images, and the big picture comes together.](./building-content-pages/images/06.png)
    
1. [Complete the remaining steps to build the Content Page](#building-the-content-page).

## Add a Widget

1. Open the *Widgets* Menu and click the category that contains the Widget.

1. Drag the Widget to a column of an existing Layout, or add it outside an existing Layout to automatically place it in a one column Layout.
    
1. [Complete the remaining steps to build the Content Page](#building-the-content-page).

## Modify Editable Images

1. Click on the image Component that you want to replace.

1. Click (![Image Properties](../../../../images/icon-edit.png)).

1. Click *Select* to upload an image from Docs and Media or define an image URL. Click *Clear* to reset the image. You can also specify an image description.

  ```note::
    Mapping a Layout background image is available in Liferay DXP 7.2 SP1+ and Liferay Portal 7.2 GA2+.
  ```

  For more information on developing editable images, see [Making Images Editable](TODO).

1. [Complete the remaining steps to build the Content Page](#building-the-content-page).

## Modify Editable Links

1. Click on the link or button that you want to edit.

1. Click on (![Edit](../../../../images/icon-edit.png)) to edit the link text, (![Link](../../../../images/icon-link.png)) to edit the link properties, or (![Map](../../../../images/icon-map.png)) to edit the link mapping (described earlier).

  From the Link Properties popup, you can define these link options:

  *Manual:* defines a manual link or maps it to an existing content field.

  * *URL:* sets the link's URL.
  * *Target:* set the link's behavior.

  *From Content Field:* 

  * *Content:* sets the content type.
  * *Field:* sets the field to display for the selected content.

  A list of some of the available content fields is shown below:

  * Categories
  * Tags
  * Display Page URL
  * Description
  * Publish Date
  * Summary
  * Title
  * Last Editor Name
  * Author Name
  * Basic Web Content

1. [Complete the remaining steps to build the Content Page](#building-the-content-page).

For more information on developing editable links, see [Creating Editable Links](TODO).

## Modify Editable Text

1. Click on the text that you want to edit.

1. Replace the text if Plain text or use the inline text editor to update the Rich text styles, typographical emphasis, alignment, and list formatting.

1. [Complete the remaining steps to build the Content Page](#building-the-content-page).

## Mapping Elements

You can also map these elements to content. You can set the *Content* for the element (web content article, document, or blog) and choose its applicable *Field* to display (e.g., title, author name, tags, etc.). You can configure this by selecting the element's *Map* button (![Map](../../../../images/icon-map.png)).

```note::
  Many mapping improvements were released in Liferay DXP 7.2 SP1+ and Liferay Portal 7.2 GA2+. For example, mapping editable elements to text/URL fields of existing content and mapping Fragment background images to image fields of existing content. You can also map [custom fields](TODO). To ensure you leverage the latest editable element mapping features, upgrade to these versions.
```

When you create Content Pages, you can create different **Experiences** for users based on User Segments. You can create a unique Experience on any Content Page for any existing User Segment. For more information, see the [Content Page Personalization guide](../11-experience-personalization/02-content-page-personalization.md).