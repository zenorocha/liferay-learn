# Getting Analytics for User Segments

> **Subscription**

To use Analytics Cloud with User Segments, you must first connect your DXP data source to Analytics Cloud and enable synchronization of users and analytics. For more information about Analytics Cloud, including instructions for connecting it with DXP, see the official [Analytics Cloud Documentation](TODO).

```important::
  Synchronization with Analytics Cloud is not instant, so once you have connected Analytics Cloud and Liferay DXP, you must first wait for the users and data to synchronize. After that completes, you can create Segments in Analytics Cloud to capture data in DXP.
```

Follow these steps to get Segment analytics:

1. [Create a Segment in Analytics Cloud](TODO) if you haven't already.

    ```note::
      Only Segments that contain at least one member are synchronized with Liferay DXP. This means that empty Segments created with Analytics Cloud are unavailable to use on Liferay DXP.
    ```

1. Once the Segment is synced, go to the *Segments* page.
1. Click on the new Segment to view and customize it.

![When you see Analytics Cloud Segments in the list of Segments, they are marked with the Analytics Cloud icon.](./getting-analytics-for-user-segments/images/01.png)

Analytics are based on the criteria that you set on Analytics Cloud, but you can set additional criteria here to use this Segment for personalization in DXP. Changing the Segment criteria here doesn't affect the gathered analytics data, unless it is configured in some way that restricts its members from viewing content that you are using as an Analytics Cloud criteria.

When you put it all together to provide personalized experiences and analyze user behavior, you can see the true power of Segmentation.

## Related Information

* [Assigning Roles to User Segments](./assigning-roles-to-user-segments.md)
* [Creating User Segments](./creating-user-segments.md)
* [Content Set Personalization](../02-experience-personalization/content-set-personlization.md)
