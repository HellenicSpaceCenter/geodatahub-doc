# Workflow Nodes

Nodes are the building blocks of workflows, representing individual steps or actions in a workflow process. Each node has a specific type that defines its behavior and configuration options. Nodes can perform various functions, such as sending notifications, making API calls, processing data, or controlling the workflow's execution flow.

Nodes can be classified into **User-Facing Nodes** and **Backend Nodes**. User-facing nodes are those that require input from users to execute. Backend nodes execute autonomously as soon as they are reached, based on the current state/data of the order in process.

## At a Glance

| Node Type               | Category                         | Visible in runtime UI | Main purpose                                     |
| ----------------------- | -------------------------------- | --------------------- | ------------------------------------------------ |
| `form`                  | User task                        | Yes                   | Collect structured input from users              |
| `boolean`               | User task + branching            | Yes                   | Ask a yes/no decision and branch flow            |
| `assignation`           | User task                        | Yes                   | Assign the application to an operator/user       |
| `submit`                | User task                        | Yes                   | Final submission checkpoint                      |
| `harvester_subsystem`   | User task + external integration | Yes                   | Trigger and monitor data ingestion tasks         |
| `deliverables`          | User task + external integration | Yes                   | Create/manage deliverables and complete step     |
| `webhook`               | Backend action + monitoring      | Yes                   | Execute outbound HTTP call and show call history |
| `transition`            | Backend action                   | No                    | Change application status                        |
| `register`              | Backend action                   | No                    | Assign `geodatahub_order_id`                     |
| `notify`                | Backend action                   | No                    | Send notification(s)                             |
| `restrict_cancellation` | Backend action                   | No                    | Disable cancellation for application             |
| `end_node`              | Terminal marker                  | Yes                   | End-of-flow state and final status display       |

----

## Shared Concepts

### Permissions

User-facing nodes define the UI that users of the platform see and interact with when going through an order. Different users must see different nodes within the same workflow, therefore all user-facing nodes have **Permission** settings. 

There exist 2 types of permission flags:

| Permission | Description |
|---|---|
| **Read (R)** | Users can see the node and its content, but cannot interact with it |
| **Write (W)** | Users can interact with the node and modify its content, write data, submit it, etc.|

These permissions can be set for each of these user groups:

- **Author**: The end user who is placing the order, or the administrator of the organization that the order belongs to.
- **Supervisor**: Internal users with the "Supervisor" role.
- **Operator**: Internal user who is assigned to the order.


![Node permissions editor](../img/nodes/perm-editor.png)
///caption
Node permissions editor. In this example, the node is visible to all user groups, but only the author can interact with it (modify data & submit it). Supervisors and operators can only see the node and its content, but cannot interact with it.
///


### Common node settings

All nodes have some common settings:
| Setting | Label | Required | Description |
|---|---|---|---|
| **Title** | Τίτλος | Yes | The title of the node displayed to users |

----

## User-facing nodes

Full list of user-facing nodes:

### Form

Form nodes present a form to the user, allowing them to input data that will be used in subsequent steps of the workflow. Forms can include various field types such as text inputs, dropdowns, checkboxes, and file uploads.

A form node must reference a [**Form**](./forms.md) that defines the structure and fields of the form to be presented. Programmatically, this corresponds to the `content` database column of the node, which contains the form's `mname` (machine name). When a workflow execution reaches a form node, the system retrieves the corresponding form definition using the `mname` and renders it for the user to fill out. When the user submits the form, the input data is validated and stored in an [**ApplicationData**](https://github.com/HellenicSpaceCenter/geodatahub-erm/blob/main/services/core/modules/flows/orders/models.py#L337) record linked to the order, making it available for use in subsequent nodes of the workflow.

![Form node in workflow graph](../img/nodes/form-in-wf-graph.png)
///caption
Form node in a workflow graph
///

#### Purpose
Collect form field data (`ApplicationData`) from users.

### Runtime behavior

- Rendered by the form renderer component.
- Progress requires required fields to be present.
- Once related data is finalized, the node is no longer editable.

#### Settings

| Setting | Label | Required | Description |
|---|---|---|---|
| **Title** | Τίτλος | Yes | The title of the node displayed to users |
| **Form** | Επιλογή Φόρμας | Yes | The form presented when the workflow reaches this node |
| **Permissions** | Δικαιώματα | Yes | Define which user groups can see and interact with the node |

![Form node settings](../img/nodes/form-settings.png)
///caption
Form node settings menu.
///


### Boolean

### Purpose

Capture a binary choice and branch workflow accordingly.

### Runtime behavior

- User chooses true/false and confirms submission.
- Value is stored as string (`"true"` or `"false"`).
- Next node is selected by matching child edge condition value.

### Settings

| Setting | Label | Required | Description |
|---|---|---|---|


### Assignation

### Purpose
Assign the order to a specific operator.

### Runtime behavior

- Administrator selects one target user.
- Backend sets `application.operator` from submitted user id (uuid).
- Flow then proceeds to next child.

### Settings

| Setting | Label | Required | Description |
|---|---|---|---|


### Submit

### Purpose
Final submission checkpoint for users to confirm their data and intent before forwarding the order to the Hellenic Space Center team.

### Runtime behavior

- User confirms submission.
- Backend sets `application.final = True` and `submitted_at`.
- Backend finalizes previous node data and marks application cancellable (`is_cancellable = True`).

### Settings
| Setting | Label | Required | Description |
|---|---|---|---|