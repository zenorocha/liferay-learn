# Understanding Pages

Sites primarily exist for the sake of organizing pages and content. Even users' personal pages are part of their personal Sites. All pages belong to one of two types of Page Sets: Public Pages or Private Pages. By default, anyone can access Public Pages, even non-logged in users (guests). Only users who are members of the Site can access its Private Pages.

## Page Types

There are several page types available when you [add a page](./02-adding-a-page-to-a-site.md). The two main page types are Content pages and Widget pages. You can also create a page based on a [Page Template](./07-creating-a-page-template.md). The available page types and Page Templates are described here.

![Figure 1: You must select a page type when adding pages.](./understanding-pages/images/01.png)

### Content Pages

This page type is flexible, especially for non-technical users. Content Pages empower marketers and content creators to build pages that can be easily managed and have their content edited in-line on the fly. Like Widget Pages, Content Pages let you add widgets, but they are primarily built using [Page Fragments](TODO): reusable pieces of UI (CSS, HTML, and JavaScript) that contain editable portions that you can modify to design your page. 

Page Fragments can contain anything from images, to text, to carousels, and anything else you can build. Each Page Fragment is like a single puzzle piece that can fit in many different puzzles. Page Fragments can be built from a single Component or multiple Components, such as a Paragraph or an image, that can be added to a layout, or they can be sectional pieces that take up an entire row. See [Content Page Elements](./03-content-page-elements.md) for more information.

You should always opt for Content Pages, unless there's a concrete reason otherwise. Content Pages offer many key features of Widget Pages plus more. Some key features of Content Pages are listed below:

* [personalized Experiences](../../05-personalizing-site-experience/02-experience-personalization/01-personalization-intro.md)
* [A/B Testing](TODO) 
* Easier to use overall 
* More powerful for non-technical users compared to Widget Pages

### Widget Pages

The *Widget Page* option creates a page with a Layout Template that defines a number of rows and columns for adding *widgets* (applications) to the page. Widgets can display content or add functionality to the page, such as a tool. If the default layout options provided aren't enough, you can [create your own](TODO). When you first start Liferay Portal, you get a Widget Page by default as your home page.

Once the Widget Page is created, you can either browse through the categories of available widgets until you find the one you want, or you can search for widgets by name. Once you've found a widget, click the *Add* button to add it to the current page. Once there, you can drag it to a new position. Alternatively, you can drag the widget directly from the Widgets menu to a specific location on the page. A widget could be a wiki display or a dynamic publishing tool like the Asset Publisher. The content you display with widgets could be long-form text or an image gallery, or anything in between.

There are some use cases (particularly if a page's sole purpose is to host an application) to prefer Widget Pages. There are still a few things that Widget Pages provide that are not possible with Content Pages:

* *Developing an advanced custom layout*: Using Content Pages, authors can create their own page layouts. This prevents developers from creating pre-selectable, custom layouts with FreeMarker like Widget Pages allowed for. Though Content Pages let you create a layout visually (a more user-friendly approach), the programmatic approach of Widget Pages allows for more advanced capabilities.

* *User-Customizable columns*: This is a rarely used feature of Widget Pages that is not provided in Content Pages. If your page requires a user-customizable column, you must use a Widget Page.

* *Using Staging with Page Variations*: Content Pages do not support Staging's Page Variations. This avoids possible confusion with the similar capability to create variations of a page that are used in personalization and A/B Testing.

* *Widget permissions*: You can configure widget permissions on a Widget Page. This is not yet possible for Content Pages; it's planned for a future release.

* *Widget Look & Feel*: On Widget Pages you can access the [Look and Feel](TODO) tool for widgets, offering fine-grained control over its CSS. This is not available for widgets on Content Pages, since the look and feel of your content is defined in the theme or by using Fragments.

### Full Page Application

The *Full Page Application* option creates a page that displays a single application that fills the entire page.

Out of the box, you can set the Blogs, Wiki, Media Gallery, Message Boards, RSS, Hello Soy Portlet, Documents and Media, Form, or Application Authorization Request to be the sole application for the page. Developers can make their applications Full Page Applications.

Note that all of the applications that can be added to the page are non-instanceable and the content of whichever application you select is based on the instance for that site. So if you already had data in your application, such as a Wiki, it appears on the page.

If you want to configure the application to be scoped to a specific page of a wiki, you can configure that through the application's settings.

1. From the page, click the (![Options](../../../../images/icon-options.png)) button for the Wiki and select *Configuration*.
 
1. From the *Wiki - Configuration* page, select the *Scope* tab.

1. Open the *Scope* menu and select Wiki page you want.

![Configuring the scope.](./understanding-pages/images/02.png)

### Page Set

The *Page Set* option creates a container for subpages that is not actually a page itself.

### Link to a Page

The *Link to a Page of this Site* option links to a page within the same Site. This is often used to make a page available in multiple parts of a Sites hierarchy.

### Panel

The *Panel* option creates a page containing any number of applications as selected by an Administrator, but only one is displayed at a time. Users select the widget they want to display from a menu on the left side of the page. The selected application takes up the entire page.

### Embedded

The *Embedded* option displays content from another website inside your instance in an iframe. The website appears in context and within the navigation of your Liferay DXP instance.

### Link to URL

The *Link to URL* option adds a link to the provided URL. This can be an external page or a link across Sites in the same Liferay Portal instance.

### Global Page Templates

When adding a page, you also have the option to choose a Page Template. By default, only *Global Templates* are available, but additional collections you create appear as an option as well. The global Page Templates are described here.

#### Blog

The *Blog* global Page Template creates a Blogs Widget Page with a Blogs widget, a Tag Cloud widget, and a Recent Bloggers widget.

#### Search

The *Search* global Page Template creates a Widget Page with a Search Bar widget, a Search Results widget, and a Search Options widget.

#### Wiki

The *Wiki* global Page Template creates a Widget Page with a Wiki widget, a Categories Navigation widget, and a Tags Navigation widget.
