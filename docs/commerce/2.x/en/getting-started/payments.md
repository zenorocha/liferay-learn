# Payments

Payments are processed through a Payment Method. There are three types of payment methods:

**Offline**: Liferay Commerce does not process payment (for example, a buyer might pay in cash when picking up a product that has been shipped to a local store).

**Online Standard**: Payment is processed entirely by Liferay Commerce. This option is not available out-of-the-box but can be customized using the Payment Method extension point.

**Online Redirect**: Liferay Commerce passes information to a third-party payment processor, redirecting the buyer to the processor's website to complete payment.

Liferay Commerce ships with four payment methods. Money Order is an offline method. Authorize.net, Mercanet, and PayPal redirect buyers to a third-party website. Additional methods can be added using the Payment Method extension point.

By default, Liferay Commerce does **not** store customer payment information. Stores with requirements to allow for recurring payments or a faster checkout experience are recommended to use a third-party payment processor to manage sensitive customer payment information. If store administrators are required to store customer payment information, it is **highly recommended** that they implement [PCI DSS](https://www.pcisecuritystandards.org/) compliant practices and policies.

## Additional Information

* [Managing Payment Methods](../getting-started/managing-payment-methods.md)
