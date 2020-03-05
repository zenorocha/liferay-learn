# Consuming REST Services

Liferay DXP contains REST services for most of its applications. These services are fully [OpenAPI](https://app.swaggerhub.com/apis/liferayinc/headless-delivery) compliant. Here, you'll learn how to consume them. This takes only three steps:

1. Identify the service you wish to consume.
1. Identify the site containing the data you need.
1. Make the service call using credentials that have access to the data.

This example uses Docker image with a fresh install of Liferay DXP.

## Identify the Service to Consume

Liferay DXP's REST services are published on [Swagger Hub](https://app.swaggerhub.com/apis/liferayinc/headless-delivery). This example uses the `BlogPosting` service to retrieve blog posts from the Blogs widget, but you can use this procedure with any of the services listed on Swagger Hub. The documentation there shows all the parameters necessary for performing the call and includes example JSON or XML that the service returns.

## Identify the Site Containing the Data

You need a running Liferay DXP to call its REST services. To obtain one using Docker, run this command:

```bash
docker run -it -p 8080:8080 liferay/portal:7.3.0-ga1
```

After Liferay DXP initializes, visit it with your browser at `http://localhost:8080`.

You must first create a blog entry so it can be retrieved:

1. Sign in using the default credentials:
   **User Name:** `test@liferay.com`
   **Password:** `test`
1. Click *Content & Data* &rarr; *Blogs*.
1. Click the blue Plus button (![Add](../../images/icon-add.png)) to add a blog entry.
1. When finished typing your blog entry, click *Publish*.

Now that you have a blog entry, you need only find the Site ID:

1. Go to Control Panel &rarr; Sites &rarr; Sites.
1. Click the Actions button, and then choose *Go to Site Settings*.

The Site ID appears at the top of the Details section. It's an Integer, like `20119`.

## Make the Service Call Using Credentials with Access to the Data

Now you have everything you need to make the call. All web services must be accessed using credentials that have access to the data you're requesting. The simplest way is to use Basic Auth, which passes credential data in the URL. Since this is insecure, you should only use this method during development. For production, your application should authorize users via [OAuth2](../../installation-and-upgrades/securing-liferay/configuring-sso/using-oauth2/introduction-to-using-oauth2.md).

The examples below use [curl](https://curl.haxx.se).

### Calling a Service Using Basic Auth (During Development Only)

To call a service using Basic Auth, provide the credentials in the URL:

```bash
curl "http://localhost:8080/o/headless-delivery/v1.0/sites/20119/blog-postings/" -u 'test@liferay.com:test'
```

The service returns a JSON representation of the data (see below).

### Calling a Service Using OAuth2

For production, create an [OAuth2 application](../../installation-and-upgrades/securing-liferay/configuring-sso/using-oauth2/creating-oauth2-applications.md) and use the OAuth2 process to get an authorization token. Once you have the token, provide it in the HTTP header:

```bash
curl -H "Authorization: Bearer d5571ff781dc555415c478872f0755c773fa159" http://localhost:8080/o/headless-delivery/v1.0/sites/20119/blog-postings
```

The service returns a JSON representation of the data (see below).

## Data Returned by Services

If you added a blog entry through the UI, you'll see that entry now, represented in JSON:

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
    "alternativeHeadline" : "This is a Blog entry added via the UI",
    "articleBody" : "<p>I'm typing this entry into Liferay's UI so that I can retrieve it via REST services. The editor is&nbsp;<em>AlloyEditor</em>, an editor written specifically for Liferay's various kinds of content.&nbsp;</p>",
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
    "dateCreated" : "2020-02-10T23:03:20Z",
    "dateModified" : "2020-02-10T23:03:55Z",
    "datePublished" : "2020-02-10T23:02:00Z",
    "description" : "",
    "encodingFormat" : "text/html",
    "friendlyUrlPath" : "test-blog-entry-from-ui",
    "headline" : "Test Blog Entry from UI",
    "id" : 35216,
    "keywords" : [ ],
    "numberOfComments" : 0,
    "relatedContents" : [ ],
    "siteId" : 20119,
    "taxonomyCategories" : [ ]
  } ],
  "lastPage" : 1,
  "page" : 1,
  "pageSize" : 20,
  "totalCount" : 1
}
```

Congratulations! You've successfully retrieved data from Liferay's headless delivery services!
