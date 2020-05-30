# Validating Text and Numeric Field Entries

Enable input validation to ensure that only certain values are accepted in a Text or Numeric field.

## Enabling Field Validation

To enable validation:

1. While viewing a form, click on a Text or Numeric field to open the field configuration menu.
1. Click the _Advanced_ tab.
1. Switch the _Validation_ toggle to the right to enable validation.

    ![Figure 1: Validate data to ensure you're collecting only useful information.](./validating-text-and-numeric-field-entries/images/01.png)

Once validation has been enabled, specify the _If Input_ condition and enter the _Show Error Message_ which indicate how validation failed.

<!-- When are the validation rules active? Does a person need to "Save" the form for the validation to be active? If yes, then we should explicitly say so. -->

## Text Fields

See the [Validation Conditions Reference](./validation-rules.md) for more information about the other validation conditions.

### Validating Email Addresses

Forms can be configured to validate email addresses. To ensure that the user has entered a valid email address:

1. Select the _Is not email_ condition from the _If Input_ dropdown.
1. Enter the error message in the _Show Error Message_ field: Please enter a valid email address.
1. Click _Save Form_ when finished.

    ![Use text field validation to make sure users enter a valid email address or URL.](./validating-text-and-numeric-field-entries/images/04.png)

### Validating URLs

Similar to emails, Forms can be configured to validate URLs.

To validate URLs:

1. Select the _Is not URL_ condition from the _If Input_ dropdown.
1. Enter an error message.
1. Click _Save Form_ when finished.

### Using Regular Expressions

Forms can be configured to use [regular expressions](https://en.wikipedia.org/wiki/Regular_expression) to create custom validation criteria. For example, use this regular expression to ensure that ten consecutive numeric digits are entered in a phone number field:

    ^[0-9]{10}$

To validate a text field using a regular expression:

1. Select the _Does Not Match_ condition from the _If Input_ dropdown menu.
1. Enter the regular expression.
1. Enter an error message in the _Show Error Message_ field.

    ![Figure 4: Regular expression text validation opens up countless possibilities.](./validating-text-and-numeric-field-entries/images/05.png)

1. Click _Save Form_ when finished.

## Validating Numeric Fields

Numeric field validation is similar to text field validation, but the conditions compare the value of the number entered to some other value.

To validate numeric fields:

1. Select the desired condition from the _If Input_ dropdown menu (for example, _Is greater than_).
1. Enter numeric value (_10_) that serves as the limit.
1. Enter an error message in the _Show Error Message_ field.

    ![Numeric conditions constrain user-entered numeric data.](./validating-text-and-numeric-field-entries/images/02.png)

1. Click _Save Form_ when finished.

### Requiring Only Integers

Forms can be configured to require numeric values to be integers. By default, the _My numeric type is_ value is set to Decimal.

To configure the Numeric field to accept only integers:

1. While viewing a form, click on a Numeric field to open the field configuration menu.
1. On the _Basic_ tab, click on the _Integer_ radio button.

    ![Specify whether numbers can be decimals or integers only.](./validating-text-and-numeric-field-entries/images/03.png)

1. Click _Save Form_ to apply the changes.

## Additional Information

* [Validation Conditions Reference](./validation-conditions-reference.md)
* [Creating Forms](../creating-forms.md)
