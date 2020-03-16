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

```
curl 'http://localhost:8080/o/graphql'  -H 'Content-Type: application/json' --data '{"query":"query{ __schema{ queryType{ name fields{ name args{ name } description } } } }","variables":{}}'
```

This URL does not require authentication, but calling any API does. The JSON returned describes the APIs available. This example uses the `BlogPosting` API to retrieve blog posts from the Blogs widget, but you can use this procedure with any of the listed APIs. 

    ```tip::
    If you try the ``curl`` command above, you'll see it's quite cumbersome to manage the returned schema. For this reason, it's better to use a GraphQL client, which can display the APIs in a friendly, readable format. You can find a list of clients at the [awesome-graphql](https://github.com/chentsulin/awesome-graphql#tools) GitHub repository. The remainder of the examples below were produced using the [Insomnia](https://insomnia.rest/graphql/) client.
    ```

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

The examples below use [curl](https://curl.haxx.se). You, of course, would use your web development framework of choice to make the call. 

