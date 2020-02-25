# Contributing Custom Content to the Similar Results Widget

> Available: This functionality relies on a Service Provider Interface (SPI) that's bundled with Liferay DXP 7.3+. It's available in Liferay DXP 7.2, from Fix Pack 5+, via installation of the Similar Results widget from [Liferay Marketplace](https://web.liferay.com/marketplace/-/mp/application/MP_ID_FOR_SIMILAR_RESULTS_APP).

You can display your application's custom content in the [Similar Results widget](https://help.liferay.com/hc/en-us/sections/360004673411-Search) by implementing a `SimilarResultsContributor`. Note that for the contributor to work, the Similar Results widget must be able to detect your content as the main asset on a page. That means it must be displayable via a URL in a "Display Widget", like the supported Liferay DXP assets (e.g., blogs entries and wiki pages). Keep in mind that the Similar Results widget can already be used with any content displayed in Lifery DXP's Asset Publisher, without the need for a custom contributor.

![The Blogs display widget works with Similar Results because of its contributor.](./writing-a-similar-results-contributor/images/01.png "Blogs Similar Results")

Since the Knowledge Base application does not implement a `SimilarResultsContributor` for KB Articles out of the box, this example implements one.

## Overview

1. [**Deploy an Example**](#deploy-an-example)
1. [**Walk Through the Example**](#walk-through-the-example)
1. [**Additional Information**](#additional-information)

## Deploy an Example

To get an example `SimilarResultsContributor` up and running on your instance of Liferay DXP,

1. Start Liferay DXP. If you don't already have a docker container, use

    ```bash
    docker run -it -p 8080:8080 liferay/dxp:7.2.10-sp2
    ```

    If you're running a different Liferay Portal CE version or Liferay DXP, adjust the above command accordingly.
<!--7.2.10-sp2 is my guess at the DXP container ID for a docker image with support for similar results-->

    If you already have a docker container, use

    ```bash 
    docker start [container_name] 
    ```


1. Download and unzip [the KB Article Similar Results Contributor example](./liferay-r1s1.zip).

    ```bash
    curl https://learn.liferay.com/dxp-7.x/using-search/02-developer-guide/liferay-r1s1.zip -O
    ```

    ```bash
    unzip liferay-r1s1.zip
    ```

1. From the module root, build and deploy.

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    > **Note:** This command is the same as copying the deployed jars to /opt/liferay/osgi/modules on the Docker container.

1. Confirm the deployment in the Liferay Docker container console.

    ```bash
    STARTED com.liferay.learn.r1s1.impl_1.0.0 [1009]
    ```

1. Verify that the example contributor is working. Begin by opening your browser to `https://localhost:8080`

1.  Add some KB Articles at  _Site Menu_ &rarr; _Content_ &rarr; _Knowledge Base_.

    Make sure they have similar _Title_ and _Content_ fields. You can use these Strings to create three articles (use the same string for title and content):

    _Test KB Article one_

    _Test KB Article two_

    _Test KB Article three_

1.  Add the Knowledge Base Display widget to a page, followed by the Similar Results widget.

1.  Open the widget configuration of the Similar Results widget, and make sure to set a value of _1_ for these settings:

    Minimum Term Frequency: 1 
    Minimum Document Frequency: 1

1.  Click on one of the KB Articles to select it for display, as the main asset.

    The Similar Results widget now shows other related KB Articles.

![The Similar Results widget can display KB Articles.](./adding-a-new-product-type/images/01.png "KB Similar Results")

Now that you verified that the example behaves properly, learn how it works.

## Walk Through the Example

Review the deployed example. It contains just one class: the contributor that enables custom content for the Similar Results widget.

* [Annotate the Contributor Class for OSGi Registration](#annotate-the-contributor-class-for-osgi-registration)
* [Review the `SimilarResultsContributor` Interface](#review-the-cptype-interface)

### Annotate the Contributor Class for OSGi Registration

The `KBSimilarResultsContributor` implements the `SimilarResultsContributor` interface:

```java
@Component(service = SimilarResultsContributor.class)
public class KBSimilarResultsContributor implements SimilarResultsContributor {
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

Implement `writeDestination` to
- update the main asset when a User clicks a link in the similar results widget
- re-run the backing More Like This Query that's used to populate the Similar Results widget. 

### Complete the Similar Results Contributor

#### Implement the `detectRoute` Method

```java
@Override
public void detectRoute(RouteBuilder routeBuilder, RouteHelper routeHelper) {

    String[] subpath = StringUtil.split(_http.getPath(routeHelper.getURLString()), Portal.FRIENDLY_URL_SEPARATOR);

    String[] parameters = StringUtil.split(subpath[subpath.length - 1], CharPool.FORWARD_SLASH);

    if (!parameters[0].matches("knowledge_base")) {
        throw new RuntimeException("KBArticle was not detected");
    }

    routeBuilder.addAttribute("urlTitle", parameters[1]);
}
```

Implement `detectRoute` to inject logic checking for a distinctive portion of your entity's URL pattern. The Similar results widget uses this check to find the correct `SimilarResultsContributor`. If your entity's display URL is detected, add at least one attribute to the URL route for use later. Here we're checking for `"knowledge_base"` in the Friendly URL, and adding `"urlTitle"` as an attribute to the `RouteBuilder` passed in the method signature if it's detected.

The `routeHelper.getUrlString` call is important, as it can be used to retrieve the relative URL of the detected asset within the virtual instance. For example,

```sh
/web/guest/page-title/-/knowledge_base/kb-article-url-title
```

The ID being added as an attribute to the `RouteBuilder` is used to fetch the entity and the corresponding search engine document in the `resolveCriteria` method.

#### Implement the `resolveCriteria` Method

```java
@Override
public void resolveCriteria(CriteriaBuilder criteriaBuilder, CriteriaHelper criteriaHelper) {

    long groupId = criteriaHelper.getGroupId();

    String urlFolderTitle = (String) criteriaHelper.getRouteParameter("urlFolderTitle");
    String urlTitle = (String) criteriaHelper.getRouteParameter("urlTitle");

    KBArticle kbArticle = _kbArticleLocalService.fetchKBArticleByUrlTitle(groupId,
            KBFolderConstants.DEFAULT_PARENT_FOLDER_ID, urlTitle);

    if (kbArticle == null) {
        return;
    }

    AssetEntry assetEntry = _assetEntryLocalService.fetchEntry(groupId, kbArticle.getUuid());

    if (assetEntry == null) {
        return;
    }

    String uidField = String.valueOf(kbArticle.getPrimaryKeyObj());

    int buildNumber = ReleaseInfo.getBuildNumber();

    if (ReleaseInfo.getBuildNumber() == ReleaseInfo.RELEASE_7_2_10_BUILD_NUMBER) {

        uidField = String.valueOf(kbArticle.getResourcePrimKey());
    }

    criteriaBuilder.uid(Field.getUID(assetEntry.getClassName(), uidField));
}
```

Match the page's displayed entity to the corresponding search engine document. You must provide the `criteriaBuilder.uid` method the value of the appropriate search engine document's `uid` field. In the Liferay DXP index, this is done using a combination of the entry class name and the class primary key. Pass both as Strings to `Field.getUID`. This example starts by fetching the model entity using the ID you added to the attribute in the `detectRoute` method (the `urlTitle`), and then uses it to retrieve the asset entry. 

> There's a difference between Liferay DXP 7.2 and Liferay DXP 7.3, so a condition to check the version, with logic for each, is provided here. In Liferay DXP 7.3, `getPrimaryKeyObj` is used in conjunction with the class name, whereas in Liferay DXP 7.2, `getResourcePrimKey` is needed.

Now that matching documents can be found, write the destination URL so the similar results are updated.

#### Implement the `writeDestination` Method

```java
@Override
public void writeDestination(DestinationBuilder destinationBuilder, DestinationHelper destinationHelper) {

    String urlTitle = (String) destinationHelper.getRouteParameter("urlTitle");

    AssetRenderer<?> assetRenderer = destinationHelper.getAssetRenderer();

    KBArticle kbArticle = (KBArticle) assetRenderer.getAssetObject();
    destinationBuilder.replace(urlTitle, kbArticle.getUrlTitle());

}
```

Implement `writeDestination` to update the main asset when a user clicks a link in the Similar Results widget. The More Like This query is re-sent to the search engine, and the Similar Results list is re-rendered to match the new main asset. For KB Articles, the entirety of the work is to replace the `urlTitle` in the original URL (for the main asset) with the `urlTitle` of the matched entity.

The `destinationHelper.getRouteParameter` call is important, because it's the only method from the `DestinationHelper` is a pre-search operator. It will always return data from the currently selected main asset, prior to re-rendering the main asset or the Similar Results links. The remainder of the `DestinationHelper` methods, including the other one shown here, `getAssetRenderer`, return data for a matched asset. This method is run iteratively for each matched result.

#### Declare the Service Dependencies

This code relies on services deployed to an OSGi container: `AssetEntryLocalService`, `KBArticleLocalService`, and `Http`. Declare your need for them using the Declarative Services `@Reference` annotation, provided by `org.osgi.service.component.annotations.Reference`. Set them into private fields.

```java
@Reference
private AssetEntryLocalService _assetEntryLocalService;

@Reference
private Http _http;

@Reference
private KBArticleLocalService _kbArticleLocalService;
```

## Additional Information

Since each implementation of an entity's URLs is likely to differ significantly, see the `SimilarResultsContributor` [interface](https://github.com/liferay/liferay-portal/blob/7.3.0-ga1/modules/dxp/apps/portal-search-similar-results/portal-search-similar-results-web-spi/src/main/java/com/liferay/portal/search/similar/results/web/spi/contributor/SimilarResultsContributor.java) and the bundled [implementations](https://github.com/liferay/liferay-portal/tree/7.3.0-ga1/modules/dxp/apps/portal-search-similar-results/portal-search-similar-results-web/src/main/java/com/liferay/portal/search/similar/results/web/internal/contributor) on GitHub if you need more inspiration when writing your own application's contributor.

Much of the work involved in contributing your application's custom content to the Similar Results widget is in working with the display URL. To learn how Liferay's own assets create their display URLs, inspect the `getURLView` method of an entity's `*AssetRenderer` class.


<!-- 
Constructing the UID:

So in 7.3 it's constructed using `classedModel.getPrimaryKeyObj()` by `com.liferay.portal.search.internal.model.uid.UIDFactoryImpl._getUID(ClassedModel)`.

In 7.2 and 7.1 in case of entities using the composite Indexer APIs, it's determined in com.liferay.portal.search.internal.indexer.BaseModelDocumentFactoryImpl.createDocument(BaseModel<?>) as

		if (baseModel instanceof ResourcedModel) {
			ResourcedModel resourcedModel = (ResourcedModel)baseModel;

			classPK = resourcedModel.getResourcePrimKey();
			resourcePrimKey = resourcedModel.getResourcePrimKey();
		}
		else {
			classPK = (Long)baseModel.getPrimaryKeyObj();
		}

In 7.2 and prior version for entities using the legacy Indexer API, the same logic is in com.liferay.portal.kernel.search.BaseIndexer.getBaseModelDocument(String, BaseModel<?>, BaseModel<?>).

Though some entities may set a different UID, like for example JournalArticleIndexer which does this:

		if (!isIndexAllArticleVersions()) {
			classPK = journalArticle.getResourcePrimKey();
		}

		document.addUID(CLASS_NAME, classPK);

So in case of OOTB Liferay entities it's worth to check their underlying Indexer / ModelDocumentContributor class to see if they set it differently.

I think it applies to custom entities too.
If you have a URL with plain parameters, use blah if you have friendly url separateors, do it this way

sidebar for folders: kbFolders could be an interesting exercise, would want to look at the src for doc library contributor to see how folders work

You can see, debugging the writeDestination method for blogs, that the method is called multiple times as the similar results widget replaces the links for each asset in the list.


getRouteParameter is the only pre-search call from DestinationHelper, and operates on the current URL path. it always returns the main asset's urlTitle, for blogs and kb articles
-->
## Conclusion

By implementing a `SimilarResultsContributor`, you can contribute your own custom content for display in the Similar Results widget.

