# Order Life Cycle

> Liferay Commerce 2.0

An Order stores data regarding a potential or past transaction. This article provides an overview of the order life cycle from open cart to [fulfilled order](../shipments/introduction-to-shipments.md).

![Order life cycle](./order-life-cycle/images/01.png)

>**Figure 1**. Order Life Cycle

## Step 1: Products Added to Cart

A new order is created when a buyer places products into the cart. At this starting point, the data stored in the order includes the identity and quantity of the products, as well as the account which created it.

## Step 2: Order Placed

After providing information to the seller -- such as shipping address and payment method -- and viewing an order summary, the buyer places the order. If configured, an order placed can trigger an [email notification](../../store-administration/sending-emails/store-emails.md).

## Step 3: Order Transmitted

When the seller advances an order from pending to transmitted, the order is sent to an external system, such as Microsoft’s Dynamics GP, Oracle’s NetSuite, or SAP.

## Step 4: Order Fulfilled

The seller completes the remaining steps to deliver the ordered products to the buyer. Additional information can be added to the order, such as an updated order status, [shipping information](../shipments/introduction-to-shipments.md), and estimated arrival time. Again, if configured, various events (for example, an order shipped) can trigger an [email notification](../../store-administration/sending-emails/store-emails.md).

## Additional Information

**Note 1**: [Order Workflows](../order-workflows/introduction-to-order-workflows.md) may be implemented that alter or add additional steps to the workflow outlined above.

* [Orders Menu](./orders-menu-reference-guide.md)
* [Order Information](./order-information.md)
* [Introduction to Order Workflows](../order-workflows/introduction-to-order-workflows.md)
* [Order Management Statuses Reference Guide](./order-management-statuses-reference-guide.md)
* [Enabling or Disabling Order Workflows](../order-workflows/enabling-or-disabling-order-workflows.md)
* [Approving/Rejecting Orders in Order Workflows](../order-workflows/approving-or-rejecting-orders-in-order-workflows.md)
* [Introduction to Shipments](../shipments/introduction-to-shipments.md)
* [Store Emails](../../store-administration/sending-emails/store-emails.md)
* [Processing an Order](./processing-an-order.md)]