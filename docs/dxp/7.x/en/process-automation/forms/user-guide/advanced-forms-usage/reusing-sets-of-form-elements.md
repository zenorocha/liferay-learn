# Reusing Sets of Form Elements

Forms often request the same sets of information, such as name, birthdays, and addresses. Rather than recreating these fields every time users create a new form, these elements can be grouped as a set and reused. Element Sets include the layout and configuration of the fields.

```note::
   Editing an Element Set doesn't retroactively affect the Forms where the Element Set was used.
```

## Creating Element Sets

To create an Element Set:

1. Open the _Product Menu_ (![Product Menu](../../../../images/icon-product-menu.png)) then click the compass icon (![Compass](../../../../images/icon-compass.png)) on the _Site Administration_ menu.
1. Select the site where the form will be created.
1. Click _Content & Data_  &rarr; _Forms_.
1. Click the _Element Sets_ tab.

     ![Element Sets Tab](./reusing-sets-of-form-elements/images/01.png)

1. Click the _Add_ button (![Add](../../../../images/icon-add.png)).

The steps to create an Element Set are the same as [creating a form](../creating-forms.md). For demonstration, create an Element Set for users to submit their contact information.

1. Enter the following:

    **Name**: Contact Information
    **Description**: Contact Information Element Set

1. Click the _Add Element_ button (![Add](../../../../images/icon-add.png)).
1. Drag and drop the desired Text and Numeric Fields and configure the labels accordingly.
1. Click _Save_ when finished.

The Element Set has been created and is ready for use.

```tip::
   You can use Element Sets to create Element Sets.
```

## Using Element Sets

To use an Element Set in a Form:

1. Open the Form Builder.
1. Open the Elements sidebar by clicking the _Add_ button (![Add](../../../../images/icon-add.png)).
1. Click _Element Sets_.

    ![Using Element Sets.](./reusing-sets-of-form-elements/images/02.png)

1. Drag the Element Set onto the Form Builder, just like you would any single Form Element.

    ![Drag and drag the element set into the builder.](./reusing-sets-of-form-elements/images/03.png)

    ```note::
       Once an Element Set is added to a Form, there's no connection with the root Element Set. Users can move or configure the Fields and Elements.
    ```

1. Click _Publish Form_ button when finished.

## Additional Information

* [Creating Forms](../creating-forms.md)
