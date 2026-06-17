# Managing Orders

The **Orders** page is your main dashboard for tracking all satellite data requests associated with your active workspace. This page explains how to navigate, filter, and act on existing orders.

---

## The Orders List

After logging in, you are taken directly to your orders list — your application space. This page displays all orders submitted under your currently active workspace.

!!! info "Workspace-dependent view"
    The orders list shows only orders belonging to your **active workspace**. Switching workspaces will show a completely different set of orders. Always confirm the correct workspace is selected before searching for a specific order.

### What You'll See

Each order in the list shows:

- **Order ID** — a unique identifier for the order
- **Status** — the current lifecycle stage (Draft, Submitted, Accepted, etc.)
- **Date submitted** — when the order was placed
- **Summary information** — key parameters such as data type and area of interest

---

## Filtering and Sorting

The orders list includes tools to help you find specific orders quickly.

### Filtering by Status

Use the **status filter** to narrow the list to orders in a particular lifecycle stage:

- Draft
- Submitted
- Under Review
- Accepted
- Processing
- Delivered
- Cancelled / Rejected

Select one or more statuses to filter the list. Click **Clear** to remove all active filters and return to the full list.

### Sorting

Use the **sort** controls to reorder the list by fields such as submission date or status. This is useful when you have a large number of orders and need to prioritize recently submitted or recently updated ones.

---

## Viewing Order Details

Click any order in the list to open its **order details page**.

The details page is organized into **steps** — each step corresponds to a stage in the order's lifecycle. A step navigator at the top of the page lets you jump directly to any step.

### Step Navigator

The step navigator displays all workflow stages for the order. Steps you have already passed through are shown as completed, the current step is highlighted, and future steps appear as upcoming.

| Step | What It Contains |
|------|-----------------|
| **Order Form** | The original data requirements you submitted |
| **Order Submission** | The formal submission record and current status |
| *(Additional steps)* | Vary by order type and HSC processing workflow |

---

## Order Actions

Every order has an **Actions** menu (accessible from the order details page) with the following options:

### Copy Order ID

Copies the unique order identifier to your clipboard. Useful when referencing the order in communications with HSC or in other systems.

### View Order History

Opens a full audit log of all changes and state transitions for the order — including timestamps and the actor responsible for each change.

!!! tip
    Use the order history to see exactly when HSC received, reviewed, and acted on your order.

### Duplicate Order

Creates a new draft order pre-populated with all the same parameters as the current order. This is useful when you need to submit a similar request for a different area or time period without starting from scratch.

!!! note
    The duplicate starts as a **Draft** and must be reviewed and submitted before it is sent to HSC.

### Cancel Order

Cancels the submitted order and stops further processing.

!!! warning "Cancellation is only available in Submitted status"
    You can only cancel an order that has been submitted but not yet accepted by HSC. If the order has already been accepted, the cancel option will not be available.

    Contact HSC directly if you need to stop processing on an accepted order.

### Export to Excel

Downloads the order's data as an Excel (`.xlsx`) file. The export includes all form fields and current order parameters — useful for record-keeping or sharing order details outside the platform.

---

## Reviewing the Order Form

From the order details page, you can review all the parameters you submitted in the original order form:

| Field | Description |
|-------|-------------|
| **Area of Interest** | The geographic boundary you defined |
| **Date Range** | Start and end dates for the requested data |
| **Time Series** | Whether multiple acquisitions throughout the period were requested |
| **Data Type** | Optical/multispectral, thermal, or SAR |
| **Resolution** | Spatial resolution preference |
| **Cloud Cover** | Maximum acceptable cloud cover percentage |
| **Acquisition Angle** | Sensor angle preference |
| **Priority** | Whether the order was flagged as urgent |
| **Comments** | Any additional notes submitted with the order |

---

## Next Steps

- [Placing an Order](placing-orders.md) — Create a new satellite data request
- [Order Specification](order-specification.md) — Understand all fields in the order form
