# Managing Orders

The [**Orders**]({{ env.ERM_PRODUCTION_URL}}applications) page is your main dashboard for tracking all satellite data requests associated with your active workspace. You will be redirected to this page after logging in.

All data presented on the page is referring to your **active workspace**. Switching workspaces will show a completely different set of orders. Always confirm the correct workspace is selected before searching for a specific order.

![Orders list page](../img/orders-list.png)
///caption
The orders list page shows all orders submitted under your currently active workspace. You can filter and sort the list to find specific orders, and click any order to view its details.
///

### What You'll See

Each order in the list shows:

- **Order ID** — a unique identifier for the order
- **Area of Interest** — the geographic region defined in the order
- **Status** — the current lifecycle stage (Draft, Submitted, Accepted, etc.)
- **Creation date** — when the order was first created
- **Submission date** — when the order was formally submitted to HSC

![order-list-item](../img/order-list-item.png)

Each item also includes an **Actions** menu (three dots) with several options, depending on the order's current status. See [Order Actions](#order-actions) for details.

Clicking on an order will open the [**Order Details** page](order-details.md), where you can view the order's parameters, history, and any associated files.

---

## Order Actions

![Order Actions Menu](../img/order-actions-menu.png)
///caption
The order actions menu provides quick access to common operations for the order, such as copying the order ID, viewing history, duplicating, or cancelling the order.
///

Every order has an **Actions** menu (accessible from the order details page) with the following options:

### Copy Order ID

Copies the unique order identifier to your clipboard. Useful when referencing the order in communications with HSC or in other systems.

### View Order History

Opens a full audit log of all changes and state transitions for the order — including timestamps and the actor responsible for each change.

!!! tip
    Use the order history to see exactly when HSC received, reviewed, and acted on your order.

### Duplicate Order

Creates a new draft order pre-populated with all the same parameters as the current order. This is useful when you need to submit a similar request for a different area or time period without starting from scratch.


### Cancel Order

Cancels the submitted order and stops further processing. You can only cancel an order that has been submitted but not yet accepted by HSC. If the order has already been accepted, the cancel option will not be available.


### Delete Order
Deletes the order from your workspace. This option is only available for orders in **Draft** status. Once deleted, the order cannot be recovered.

### Export to Excel

Downloads the order's data as an Excel (`.xlsx`) file. The export includes all form fields and current order parameters — useful for record-keeping or sharing order details outside the platform.

---



## Next Steps

- [Placing an Order](placing-orders.md) — Create a new satellite data request
- [Order Specification](order-specification.md) — Understand all fields in the order form
