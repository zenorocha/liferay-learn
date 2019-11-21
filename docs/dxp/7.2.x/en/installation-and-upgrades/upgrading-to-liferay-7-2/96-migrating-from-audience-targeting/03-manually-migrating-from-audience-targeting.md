# Manually Migrating from Audience Targeting

Some Audience Targeting rules do not have a direct equivalent in Liferay DXP 7.2 and, therefore, they cannot be migrated automatically. Here are the recommended solutions for each rule type.

## User Attribute Rules

Some User Attributes, like Gender or Age, do not have a direct equivalent in DXP 7.2. User Attributes retrieved from external sources like Facebook also do not have a replacement. To replace these, you must create a [custom user field](/docs/7-2/user/-/knowledge_base/u/creating-segments-with-custom-fields-and-session-data) and use that to define your new Segment.

## Session Rules

For Session attributes that do not have a direct equivalent, the recommended solution is to use a URL field for the current URL or a previously visited URL on your site as criteria, or to use a Cookie for more advanced session tracking needs.

## Behavior Rules

In DXP 7.2, analytics are now managed through Analytics Cloud. You can learn more about creating behavior based rules in the [Analytics Cloud documentation](https://help.liferay.com/hc/en-us/articles/360006947671-Creating-Segments).

## Migrating Custom Rules

Audience Targeting segmentation features could be extended using custom rules. As part of the upgrade planning process, the function of any such rules should be re-evaluated with the new Segmentation features of DXP 7.2 in mind. 

First, check the [Segmentation reference](/docs/7-2/reference/-/knowledge_base/r/defining-segmentation-criteria) for whether any new criteria fields can replace their function. In particular, custom fields, URL fields, and cookies might help you migrate your custom rules with little to no additional development. 

If none of them cover your requirements, follow the development guide for instructions on [how to add new criteria fields and contributors](/docs/7-2/frameworks/-/knowledge_base/f/segmentation-personalization).

## Migrating Display Portlets

With Audience Targeting, you could display personalized content with the User Segment Display Content portlet or by using Asset Publisher with the [Segments filter enabled](https://help.liferay.com/hc/en-us/articles/360018174271-Using-the-Audience-Targeting-Widgets-). In DXP 7.2, you must choose the most appropriate personalization option for your use cases. 

### User Segment Content Display

The User Segment Content Display portlet was used to display existing content based on segment membership rules. In DXP 7.2, you can cover the same use case by defining manual content sets with variations for your different audiences and applying it to an asset publisher. See the documentation for [creating personalized Content Sets](/docs/7-2/user/-/knowledge_base/u/content-set-personalization). With this feature, you can assign any number of assets to the Content List for the given audience, and then use the Asset Publisher to define how content is displayed on the page. 

### Asset Publisher Personalization

Finally, if you want to display a dynamic list of content for your different audiences based on a filter (like using a Segments filter in an Asset Publisher, as with Audience Targeting), you can create a dynamic content set with variations for your audiences and apply it to an Asset Publisher.

<!-- TODO: [Link to Personalized Content Sets, dynamic section]. -->

In addition, the new [Experience-based Content Page personalization](/docs/7-2/user/-/knowledge_base/u/content-page-personalization) feature may fulfill a use case that you were previously solving with one of the methods previously available.
