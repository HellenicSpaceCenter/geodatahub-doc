# Workspaces

Workspaces allow you to act in different capacities within GeoDataHub — as an individual, or as a member (or administrator) of an organization. Understanding how workspaces work is essential for keeping your orders organized and ensuring you submit requests on the correct entity's behalf.

---

## What Is a Workspace?

A workspace is a context that determines:

- **Which orders are visible** — you see only the orders belonging to the active workspace
- **On whose behalf orders are placed** — orders submitted while an organizational workspace is active are attributed to that organization
- **What administrative tools are available** — organization management features only appear when you are an admin of the active workspace

Every user has at least one workspace (their personal workspace). Users who belong to organizations have additional organizational workspaces.

---

## Types of Workspaces

=== ":material-account: Personal Workspace"

    Your **personal workspace** represents you as an individual user.

    - Orders placed in this workspace are submitted on your personal behalf
    - Only you can see these orders
    - No organization management tools are available
    - This workspace is always available and cannot be removed

=== ":material-office-building: Organizational Workspace"

    An **organizational workspace** represents a public sector organization you are a member of.

    - Orders placed in this workspace are submitted on behalf of the organization
    - All members of the organization with appropriate permissions can view these orders
    - If you are an **administrator** of the organization, the **Organization Management** section appears in the sidebar
    - You may belong to multiple organizations, each with its own workspace

!!! example "Example: Hellenic Cadastre"
    A user who is a member of the Hellenic Cadastre organization will see a **Hellenic Cadastre** workspace in their selector. Switching to it shows all orders submitted for that organization and grants access to organization management tools if the user is an admin.

---

## Switching Workspaces

You can switch your active workspace from two locations:

1. **Workspace Selector in the Top Bar** — click the workspace name displayed near the top of the page
2. **Workspace Selector in the Sidebar** — available at all times in the left navigation panel

!!! warning "Check your workspace before placing an order"
    When you submit an order, it is permanently attributed to the workspace that was active at the time of submission. Always confirm the correct workspace is selected before navigating to the order creation flow.

    At the submission step, the platform reminds you which organization you are acting on behalf of — review this carefully.

---

## Administrative Workspaces

If you are an **administrator** of an organization, switching to that organization's workspace unlocks the **Organization Management** section in the sidebar.

!!! note "Role-based access"
    Administrative privileges are per-workspace. You may be an admin of one organization while having only standard member access to another. The Organization Management section only appears when you are viewing a workspace where your account holds administrator rights.

??? info "What can organization administrators do?"
    Organization administrators can manage the organization's settings and membership. Details on administration tasks are covered in the Administration Guide.

---

## Workspace Summary

| | Personal Workspace | Organizational Workspace (Member) | Organizational Workspace (Admin) |
|--|--|--|--|
| See own orders | ✅ | ✅ | ✅ |
| See organization orders | ❌ | ✅ | ✅ |
| Place orders for organization | ❌ | ✅ | ✅ |
| Access org management | ❌ | ❌ | ✅ |
| Always available | ✅ | Depends on membership | Depends on role |

---

## Next Steps

With workspaces understood, you are ready to manage and place orders:

- [Managing Orders](orders/managing-orders.md) — View and filter orders in your current workspace
- [Placing an Order](orders/placing-orders.md) — Create a new satellite data request
