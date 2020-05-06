# Propagating Page Fragment Changes

By default, updates made to Page Fragments aren't automatically propagated to the [Content Pages](../../creating-pages/content-pages-overview.md), [Content Page Templates](../../creating-pages/creating-a-page-template.md), and [Display Pages](./creating-a-display-page-template.md) that use them. You must manually propagate the changes. However, you can enable automatic propagation for testing purposes. See [Enabling Automatic Page Fragment Propagation](#enabling-automatic-page-fragment-propagation) for more information.

## Manually Propagating Page Fragment Changes

Follow these steps to propagate your Page Fragment changes manually:

1. Open the Product Menu and go to Site &rarr; *Site Builder* &rarr; *Page Fragments*.

1. Select the Collection containing the changed Page Fragment.

1. Open the *Actions* menu (![Actions](../../../images/icon-actions.png)) for the Page Fragment and select *View Usages*.

  ```note::
    You can propagate changes from global Page Fragments to their usages on child Sites. Select *View Site Usages* from the Page Fragment's Actions Menu in the Global Site.
  ```

1. From the *Usages and Propagation* page, select the Content Page(s), Content Page Template(s), and Display Page(s) where Page Fragment changes should propagate. You can use the various filters and selection options to apply updates to pages quickly.

  ![Viewing the Usages and Propagation page.](./propagating-page-fragment-changes/images/01.png)

1. Click the *Propagate* icon (![Propagate](../../../images/icon-propagate.png)) to propagate your changes.

```note::
  Changes to existing ``editable`` fields are not propagated since this overwrites content currently in Content Pages. To force propagation to content in an ``editable`` field, you must change the field ID. Content created in that field no longer appears in the Content Page when the changes are propagated, but it remains in the database and can be retrieved using the old ID.
```

## Enabling Automatic Page Fragment Propagation

During development testing, manually propagating Page Fragment changes can be tedious. For development purposes, since Liferay DXP 7.2 SP1+ and Liferay Portal CE GA2+, you can enable automatic Page Fragment propagation.

```note::
  Automatic Page Fragment propagation should only be enabled for development testing, as automatic propagation can lead to unintended consequences in the production environment, such as typos or inaccurate content being published. Automatic propagation only works for HTML, CSS, and JavaScript Page Fragment code, not the editable values.
```

Follow these steps to enable automatic Page Fragment propagation:

1. Open the Product Menu and select *Control Panel* &rarr; *Configuration* &rarr; *System Settings*.

1. Click *Page Fragments* under the Content and Data heading.

1. Enable the *Propagate Fragment Changes Automatically* setting and click *Save* to apply the change.

![Once Page Fragment propagation is enabled, developers can propagate Page Fragment changes to all pages using them automatically.](./propagating-page-fragment-changes/images/02.png)

Your Page Fragment updates are now automatically propagated! The Page Fragment Editor displays a notification that automatic Page Fragment propagation is enabled.

![You're notified when automatic propagation is enabled.](./propagating-page-fragment-changes/images/03.png)