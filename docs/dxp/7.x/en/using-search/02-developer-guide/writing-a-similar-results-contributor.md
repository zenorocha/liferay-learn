# Contributing Custom Content to the Similar Results Widget

You can display your custom content in the [Similar Results widget](LINK to widget docs) by implementing a `SimilarResultsContributor`. Note that for the contributor to work, the Similar Results widget must be able to detect your content as the main asset on a page. That means it must be displayable via a URL in a "Display Widget", like the supported Liferay DXP assets (e.g., blogs entries and wiki pages).

> The Similar Results widget can already be used with any content displayed in Lifery DXP's Asset Publisher, without the need for a custom contributor.

picture?


You can see the [SimilarResultsContributor interface](https://github.com/liferay/liferay-portal/blob/7.3.0-ga1/modules/dxp/apps/portal-search-similar-results/portal-search-similar-results-web-spi/src/main/java/com/liferay/portal/search/similar/results/web/spi/contributor/SimilarResultsContributor.java) and the bundled [implementations](https://github.com/liferay/liferay-portal/tree/7.3.0-ga1/modules/dxp/apps/portal-search-similar-results/portal-search-similar-results-web/src/main/java/com/liferay/portal/search/similar/results/web/internal/contributor) on GitHub.

<!-- ![Out-of-the-box product types](./adding-a-new-product-type/images/01.png "Out-of-the-box product types") -->

## Overview

1. [**Deploy an Example**](#deploy-an-example)
1. [**Walk Through the Example**](#walk-through-the-example)
1. [**Additional Information**](#additional-information)

## Deploy an Example

In this section, we will get an example product type up and running on your instance of Liferay Commerce. Follow these steps:

1. Start Liferay DXP.

    ```bash
    docker run -it -p 8080:8080 liferay/portal:7.3.0-ga1
    ```

    If you're running a different Liferay Portal CE version or Liferay DXP, adjust the above command accordingly.

1. Download and unzip [the Guestbook Similar Results Contributor](./blah.zip).

    ```bash
    curl https://learn.liferay.com/dxp-7.x/[???]/blah.zip -O
    ```

    ```bash
    unzip blah.zip
    ```

1. From the module root, build and deploy.

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    >**Note:** This command is the same as copying the deployed jars to /opt/liferay/osgi/modules on the Docker container.

1. Confirm the deployment in the Liferay Docker container console.

    ```bash
    STARTED com.blah.web_1.0.0
    ```

1. Verify that the example contributor is working. Begin by opening your browser to `https://localhost:8080`

1.  Add a Guestbook at  _Site Menu_ &rarr; _Content_ &rarr; _Guestbook_.

1.  Add the Guestbook widget to a page, followed by the Similar Results widget.

1.  Add some Guestbook Entries with the same word in the _Message_ field, like these:

    _Test the Similar Results widget_

    _Test the Guestbook SimilarResultsContributor_

    _Test displaying custom content types in the Similar Results widget_

1.  Click on one of the Guestbook Entries do select it for display, as the main asset.

    The Similar Results widget now shows other related Geustbook Entries.

![New product type](./adding-a-new-product-type/images/02.png "New product type")

Now that you verified that the example behaves properly, enter the deep end to learn more.

## Walk Through the Example

Let's review the deployed example. It contains just one class: the contributor that enables custom content for the Similar Results widget.

* [Annotate the Contributor Class for OSGi Registration](#annotate-the-contributor-class-for-osgi-registration)
* [Review the `SimilarResultsContributor` Interface](#review-the-cptype-interface)

### Annotate the Contributor Class for OSGi Registration

The `GuestbookSimilarResultsContributor` implements the `SimilarResultsContributor` interface:

```java
@Component(service = SimilarResultsContributor.class)
public class GuestbookSimilarResultsContributor implements SimilarResultsContributor {
```

The `service` component property registers your implementation as a `SimilarResultsContributor` service. 

### Review the `SimilarResultsContributor` Interface

Implement the three methods from the interface.

```java
public void detectRoute(RouteBuilder routeBuilder, RouteHelper routeHelper);
```

Implement `detectRoute` to provide a distinctive portion of your entity's URL pattern, so that the Similar Results widget can detect if your contributor should be invoked. The URL pattern is added as an attribute of the `RouteBuilder` object. The `RouteHelper` is useful for retrieving the whole URL String for parsing.

```java
public void resolveCriteria(CriteriaBuilder criteriaBuilder, CriteriaHelper criteriaHelper);
```

Implement `resolveCriteria` to match the main entity on the page to the corresponding search engine document. This will be invoked if route detected indicates that your Contributor is the appropriate one.

```java
public void writeDestination(DestinationBuilder destinationBuilder, DestinationHelper destinationHelper);
```

Implement `writeDestination` to update the main asset when a User clicks a link in the similar results widget and re-run the backing More Like This Query that's used to populate the Similar Results widget. 

### Complete the Similar Results Contributor

#### Implement the `detectRoute` Method

    // Code example needs to be updated

	@Override
	public void detectRoute(
		RouteBuilder routeBuilder, RouteHelper routeHelper) {

		String urlString = routeHelper.getURLString();


    // check if the detected URL begins with "com_liferay_wiki_web_portlet_WikiDisplayPortlet"
    // but can't use SearchStringUtil since it's an internal class to sim res
    // use if statement instead

    // this might be messed up, see how this url really looks
        String portletId = _httpHelper.getPortletIdParameter(urlString, "p_p_id")
        if (portletId.ing.contains("p_p_id=" + WikiPortletKeys.WIKI_DISPLAY)) {

        // here, from the url, we use _httpHelper to add the nodeName and title of the detected entity to the URL route
            routeBuilder.addAttribute(
                "nodeName", _httpHelper.getPortletIdParameter(urlString, "nodeName")
            ).addAttribute(
                "title", _httpHelper.getPortletIdParameter(urlString, "title")
            );
        }

        /*
            SearchStringUtil.requireStartsWith(
                    WikiPortletKeys.WIKI_DISPLAY,
                    _httpHelper.getPortletIdParameter(urlString, "p_p_id"));
        */

	}

	@Override
	public void detectRoute(
		RouteBuilder routeBuilder, RouteHelper routeHelper) {

		String[] parameters = _httpHelper.getFriendlyURLParameters(
			routeHelper.getURLString());

    //check with if statement instead
		SearchStringUtil.requireEquals("blogs", parameters[0]);

		routeBuilder.addAttribute("urlTitle", parameters[1]);
	}

Now you know the ID for the detected entity, so you can use it to fetch it and the corresponding search engine document.

Implement `detectRoute` to have a distinctive portion of your entity's URL pattern injected into the logic that the Similar results widget uses to find the correct Contributor.
This method doesn't return anything, but it will be called  to check the detected URL for the Similar Results widget's page against your entity's own display URL. If your entity display URL is detected, you must add at least one attribute to the URL route for use later.
CHECK ACCURACY

One strategy that can be helpful is to check the portlet ID parameter for your content display portlet's ID.

, and further check whether the URL string contains a characteristic string that indicates
a particular entity is being displayed. For example, the Contributor logic for Liferay Wiki Pages first checks for `wikiDisplayPortlet` in the URL, then looks for `myEntityDisplay` to 
Match the URL of the _main asset_ being displayed on the page where the Similar Results widget is deployed. To decide if this is really the contributor you want. Provide logic to find your custom content URLs.

`routehlper.getUrlString` is important. Check if the portlet ID parameter starts with "wikiDisplayPortlet". If yes, this contributor is resolved. After the detecting that you are in the right page, extract the `entityID` form the URL. When you have the ID, add at least one attribute to the route in order to use later.

Now you know the ID for the detected entity, so you can use it to fetch it and the corresponding search engine document.

#### Implement the `resolveCriteria` Method

1.  Implement `resolveCriteria` to match the main entity to the corresponding search engine document. The most important concept is that you must give the `criteriaBuilder.uid` method a unique search index identifier. In the Liferay DXP index, this is done using a combination of the entry class name and the class primary key. Pass both as Strings to `Field.getUID`. This example starts by fetching the model entity using the ID you added to the attribute in the `detectRoute` method, and then uses it to retrieve the asset entry. 

	@Override
	public void resolveCriteria(
		CriteriaBuilder criteriaBuilder, CriteriaHelper criteriaHelper) {

		long groupId = criteriaHelper.getGroupId();

		String urlTitle = (String)criteriaHelper.getRouteParameter("urlTitle");

		BlogsEntry blogsEntry = _blogsEntryLocalService.fetchEntry(
			groupId, urlTitle);

        // find the blog entry in the db using the id we extracted from the url

		if (blogsEntry == null) {
			return;
		}

        // i think we'll not do this, right?  or is this a must-have null check for all assets?
		AssetEntry assetEntry = _assetEntryLocalService.fetchEntry(
			groupId, blogsEntry.getUuid());
        // why use the Uuid here?

		if (assetEntry == null) {
			return;
		}

        // this Field.getUID doesn't make sense to me, need learnin'
		criteriaBuilder.uid(
			Field.getUID(
				assetEntry.getClassName(),
				String.valueOf(blogsEntry.getEntryId())));
	}

Set the UID to the search engine document identifier. This is a combination of entryClassName and classPK for portal. Field.getUID is helpful in this.

It would be simpler if it wasn't a liferay entity (e.g., application contributed index) because the id in the url might be the document id itself (e.g., synonyms).

Now that you told the criteria what document to match, write the destination URL so the similar results are update.

Implement `resolveCriteria` to match the main entity to the corresponding search engine document. The most important concept is that you must give the `criteriaBuilder.uid` method a unique search index identifier. In the Liferay DXP index, this is done using a combination of the entry class name and the class primary key. Pass both as Strings to `Field.getUID`. This example starts by fetching the model entity using the ID you added to the attribute in the `detectRoute` method, and then uses it to retrieve the asset entry.

Set the UID to the search engine document identifier. This is a combination of entryClassName and classPK for portal. Field.getUID is helpful in this.

It would be simpler if it wasn't a liferay entity (e.g., application contributed index) because the id in the url might be the document id itself (e.g., synonyms).

Now that you told the criteria what document to match, write the destination URL so the similar results are updated.

#### Implement the `writeDestination` Method

1.  Implement `writeDestination` to update the main asset when a User clicks a link in the similar results widget. The similar results list is re-rendered to match the new main asset. The entirety of the work here is to replace the ID in the original URL for each similar result (to render the clickable links)

```java
@Override
public void writeDestination(
    DestinationBuilder destinationBuilder,
    DestinationHelper destinationHelper) {

    String urlTitle = (String)destinationHelper.getRouteParameter(
        "urlTitle");

    AssetRenderer<?> assetRenderer = destinationHelper.getAssetRenderer();

    destinationBuilder.replace(urlTitle, assetRenderer.getUrlTitle());
}
```

In addition to re-sending the qeury re-populating the Similar Results list, replace the ID (in this case urlTitle) with the new ID for each entry in the list of similar results.


Implement `writeDestination` to update the main asset when a User clicks a link in the similar results widget. The similar results list is re-rendered to match the new main asset. The entirety of the work here is to replace the ID in the original URL for each similar result (to render the clickable links)

In addition to re-sending the qeury re-populating the Similar Results list, replace the ID (in this case urlTitle) with the new ID for each entry in the list of similar results.
<!-- Does this mean that the URL for each one contains the ID of the main asset as a param? Doesn't appear so from my investigation:

main asset
http://localhost:8080/web/guest/home/-/blogs/the-lunar-distinction-blogs-entry?
_com_liferay_blogs_web_portlet_BlogsPortlet_redirect=http%3A%2F%2Flocalhost%3A8080%2Fweb%2Fguest%2Fhome%3F
p_p_id&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&_com_liferay_blogs_web_portlet_BlogsPortlet_cur=1&_com_liferay_blogs_web_portlet_BlogsPortlet_delta=20

one of the sim res
http://localhost:8080/web/guest/home/-/blogs/the-lunar-resort-convention-and-diplomacy-center-blogs-entry?
_com_liferay_blogs_web_portlet_BlogsPortlet_redirect=http://localhost:8080/web/guest/home?
p_p_id&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&_com_liferay_blogs_web_portlet_BlogsPortlet_cur=1&_com_liferay_blogs_web_portlet_BlogsPortlet_delta=20
-->
#### Declare the Service Dependencies

The services this code relies on are deployed to an OSGi container. You can use Declarative Services to declare your need for them. Do this at the bottom of your class:
There's at least one important reference you need:

```java
@Reference(unbind = "-")
public void setHttpHelper(HttpHelper httpHelper) {
    _httpHelper = httpHelper;
}
```

The `HttpHelper` service ... 

<!-- Bulk this up with our specific example's references. -->

## Additional Information

NOT ALWAYS MANDATORY

The hardest part of the process is making sense of the main asset's page URL to match

This example applies to asset-enabled entities

You could replace the entire URL in the writeDestination method in order to make the similar results in the list redirect to any other URL.

This example uses a simplified example of URLS. Example URLS from Liferay's SimilarResultsContributor implementations:

- Link to the helper package
AsssetPublisher, Blogs, and WikiDisplay. Most commonly, third party implementations will follow blogs.

If you've implenmented getViewURL in your assetRenderer, 

Here's how Blogs entries URLs are constructed: https://github.com/liferay/liferay-portal/blob/master/modules/apps/blogs/blogs-web/src/main/java/com/liferay/blogs/web/internal/asset/model/BlogsEntryAssetRenderer.java#L201

[Most code examples won't cover every option, method, etc. available to third party developers. Tell them what else they can do with the feature or API, and explain how]

[Are the APIs and other classes discussed here useful in some other cool process? Is there something cool third party devs can do? Let's tell them about it!]
## Conclusion

By implementing a `SimilarResultsContributor`, you can contribute your own custom content for display in the Similar Results widget.

