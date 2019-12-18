# Introduction to Site Building

Sites are a fundamental component of Liferay DXP. At it's core, a Site is a collection of pages that contains content. However, a Site can also contain applications that provide additional functionality for the page---many are available for you to use out-of-the-box. Liferay DXP includes powerful features that you can harness to streamline the Site creation process and create unique and positive experiences for your Site's users.

## Creating Sites

Liferay DXP includes all the tools you need to [build your Site](./01-building-sites/01-adding-sites.md) and [create pages](TODO). You can create a Site from an existing [Site Template](./01-building-sites/02-building-sites-with-site-templates.md) to get you started, which includes a predefined set of pages with applications, or you can create a blank Site and build it from the ground up. Pages are just as flexible. Create a page from an existing [page type](TODO) or create one from one of the default [page templates](TODO), or a page template you've created yourself, to save time. Both sites and pages can be organized hierarchically. You can add as many nested pages (child pages) and [nested sites](./01-building-sites/07-site-hierarchies.md) (child sites) as you like for the parent Site or page. It's likely that you'll have multiple sites across your Liferay DXP instance for various Organizations, employees, etc. You can share content and pages between sites with the [import and export options](./01-building-sites/09-importing-exporting-pages-and-content.md). 

[Navigation](TODO) is hassle-free. Pages are automatically added to the navigation when they're created. This is flexible as well. You can hide pages if you prefer, or simply make them private, so only [members of the Site](./01-building-sites/05-adding-members-to-sites.md) can view them with the proper permissions.

Liferay DXP is designed to provide the best experience possible for your users. Making changes to your Site shouldn't prevent your users from using it. And once those changes are ready, you should be able to integrate them seamlessly. Liferay DXP's [Staging environment](TODO) handles this for you. You can stage your Site to continue perfecting it in a safe environment, without affecting the live site that your users see. When your Site has reached the peak of perfection, publish your changes so your users can reap the benefits of all your hard work.

## Creating and Displaying Content

Liferay DXP's Content Management System (CMS) is intuitive and user-friendly, offering a variety of tools that you can use to create and display content of many types. You can use the [Web Content Display widget](TODO) to display web content articles of your choosing, or if you'd like to display a mix of content (asset) types (blogs, images, web content articles, etc.) you can use the [Asset Publisher](TODO). You can manually select the content the Asset Publisher displays, or you can have it display assets dynamically based on specific criteria, giving you a great deal of control over the experience your users have. You can also embed content from other websites with the [Iframe widget](TODO) or by creating an [Embedded Page](TODO).

You can create and edit content inline with [Fragments](TODO). Fragments are individual pieces of code (CSS, HTML, and JavaScript) that you can [arrange and combine](TODO) to build a page. Several Fragments are included out-of-the-box that you can modify to create your content. If you require a more custom solution, you can [create your own](TODO).

Each piece of content (asset) has a default page that's displayed when you view it, but you can provide a customized landing page for it by creating a [Display Page Template](TODO). A Display Page Template maps portions of the Web Content (title, main body, image, etc.) to Fragments, so you can create the look you desire.

## Personalizing User Experiences

Liferay DXP's [Personalization](./11-experience-personalization/01-personalization-intro.md) and [Segmentation](./10-segmentation/01-segmentation-intro.md) framework lets you display content based on the user's interests. You can [create Segments](./10-segmentation/02-creating-user-segments.md) that target a subset of users based on specific criteria, such as the Organizations they belong to or their Role in the Site, and then use it to display [personalized page layouts and content](./11-experience-personalization/02-content-page-personalization.md) for the user demographic, or you can [integrate with Analytics Cloud](./10-segmentation/04-analytics-cloud-segmentation.md) to analyze the behavior of the users within the Segment to see how they interact with your Site. You can even [recommend content based on a user's behavior](TODO). 

## Customizing and Configuring Sites

A multitude of [settings](TODO) are available for your Site, so you can configure it to your exact specifications. You can also [localize your Site and Content](TODO) for multiple languages if you need to. 

You can further customize your Site by [creating a Theme](TODO). A Theme provides the overall look and feel for a Site. It's responsible for defining the CSS, JavaScript, and HTML for the page (via FreeMarker templates).  FreeMarker combines standard HTML elements and provides the added benefit of variables, conditional statements, looping, and more. See [Developing Themes](TODO) for more information.

## Optimizing Sites

Liferay DXP provides multiple tools and features for optimizing your Site, from increasing your Site's [Search Engine Optimization (SEO) ranking](TODO), to [creating responsive pages](TODO) optimized for each device, to honing your messaging campaigns with [A/B Testing](TODO). A/B Testing compares the current default variation of a page with the page variant(s) to see which pages perform better for a given goal (bounce rate, clicks, etc.). This enables you to make better, data-driven decisions about your site, so you can serve users and customers faster than ever before.