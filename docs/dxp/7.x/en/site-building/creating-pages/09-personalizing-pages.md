# Personalizing Sections of Widget Pages

Administrators can designate some or all of the sections (rows and columns of the page layout) of a Widget Page as customizable for site members. Page customizations are only visible to the user who made the customizations. The steps below cover these topics:

* [Making page sections customizable](#enabling-page-customizations)
* [Modifying customizable page sections](#customizing-pages)
* [Assigning non-site members permission to customize pages](#granting-roles-permission-to-customize-pages)

## Enabling Page Customizations

To enable page customizations, follow these steps:

1. Open the Product Menu and go to *Site Builder* &rarr; *Pages* under your site's menu.

1. Open the Actions menu next to the page you want to let Site members modify and select *Configure*.

1. Select the *Advanced* tab at the top of the page and expand the *Customization Settings* panel.

1. Toggle the *Customizable* option to Yes.

  ![To enable page customizations, click on the Configure Page button next to the page, expand the Customization Settings area, and click on the Customizable button.](./personalizing-pages/images/01.png)

1. Toggle the *Not Customizable* option to *Customizable* for each section you want to make customizable.

## Customizing Pages

With customization activated for a page, site members can add apps to the customizable sections of the page from the Add menu in the top right. Site members can make two kinds of customizations to customizable regions:

* Add or remove apps
* Configure applications

```note::
  Site members can't change a non-instanceable app's configuration inside a customizable region since those apps are tied to the site they've been added to.
```

Site members have access to these contextual options from the page's *Options* menu (![Options](../../../../images/icon-options.png)) in the Control Menu:

* *View Page without my customizations*: Displays the default page and hides the Add menu.

* *Reset My Customizations*: Restores the customized page back to the default page, discarding any customizations.

* *View My Customized Page*: Displays the page with the user's customizations and makes the Add menu available so users can add widgets to the page.

![Customizable areas are highlighted green when organizing apps on the page.](./personalizing-pages/images/02.png)

Administrators of customizable pages have the same two views as Site members: the *default page* view and the *customized page* view. Changes they make to the non-customizable sections of the default page affect all users just like other pages, whereas changes they make to the customized sections affect only themselves and do *not* overwrite users' customizations.

## Granting Roles Permission to Customize Pages

By default, site members can make page customizations but non-site members and guests can't. Administrators can update permissions for an existing Role or [create a new Role](TODO) and assign it to other users to give them the ability to customize pages. Follow these steps to grant a Role permissions to customize pages:

1. Open the Product Menu and go to *Control Panel* &rarr; *Users* &rarr; *Roles*.

1. Open the Actions menu for the Role and select *Edit*.

1. Click the *Define Permissions* tab for the Role and go to *Site Administration* &rarr; *Site Builder* &rarr; *Pages* under Summary.

1. Scroll down to the Page section under the *Resource Permissions* heading and check the *Customize* permission.

1. Scroll down and click *Save* to apply the changes.

```note::
  The *Customize* permission also lets users customize the look and feel of apps and import or export app settings.
```