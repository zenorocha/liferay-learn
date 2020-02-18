# Introduction to Personalizing Site Experience

<!-- This article should supersede smaller intros in segmentation and personalization - the objective is to keep these things tied together and ensure that folks see the puzzle pieces as complementary. Which the other intros were doing as well but having one intro is better in this case IMO.  -->
Liferay DXP comes out of the box with powerful tools to understand and deliver personalized experiences to your site's users.

<!-- screenshot of site experience view -->

The first step to delivering a personalized experience is to start with understanding, or Segmenting your users.

## Segmentation

Using the Segment Builder, you can group similar users by user profile attributes, behavior, site role, and more.

<!-- screenshot of segment builder view -->

See [Creating and Managing a Segment] to get started.

### Advanced and Segmentation with Liferay Analytics Cloud

Supercharge your Segments by integrating your Liferay DXP instance with Liferay Analytics Cloud. Analytics Cloud enables you to integrate DXP with Salesforce(tm) and other data sources to provide even more ways to understand and segment your user base.

<!-- screenshot of AC view -->

Integration with Analytics Cloud also provides in-depth (ML powered?) data analytics capabilities to help you understand user behavior and session data for every page of your DXP site.

## Personalization

Once you've [created User Segments](../01-segmentation/segmentation-intro.md), you can begin tailoring site experiences specific to a User Segment.

Content Page Personalization and Content List Personalization are two methods delivering personalized user experiences.

### Content Pages

Content Page Personalization dynamically changes the page layout and content based on who is viewing the page. You can create *Experiences* for any [Content Page](../../02-creating-pages/building-content-pages.md) which provide different text, images, widgets, and even different layouts based on the User Segment criteria of the user viewing the page. See [Content Page Personalization](./content-page-personalization.md) for more information.

<!-- Screenshot of content pages personalization -->

### Content Sets

[Content Sets](TODO) organize and display content. Content Set Personalization provides dynamic selection of Content Sets based on User Segments. This means the Content Set which displays in a given context is determined by their User Segment criteria. For example, you could use a content list to display "featured" articles at the top of a page. Then you could create User Segments containing users who should receive more specialized content, rather than the default. Those Segments would then see content personalized to their interest rather than the default. See [Content Set Personalization](./content-set-personalization.md) for more information.

<!-- Screenshot of content sets personalization -->
