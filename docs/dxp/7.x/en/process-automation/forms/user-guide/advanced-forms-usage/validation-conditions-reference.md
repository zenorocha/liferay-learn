# Validation Conditions Reference

There are several out-of-the-box validation conditions that can be used to validate form responses before they are submitted.

## Text Field Validation Conditions

| Condition | Description |
| --- | --- |
| Contains | This condition checks against a specified value permitted; if the entry contains this value, then validation fails. |
| Does not Contain | This is the opposite of "Contains"; if an entry does _not_ contain the value, validation fails. |
| Is not URL | This condition ensures URLs are valid. |
| Is not Email | This condition ensures email addresses are valid. |
| Does not Match | This condition ensures [regular expressions](https://en.wikipedia.org/wiki/Regular_expression) are valid; for example, this RegEx expression `^[0-9]{10}$` ensures that ten consecutive numeric digits must be entered. |

## Numeric Field Validation Conditions

| Condition | Description |
| --- | --- |
| Is greater than or equal to | This condition checks whether the value is greater than or equal to the specified value. |
| Is greater than | This condition checks whether the value is greater than the specified value. |
| Is not equal to | This condition checks whether the value is equal to the specified value. |
| Is less than or equal to | This condition checks whether the value is less than or equal to the specified value. |
| Is less than | This condition checks whether the value is less than the specified value. |

## Additional Information

* [Validating Text and Numeric Field Entries](./validating-text-and-numeric-field-entries.md)
