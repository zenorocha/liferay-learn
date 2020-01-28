# Introduction to Site Building

Sites are a fundamental component of Liferay DXP. At it's core, a Site is a collection of pages that contains content. However, a Site can also contain applications that provide additional functionality for the page---many are available for you to use out-of-the-box. Liferay DXP includes powerful features that you can harness to streamline the Site creation process and create rich and personalized experiences for your Site's users.

## Creating Sites

Liferay DXP includes all the tools you need to [build your Site](./building-sites/adding-sites.md) and [create pages](TODO). You can create a Site from an existing [Site Template](./building-sites/building-sites-with-site-templates.md), which includes a predefined set of pages with applications, or you can create a blank Site and build it from the ground up. Pages are just as flexible. Create a page from an existing [page type](TODO) or create one from one of the default [page templates](TODO), or a page template you've created yourself, to save time. Both sites and pages can be organized hierarchically. You can add as many nested pages (child pages) and [nested sites](./building-sites/site-hierarchies.md) (child sites) as you like for the parent Site or page. It is possible to have multiple sites across your Liferay DXP instance for various Organizations, employees, etc. You can share content and pages between sites with the [import and export options](./building-sites/importing-exporting-pages-and-content.md).

<!-- Screenshot -->

Configuring Pages and Site [Navigation](TODO) behavior is intuitive and flexible. Pages are automatically added to the navigation when they're created. You can hide pages if you prefer, or simply make them private, so only [members of the Site](./building-sites/adding-members-to-sites.md) can view them with the proper permissions.

<!-- Screenshot -->

Liferay DXP also provides tools to enable you to make changes to your site without disrupting user experience. Liferay Sites can be staged, allowing changes to be made and tested on a site before being published to users. Liferay DXP's [Staging environment](TODO) handles this for you. You can stage your Site to continue perfecting it in a safe environment, without affecting the live site that your users see.

<!-- Screenshot -->
<!-- The above paragraph about Staging should probably be adapted to be about Change Lists -->

## Creating and Displaying Content

<!-- This section feels strong with content display and light on content creation. -->

Liferay DXP's Content Management System (CMS) is intuitive and user-friendly, offering a variety of tools that you can use to create and display content of many types. You can use the [Web Content Display widget](TODO) to display web content articles of your choosing, or if you'd like to display a mix of content (asset) types (blogs, images, web content articles, etc.) you can use the [Asset Publisher](TODO). You can manually select the content the Asset Publisher displays, or you can have it display assets dynamically based on specific criteria, giving you a great deal of control over the experience your users have. You can also embed content from other websites with the [Iframe widget](TODO) or by creating an [Embedded Page](TODO).

<!-- Screenshot -->

You can create and edit content inline with [Fragments](TODO). Fragments are individual pieces of code (CSS, HTML, and JavaScript) that you can [arrange and combine](TODO) to build a page. Several Fragments are included out-of-the-box that you can modify to create your content. If you require a more custom solution, you can [create your own](TODO).

<!-- Screenshot -->

Each piece of content (asset) has a default page that's displayed when you view it, but you can provide a customized landing page for it by creating a [Display Page Template](TODO). A Display Page Template maps portions of the Web Content (title, main body, image, etc.) to Fragments, so you can create the look you desire.

<!-- Screenshot -->

## Personalizing User Experiences

Liferay DXP's [Personalization](./11-experience-personalization/01-personalization-intro.md) and [Segmentation](./10-segmentation/01-segmentation-intro.md) framework lets you build site experiences that respond to and meet your users interests and needs. You can [create user Segments](./10-segmentation/02-creating-user-segments.md) based on specific criteria, such as the Organizations they belong to or their Role in the Site, and then use it to display [personalized page layouts and content](./11-experience-personalization/02-content-page-personalization.md) for the user demographic, or you can [integrate with Analytics Cloud](./10-segmentation/04-analytics-cloud-segmentation.md) to analyze the behavior of the users within the Segment to see how they interact with your Site. You can even [recommend content based on a user's behavior](TODO).

<!-- Screenshot -->

## Customizing and Configuring Sites

There are many [settings](TODO) available to tweak the look, behavior, and functionality for your Site. [Sites and their Content can be easily localized](TODO) to multiple languages as needed.

The look and feel of your site can be changed by using different themes. Themes can be downloaded and deployed from [Liferay Marketplace](TODO), or you can [create a theme yourself](TODO). Themes determine the overall look and look and feel for a Site and define the CSS, JavaScript, and HTML for the page (via FreeMarker templates).  FreeMarker combines standard HTML elements and provides the added benefit of variables, conditional statements, looping, and more. See [Developing Themes](TODO) for more information.

<!-- Screenshot -->

## Optimizing Sites

Liferay DXP provides multiple tools and features for optimizing your Site, from increasing your Site's [Search Engine Optimization (SEO) ranking](TODO), to [creating responsive pages](TODO) optimized for each device, to honing your messaging campaigns with [A/B Testing](TODO). A/B Testing compares the current default variation of a page with the page variant(s) to see which pages perform better for a given goal (bounce rate, clicks, etc.). This enables you to make better, data-driven decisions about your site, so you can serve users and customers faster than ever before.
