# Consuming GraphQL APIs

Liferay DXP contains [GraphQL](https://graphql.org) APIs for most of its applications. Here, you'll learn how to consume them. This takes only three steps: 

1. Identify the API you wish to consume. 
1. Identify the site containing the data you need. 
1. Make the API call using credentials that have access to the data. 

This example uses a Docker image with a fresh install of Liferay DXP. 

## Identify the Service to Consume

You need a running Liferay DXP to call its GraphQL APIs. To obtain one using Docker, run this command: 

```bash
docker run -it -p 8080:8080 liferay/portal:7.3.0-ga1
```

After Liferay DXP initializes, you can find the service you need. Liferay DXP's GraphQL APIs are *discoverable* at the GraphQL endpoint: 

```
http://[host]:[port]/o/graphql
```

You can discover your local installation's APIs, therefore, by requesting the schema: 

```bash
curl 'http://localhost:8080/o/graphql'  -H 'Content-Type: application/json' --data '{"query":"query{ __schema{ queryType{ name fields{ name args{ name } description } } } }","variables":{}}'
```

This URL does not require authentication, but calling any API does. The JSON returned describes the APIs available. This example uses the `BlogPosting` API to retrieve blog posts from the Blogs widget, but you can use this procedure with any of the listed APIs. 

    ```tip::
    If you try the ``curl`` command above, you'll see it's quite cumbersome to manage the returned schema. For this reason, it's better to use a GraphQL client, which can display the APIs in a friendly, readable format. You can find a list of clients at the [awesome-graphql](https://github.com/chentsulin/awesome-graphql#tools) GitHub repository. The remainder of the examples below were produced using the [Insomnia](https://insomnia.rest/graphql/) client.
    ```

The `BlogPosting` API looks like this: 

```graphql
createSiteBlogPosting(
  blogPosting: InputBlogPosting
  siteKey: String!
  ): BlogPosting
```

Since the API requires you to know the Site containing the Blog where the entry should be posted, you must find the Site ID first.

## Identify the Site Containing the Data

After Liferay DXP initializes, visit it with your browser at `http://localhost:8080`. 

Now you must find the default Site ID:

1. Sign in using the default credentials: 
   **User Name:** `test@liferay.com`
   **Password:** `test`
1. Go to Control Panel &rarr; Sites &rarr; Sites. 
1. Click the Actions button, and then choose *Go to Site Settings*. 

The Site ID appears at the top of the Details section. It's an Integer, like `20119`.

## Make the Service Call using Credentials with Access to the Data

Now you have everything you need to make the call. All web services must be accessed using credentials that have access to the data you're requesting. The simplest way is to use Basic Auth, which passes credential data in the URL. Since this is insecure, you should only use this method during development. For production, your application should authorize users via [OAuth2](../../installation-and-upgrades/securing-liferay/configuring-sso/introduction-to-using-oauth2.md). 

### Calling a GraphQL API Using Basic Auth (During Development Only)

To call a service using Basic Auth, provide the credentials in the URL: 

```bash
curl --request POST --url http://localhost:8080/o/graphql \ -u test@liferay.com:test  --header 'content-type: application/json' --data '{"query":"query {blogPostings(filter: \"\", page: 1, pageSize: 10, search: \"\", siteKey: \"20119\", sort: \"\"){ page  items{ id articleBody headline  creator{ name }}}}"}'
```

### Calling a Service Using OAuth2

For production, create an [OAuth2 application](../../installation-and-upgrades/securing-liferay/configuring-sso/using-oauth2/creating-oauth2-applications.md) and use the OAuth2 process to get an authorization token. Once you have the token, provide it in the HTTP header:

```bash
curl --request POST --url http://localhost:8080/o/graphql -H "Authorization: Bearer d5571ff781dc555415c478872f0755c773fa159" --header 'content-type: application/json' --data '{"query":"query {blogPostings(filter: \"\", page: 1, pageSize: 10, search: \"\", siteKey: \"20119\", sort: \"\"){ page  items{ id articleBody headline  creator{ name }}}}"}'
```

## Getting and Posting Data

If you run the query above to get all blog postings, you'll see there aren't any: 

```json
{"data":{"blogPostings":{"page":1,"items":[]}}}
```

First, you'll post a blog entry. 

### Posting a Blog Entry

The GraphQL schema revealed the call that must be made to post a blog entry. 

1. Construct a JSON document containing the entry you wish to publish: 

   ```json
    {
      "blog": {
          "articleBody": "This Blog entry was created by calling the GraphQL service!",
          "headline": "GraphQL Blog Entry"
      }
    }
    ```

1. Construct the GraphQL query based on the schema documentation: 

   ```graphql
    mutation CreateBlog($blog: InputBlogPosting){   
      createSiteBlogPosting(blogPosting: $blog, siteKey: "20119" ) {
        headline
        articleBody
        id
        friendlyUrlPath
      }

    }
    ```
1. Make the request: 

   ```bash

   curl --request POST --url http://localhost:8080/o/graphql -u test@liferay.com:test --header 'content-type: application/json' --data '{"query":"mutation CreateBlog($blog: InputBlogPosting){   createSiteBlogPosting(blogPosting: $blog, siteKey: \"20119\" ) {    headline    articleBody    id    friendlyUrlPath  }    } ","variables":{"blog":{"articleBody":"This Blog entry was created by using Curl to call the GraphQL service!","headline":"Curl GraphQL Blog Entry"}},"operationName":"CreateBlog"}'
   ```

Liferay DXP returns a JSON representation of your blog entry that contains the fields you requested in the mutation: 

```json
{
  "data": {
    "createSiteBlogPosting": {
      "headline": "GraphQL Blog Entry",
      "articleBody": "This Blog entry was created by calling the GraphQL service!",
      "id": 35512,
      "friendlyUrlPath": "graphql-blog-entry"
    }
  }
}
```
Note that a GraphQL client makes the job of calling APIs easier, because it can auto-parse the schema to provide code completion. 

![A GraphQL client like Insomnia helps you construct your queries and mutations by parsing the schema and giving you code completion.](./consuming-graphql-apis/images/01.png)

### Getting All Blog Entries

The first call you made called this API: 

```graphql
blogPostings (
   filter:String
   page: Int
   pageSize: Int
   search: String!
   sort: String
): BlogPostingPage
```

Now you can repeat the first query you did to see that the blog entry you posted is there: 

```bash
curl --request POST --url http://localhost:8080/o/graphql \ -u test@liferay.com:test  --header 'content-type: application/json' --data '{"query":"query {blogPostings(filter: \"\", page: 1, pageSize: 10, search: \"\", siteKey: \"20119\", sort: \"\"){ page  items{ id articleBody headline  creator{ name }}}}"}'
```

Now Liferay DXP returns JSON containing the data you requested: 

```json
{
  "data": {
    "blogPostings": {
      "page": 1,
      "items": [
        {
          "id": 35512,
          "articleBody": "This Blog entry was created by calling the GraphQL service!",
          "headline": "GraphQL Blog Entry",
          "creator": {
            "name": "Test Test"
          }
        }
      ]
    }
  }
}
```

### Getting a Single Blog Entry

The API call from the GraphQL schema for getting a single Blog entry has only one parameter: 

```graphql
blogPosting(
   blogPostingId: Long
): BlogPosting
```

Since the query above revealed your Blog post's ID, you can retrieve just the post you want: 

```bash
curl --request POST --url http://localhost:8080/o/graphql -u test@liferay.com:test --header 'content-type: application/json' --data '{"query":"query {blogPosting(blogPostingId: 35512){ id  headline  articleBody}}"}'
```

This returns the same blog entry: 

```json
{
  "data": {
    "blogPosting": {
      "id": 35512,
      "headline": "GraphQL Blog Entry",
      "articleBody": "This Blog entry was created by calling the GraphQL service!"
    }
  }
}
```

### Deleting a Blog Entry

Deleting a blog entry, like creating one, is a mutation. Its call is almost the same as getting a single blog entry: 

```graphql
deleteBlogPosting(
  blogPostingId: Long
): Boolean
```

Using Curl, you can make the call like this: 

```bash
curl --request POST --url http://localhost:8080/o/graphql -u test@liferay.com:test --header 'content-type: application/json' --data '{"query":"mutation {deleteBlogPosting(blogPostingId: 35512)}"}'
```

This call returns a Boolean in a JSON document denoting success or failure: 

```json
{
  "data": {
    "deleteBlogPosting": true
  }
}
```

Congratulations! You've now learned how to call Liferay DXP's GraphQL services. Remember that the examples above use Basic Auth: for production, use OAuth2 to call services in a secure way.
