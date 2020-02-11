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

1. Start Liferay DXP. If you don't already have a docker container, use

    ```bash
    docker run -it -p 8080:8080 liferay/portal:7.3.0-ga1
    ```

    If you already have a docker container, use

    ```bash 
    docker start [container_name] 
    ```

    If you're running a different Liferay Portal CE version or Liferay DXP, adjust the above command accordingly.

1. Download and unzip [the KB Article Similar Results Contributor](./ZIPNAME.zip).

    ```bash
    curl https://learn.liferay.com/dxp-7.x/[???]/ZIPNAME.zip -O
    ```

    ```bash
    unzip ZIPNAME.zip
    ```

1. From the module root, build and deploy.

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    >**Note:** This command is the same as copying the deployed jars to /opt/liferay/osgi/modules on the Docker container.

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

1.  Click on one of the KB Articles to select it for display, as the main asset.

    The Similar Results widget now shows other related KB Articles.

![Similar Results widget can display KB Articles.](./adding-a-new-product-type/images/01.png "KB Similar Results")

Now that you verified that the example behaves properly, enter the deep end to learn more.

## Walk Through the Example

Let's review the deployed example. It contains just one class: the contributor that enables custom content for the Similar Results widget.

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

Implement `writeDestination` to update the main asset when a User clicks a link in the similar results widget and re-run the backing More Like This Query that's used to populate the Similar Results widget. 

### Complete the Similar Results Contributor

#### Implement the `detectRoute` Method

```java
@Override
public void detectRoute(RouteBuilder routeBuilder, RouteHelper routeHelper) {

    String[] subpath = StringUtil.split(HttpUtil.getPath(routeHelper.getURLString()),
            Portal.FRIENDLY_URL_SEPARATOR);

    String[] parameters = StringUtil.split(subpath[subpath.length - 1], CharPool.FORWARD_SLASH);

    if (parameters[0].matches("knowledge_base")) {

        routeBuilder.addAttribute("urlTitle", parameters[1]);
    }
}
```

    // get the friendly url parameter that matches the urlString
    //uses the friendly url separator constant, which is /-/, to extract the last 1/2 of the URL:
    //   "/-/knowledge_base/test-kb-article-two"
    // i don't know if this check of the array value is appropriate
    // if the first fruendlyUrl parameter is for the knowledge base, add the second param 
    // as the attribute that similar results will use to grab our contributor

Implement `detectRoute` to inject logic checking for a distinctive portion of your entity's URL pattern. The Similar results widget uses this check to find the correct Contributor. If your entity's display URL is detected, you must add at least one attribute to the URL route for use later. Here we're checking for `"knowledge_base"` in the Friendly URL, and adding `"urlTitle"` as an attribute to the `RouteBuilder` passed in the method signature if it's detected.

`routehlper.getUrlString` is important. Check if the portlet ID parameter starts with "wikiDisplayPortlet". If yes, this contributor is resolved. After the detecting that you are in the right page, extract the `entityID` form the URL. When you have the ID, add at least one attribute to the route in order to use later.

The ID added as an attribute to the `RouteBuilder` is used to fetch the entity and the corresponding search engine document in the `resolveCriteria` method.

#### Implement the `resolveCriteria` Method

```java
@Override
public void resolveCriteria(CriteriaBuilder criteriaBuilder, CriteriaHelper criteriaHelper) {

    long groupId = criteriaHelper.getGroupId();

    String urlTitle = (String) criteriaHelper.getRouteParameter("urlTitle");

    /*
     * need help here. how would i retrieve the folder? is there a service
     * call to fetch it using the url title of the article maybe?
     */ long kbFolderId = 0;
    KBArticle kbArticle = _kbArticleLocalService.fetchKBArticleByUrlTitle(groupId, kbFolderId, urlTitle);

    if (kbArticle == null) {
        return;
    }

    AssetEntry assetEntry = _assetEntryLocalService.fetchEntry(groupId, kbArticle.getUuid());

    if (assetEntry == null) {
        return;
    }

    criteriaBuilder.uid(Field.getUID(assetEntry.getClassName(), String.valueOf(kbArticle.getClassPK())));
}
```

Match the page's displayed entity to the corresponding search engine document. You must provide the `criteriaBuilder.uid` method the value of the appropriate search engine document's `uid` field. In the Liferay DXP index, this is done using a combination of the entry class name and the class primary key. Pass both as Strings to `Field.getUID`. This example starts by fetching the model entity using the ID you added to the attribute in the `detectRoute` method, and then uses it to retrieve the asset entry. 


<!-- for blogs this sets something like this as the uid: com.liferay.blogs.model.BlogsEntry_PORTLET_38805 might need to doc this uid thing a bit. it wasn't clear which field from the model entity was going to be used to match the uid. i tried getPrimaryKey(), getKBArticleId(), and finally found that getEntryClassPK was the golden ticket for kb articles. -->

Now that you told the criteria what document to match, write the destination URL so the similar results are updated.

#### Implement the `writeDestination` Method

```java
@Override
public void writeDestination(DestinationBuilder destinationBuilder, DestinationHelper destinationHelper) {

    String urlTitle = (String)destinationHelper.getRouteParameter(
        "urlTitle");

    AssetRenderer<?> assetRenderer = destinationHelper.getAssetRenderer();

    destinationBuilder.replace(urlTitle, assetRenderer.getUrlTitle());
}
```

Implement `writeDestination` to update the main asset when a user clicks a link in the Similar Results widget. The More Like This query is re-sent to thes earch engine, and the Similar Results list is re-rendered to match the new main asset. The entirety of the work here is to replace the ID in the original URL for each similar result (to render the clickable links)

In addition to re-sending the qeury re-populating the Similar Results list, replace the `urlTitle` in each result with the appropriate ID for each entry.
<!-- My code, copied from blogs example, has a bug and doesn't do this currently. It keeps the url of the current main asset for some reason -->

#### Declare the Service Dependencies

This code relies on two services deployed to an OSGi container: `AssetEntryLocalService` and `KBArticleLocalService`. Declare your need for them using the Declarative Services `@Reference` annotation, provided by `org.osgi.service.component.annotations.Reference`. Set them into private fields.

```java
@Reference
private AssetEntryLocalService _assetEntryLocalService;

@Reference
private KBArticleLocalService _kbArticleLocalService;
```

## Additional Information

<!-- I'm not exactly sure what to say here. We may not need this section this time.These are my notes from ur dicsussion at SearchCon-->

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

