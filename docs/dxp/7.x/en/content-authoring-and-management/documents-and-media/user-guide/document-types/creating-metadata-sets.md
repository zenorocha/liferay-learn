# Creating Metadata Sets

You can define metadata fields that users fill out when they create or edit Documents and Media files. You do this by creating *metadata sets* and then associating them with document types, which wrap Document Library files and thus apply your metadata fields to the files. Although you apply metadata sets via document types, metadata sets exist independently and you can apply them to any number of document types.

Metadata Sets can be grouped in a hierarchy and can become the foundation of another metadata set (an "extension"). When a user creates a document of a document type that uses an extended metadata set, the parent metadata set's fields appear above the extended metadata set's.

To create a metadata set:

1. Open the _Product Menu_ (![Product Menu](../../../../images/icon-product-menu.png)) then click the compass icon (![Compass](../../../../images/icon-compass.png)) on the _Site Administration_ menu.
1. Select the site where the form will be created.
1. Click _Content & Data_  &rarr; _Documents and Media_.
1. Click the _Metadata Sets_ tab.
1. Click the _Add_ button (![Add](../../../../images/icon-add.png)). The New Metadata Set form appears.
1. Enter a name.
1. Expand the _Details_ section.
1. Enter a description for the new Metadata Set.
1. Leave the **Parent Metadata** field blank if this is a parent. To select a Metadata Set to extend, click the _Select_ button for _Parent Metadata Set_ and then select the desired Metadata Set.
1. Drag and drop the metadata fields into the editor.

    ![Add your metadata set's fields to the canvas.](./creating-metadata-sets/images/01.png)

1. Click _Save_.

The following metadata fields are available:

| Metadata Field Type | Description |
| --- | --- |
| Boolean | Check the check box |
| Color | Specify a color. |
| Date | Enter a date. |
| Decimal | Enter a decimal number up to 2 decimal points. |
| Documents and Media | Select a file from a Documents and Media library. |
| Geolocation | Specify a location to associate with the document. |
| HTML | Use a WYSIWYG editor to enter HTML to enhance the content. |
| Integer | Enter an integer |
| Link to Page | Link to another page in the same site. |
| Number | Enter a decimal number or an integer. |
| Radio | Displays several clickable options but only one option can be selected at a time. |
| Select | This is just like the radio field except that the options are hidden and must be accessed from a drop-down menu. |
| Text | Enter a single line of text. |
| Text Box | Enter multiple lines of text or separate paragraphs. |
| Web Content | Select a Web Content article. |

## Editing Metadata Sets

You can edit your fields to reflect their intended metadata. For example, a text field's default label is *Text*. If you want to use the text field as a title, for instance, then you should change the field's label to *Title*. Besides the Label field, you can also configure the default values, variable names, mouse-over tips, widths, and other settings. Some fields have a *Required* setting for specifying whether users must populate the field. If a field's *Repeatable* setting is *Yes*, users can add multiple consecutive instances of the field to the document's metadata.

1. Click on the field on the canvas. This automatically selects the *Settings* tab on the left.
1. To edit a setting value, double-click it in the Settings table and enter the new value.

    ![Editing a field's values](./creating-metadata-sets/images/02.png)

1. Click _Save_ when finished.

### Translating a Metadata Set

You can translate each of a metadata set's field values to any supported locales.

1. Click _Add Translation_.
1. Click on the language (for example: _French (France)_). Repeat to add another locale.

    ![Adding a translation.](./creating-metadata-sets/images/03.png)

1. Once added to the Available Translations section, click on the flag representing the language.
1. Modify the desired values.

   ![Translating a field name](./creating-metadata-sets/images/04.png)

1. Click _Save_ when finished.

## Additional Information

* [Creating Document Types](./creating-document-types.md)
