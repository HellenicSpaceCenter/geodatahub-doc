# Platform Navigation

The GeoDataHub interface is organized around a consistent set of navigation elements that appear across every page. This guide explains each component and how to use them efficiently.

---

## Interface Layout

The platform layout consists of four key areas:

```
┌───────────┬──────────────────────────────────────────────┐
│           |  Breadcrumbs │ Notifications │ User Menu     │
├───────────┬──────────────────────────────────────────────┤
│           │                                              │
│ Sidebar   │              Main Content Area               │
│   Nav     │                                              │
│           │                                              │
│ [Org Mgmt │                                              │
│  if admin │                                              │
│ selected] │                                              │
└───────────┴──────────────────────────────────────────────┘
```

![Interface layout](./img/interface-layout.png)

---

## Sidebar

The **sidebar** runs along the left side of every page and serves as the primary navigation menu. It provides access to the main sections of the platform.

!!! tip "Workspace-aware navigation"
    The sidebar adjusts based on your active workspace. If you are an administrator of the currently selected organization, an additional **Organization Management** section appears at the bottom of the sidebar.

### Sidebar Sections

| Section | Description |
|---------|-------------|
| **Orders** | Your main application space — lists all submitted orders |
| **New Order** | Navigate to the order creation map |
| **Organization Management** | Visible only when you have selected a workspace where you are an administrator |
| **Workspace Selector** | Switch between your personal and organizational workspaces directly from the sidebar |

---

## Top Bar

The **top bar** spans the full width of the page and contains three elements: the breadcrumb trail, notifications, and the user menu.

### Breadcrumbs

The breadcrumb trail appears in the top bar and shows your current location within the platform hierarchy.

```
Home > Orders > Order #12345 > Details
```

- Click any item in the breadcrumb to navigate directly back to that level
- Breadcrumbs are especially useful when navigating deeply nested order detail pages
- They update automatically as you move through the platform

!!! example "Using breadcrumbs"
    If you are viewing a specific order's submission step and want to return to your full orders list, click **Orders** in the breadcrumb trail rather than using the browser's back button.

### Notifications

![Notification widget](./img/notifications-widget.png)

///caption
The notifications panel shows updates related to your orders and workspace activity.
///


The **bell icon** in the top bar opens your notifications panel.

- Notifications are shown when there are updates to your orders (e.g., status changes, responses from HSC)
- When there are no unread notifications, the panel will display an empty state
- You can mark all notifications as 'read'

!!! note
    Notifications are [workspace-aware](./workspaces.md). You will only see notifications relevant to the currently active workspace.

### User Menu

![User menu](./img/user-menu.png)
Click your **user icon** in the top bar to access:

| Option | Description |
|--------|-------------|
| **Account Management** | View and edit your profile settings |
| **Log Out** | Sign out of the platform |

---

## Workspace Selector
![Workspace selector](./img/workspace-selector.png)

The **workspace selector** is accessible from both the top bar and the sidebar. It lets you switch between your personal workspace and any organizational workspaces you belong to.

!!! info "Why this matters"
    The active workspace controls which orders are displayed, on whose behalf new orders are submitted, and whether organization management tools are available. Always confirm your active workspace before placing an order.

For a full explanation of workspaces and how they affect your experience, see [Workspaces](workspaces.md).

---

## Quick Navigation Tips

!!! tip "Efficient navigation"
    - Use **breadcrumbs** to move up the page hierarchy without losing context
    - Use the **sidebar** to jump between major sections
    - Check **notifications** regularly for updates on your pending orders
    - Confirm your **active workspace** before performing any action that creates or modifies orders
