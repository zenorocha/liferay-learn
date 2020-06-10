# Consuming REST Services

Liferay DXP contains REST services for most of its applications. These services are fully [OpenAPI](https://app.swaggerhub.com/apis/liferayinc/headless-delivery) compliant. Here, you'll learn how to consume them. This takes only three steps:

1. Identify the service you wish to consume.
1. Identify the site containing the data you need.
1. Make the service call using credentials that have access to the data.

This example uses Docker image with a fresh install of Liferay DXP.

## Identify the Service to Consume

You need a running Liferay DXP to call its REST services. To obtain one using Docker, run this command:

```bash
docker run -it -p 8080:8080 liferay/portal:7.3.2-ga3
```

Liferay DXP's REST services are published at this URL:

```
http[s]://[hostname]:[port]/o/api
```

On your Docker instance, you can find them here:

```
http://localhost:8080/o/api
```

APIs are divided into several categories. This example uses the `BlogPosting` service to retrieve blog posts from the Blogs widget, but you can use this procedure with any of the published services. 

1. Select the *Headless Delivery* category. This category contains the `BlogPosting` service. You can use the filter to search for services. 

1. Click the *Show Schemas* button, and on the right side of the screen a list of all the schemas in this category appears. 

1. Keep a browser tab open to the schema browser; when you want to PUT a `BlogPosting`, you'll need its schema. 

![The schema browser makes it convenient to find and call the service you want. ](./consuming-rest-services/images/01.png)

## Identify the Site Containing the Data

After Liferay DXP initializes, visit it with your browser at `http://localhost:8080`.

Now you must find the default Site ID:

1. Sign in using the default credentials:
   **User Name:** `test@liferay.com`
   **Password:** `test`
1. Go to Control Panel &rarr; Sites &rarr; Sites.
1. Click the Actions button, and then choose *Go to Site Settings*.

The Site ID appears at the top of the Details section. It's an Integer, like `20122`.

## Make the Service Call Using Credentials with Access to the Data

Now you have everything you need to make the call. All web services must be accessed using credentials that have access to the data you're requesting. The simplest way is to use Basic Auth, which passes credential data in the URL. Since this is insecure, you should only use this method during development. For production, your application should authorize users via [OAuth2](../../installation-and-upgrades/securing-liferay/configuring-sso/using-oauth2/introduction-to-using-oauth2.md).

The examples below use [curl](https://curl.haxx.se).

### Calling a Service Using Basic Auth (During Development Only)

To call a service using Basic Auth, provide the credentials in the URL:

```bash
curl "http://localhost:8080/o/headless-delivery/v1.0/sites/20122/blog-postings/" -u 'test@liferay.com:test'
```

### Calling a Service Using OAuth2

For production, create an [OAuth2 application](../../installation-and-upgrades/securing-liferay/configuring-sso/using-oauth2/creating-oauth2-applications.md) and use the OAuth2 process to get an authorization token. Once you have the token, provide it in the HTTP header:

```bash
curl -H "Authorization: Bearer d5571ff781dc555415c478872f0755c773fa159" http://localhost:8080/o/headless-delivery/v1.0/sites/20122/blog-postings
```

## Getting and Posting Data

If you run the query above to get all blog postings, you'll see there aren't any:

```json
{
  "actions" : {
    "subscribe" : {
      "method" : "PUT",
      "href" : "http://localhost:8080/o/headless-delivery/v1.0/sites/{siteId}/blog-postings/subscribe"
    },
    "unsubscribe" : {
      "method" : "PUT",
      "href" : "http://localhost:8080/o/headless-delivery/v1.0/sites/{siteId}/blog-postings/unsubscribe"
    },
    "create" : {
      "method" : "POST",
      "href" : "http://localhost:8080/o/headless-delivery/v1.0/sites/{siteId}/blog-postings"
    }
  },
  "items" : [ ],
  "lastPage" : 1,
  "page" : 1,
  "pageSize" : 20,
  "totalCount" : 0
}
```

First, you'll post a blog entry.

### Posting a Blog Entry

You can use the schema browser to learn how to post a blog entry. 

![The schema for any service is published on your Liferay DXP instance.](./consuming-rest-services/images/blog-posting-schema.png)

1. Go back to your browser tab containing the schema browser. On the right side, click the `BlogPosting` entry to display its schema (see above). This shows the whole data structure for a `BlogPosting`, but there are only two required fields:

    * `articleBody`
    * `headline`

2. Construct a simple JSON document to post a blog entry:

    ```json
    {
        "headline": "Test Blog Entry from REST Services",
        "articleBody": "This article was posted via REST services provided by Liferay DXP."
    }
    ```

3. Make the request:

    ```bash
    curl --header "Content-Type: application/json" --request POST --data '{ "headline": "Test Blog Entry from REST Services", "articleBody": "This article was posted via REST services provided by Liferay DXP." }' http://localhost:8080/o/headless-delivery/v1.0/sites/20122/blog-postings -u test@liferay.com:test
    ```

Liferay DXP returns the full JSON representation of your blog entry:

```json
{
  "actions" : {
    "get" : {
      "method" : "GET",
      "href" : "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/{blogPostingId}"
    },
    "replace" : {
      "method" : "PUT",
      "href" : "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/{blogPostingId}"
    },
    "update" : {
      "method" : "PATCH",
      "href" : "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/{blogPostingId}"
    },
    "delete" : {
      "method" : "DELETE",
      "href" : "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/{blogPostingId}"
    }
  },
  "alternativeHeadline" : "",
  "articleBody" : "This article was posted via REST services provided by Liferay DXP.",
  "creator" : {
    "additionalName" : "",
    "contentType" : "UserAccount",
    "familyName" : "Test",
    "givenName" : "Test",
    "id" : 20125,
    "name" : "Test Test",
    "profileURL" : "/web/test"
  },
  "customFields" : [ ],
  "dateCreated" : "2020-03-06T18:02:26Z",
  "dateModified" : "2020-03-06T18:02:27Z",
  "datePublished" : "2020-03-06T18:02:00Z",
  "description" : "",
  "encodingFormat" : "text/html",
  "friendlyUrlPath" : "test-blog-entry-from-rest-services",
  "headline" : "Test Blog Entry from REST Services",
  "id" : 35215,
  "keywords" : [ ],
  "numberOfComments" : 0,
  "relatedContents" : [ ],
  "siteId" : 20122,
  "taxonomyCategories" : [ ]
}
```

### Getting All Blog Entries

Now you can repeat the first query you did to see that the blog entry you posted is there:

```bash
curl "http://localhost:8080/o/headless-delivery/v1.0/sites/20122/blog-postings/" -u 'test@liferay.com:test'
```

This returns a list of blog entries. The entry you added is the only one in the list:

```json
{
  "actions" : {
    "subscribe" : {
      "method" : "PUT",
      "href" : "http://localhost:8080/o/headless-delivery/v1.0/sites/{siteId}/blog-postings/subscribe"
    },
    "unsubscribe" : {
      "method" : "PUT",
      "href" : "http://localhost:8080/o/headless-delivery/v1.0/sites/{siteId}/blog-postings/unsubscribe"
    },
    "create" : {
      "method" : "POST",
      "href" : "http://localhost:8080/o/headless-delivery/v1.0/sites/{siteId}/blog-postings"
    }
  },
  "items" : [ {
    "actions" : {
      "get" : {
        "method" : "GET",
        "href" : "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/{blogPostingId}"
      },
      "replace" : {
        "method" : "PUT",
        "href" : "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/{blogPostingId}"
      },
      "update" : {
        "method" : "PATCH",
        "href" : "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/{blogPostingId}"
      },
      "delete" : {
        "method" : "DELETE",
        "href" : "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/{blogPostingId}"
      }
    },
    "alternativeHeadline" : "",
    "articleBody" : "This article was posted via REST services provided by Liferay DXP.",
    "creator" : {
      "additionalName" : "",
      "contentType" : "UserAccount",
      "familyName" : "Test",
      "givenName" : "Test",
      "id" : 20125,
      "name" : "Test Test",
      "profileURL" : "/web/test"
    },
    "customFields" : [ ],
    "dateCreated" : "2020-03-06T18:02:26Z",
    "dateModified" : "2020-03-06T18:02:27Z",
    "datePublished" : "2020-03-06T18:02:00Z",
    "description" : "",
    "encodingFormat" : "text/html",
    "friendlyUrlPath" : "test-blog-entry-from-rest-services",
    "headline" : "Test Blog Entry from REST Services",
    "id" : 35215,
    "keywords" : [ ],
    "numberOfComments" : 0,
    "relatedContents" : [ ],
    "siteId" : 20122,
    "taxonomyCategories" : [ ]
  } ],
  "lastPage" : 1,
  "page" : 1,
  "pageSize" : 20,
  "totalCount" : 1
}
```

### Getting a Single Blog Entry

Each time you've made a request, Liferay DXP has returned other possible endpoints. One of these is to get a single blog entry by its ID. If you know your entry's ID, you can retrieve it:

```bash
curl "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/35215" -u test@liferay.com:test
```

This returns the same blog entry.

### Deleting a Blog Entry

If you know its ID, you can also delete your blog entry:

```bash
curl -X DELETE "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/35215" -u test@liferay.com:test
```

In this case, nothing is returned, but you can verify your entry is gone by requesting it as you did above:

```bash
curl "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/35215" -u test@liferay.com:test
```

Liferay DXP then returns this JSON document in response:

```json
{
  "status" : "NOT_FOUND",
  "title" : "No BlogsEntry exists with the primary key 35215"
}
```
Congratulations! You've now learned how to call Liferay DXP's REST services. Remember that the examples above use Basic Auth: for production, use OAuth2 to call services in a secure way.
