# Low-Code Application Development with App Builder

Writing applications for Liferay DXP has never been easier. Introduced with Liferay DXP 7.3, App Builder provides a low-code application development solution. There are four concepts at the root of App Builder apps:

- [Custom Objects](#custom-objects)

- [Form Views](#form-views)

- [Table Views](#table-views)

- [Deployment](#deployment)

These concepts are explained below. To skip straight to building an application, see the next article on [Creating Applications with App Builder](./creating-applications-with-app-builder.md).

## Custom Objects

Custom objects are the foundation of your App Builder applications. The custom object is like the model in a [Service Builder application](placeholder). The custom object defines what data fields can be contained in the application. For example, a Guestbook object would contain a _Name_ field and a _Message_ field, at least. To create applications based on a custom object, you have three tasks: create at least one form view, create at least one table view, and deploy the application.

The data for a custom object is defined at the same time as creating its form views.

> In future versions of the App Builder, out-of-the-box objects with default fieldsets will be bundled with Liferay DXP to jump-start your app development. 

## Form Views

A Form View defines what fields of the custom object are to be filled out by the app's users. The Liferay Forms application's form builder tool is leveraged in this pursuit. A custom object can have multiple form views, but each application based on the custom object will only have one form view.

Adding fields to a form view automatically adds them to the custom object. Fields that are part of the custom object via another form view can be re-used by dragging the field from a dedicated section for the form builder that holds the custom objects existing fields.

## Table Views

Table views display the custom object's collected data. Display all of the form view's fields, or a subset. Every app has one table view, though the custom object can have as many as needed. A drag-and-drop interface lets you create table views from the existing fields of the custom object.

## App Management

Once a custom object is defined and at least one form and table view are created, you can deploy an application. You have several deployment options:

**Widget**
: Deploy the app to the widget menu, and add it to a page using the Add Widgets menu, from Add &rarr; Widgets &rarr; App Builder. When you deploy the app as a widget, you really deploy three versions of the app:

1.  displays the table view by default but includes the Add button to access the form view
1.  only shows the table view
1.  only shows the form view

**Standalone**
: Deploy the app to a dedicated page that's not part of a site and not visible to any navigation menu. This limits access to only people with the link.

**Product Menu**
: Deploy the app to the Control Panel, the Site Menu, or both. This gives you flexibility in deciding where your app's administrative Users will access the app.
Widgets can show both views (form and table), or only one view (form OR table)--done via the widget menu
A standalone app or admin app always shows both form and table view (defaults to table view with an add button to access the form)

## When Shouldn't I use App Builder?

SHOULD WE ADVISE WHEN WE WOULD RECOMMEND WRITING A FULL-FLEDGED SERVICE BUILDER APPLICATION?
