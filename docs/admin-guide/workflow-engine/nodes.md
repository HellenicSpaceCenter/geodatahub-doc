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

### <i data-lucide="file-text" class="icon-small"></i> Form

Form nodes present a form to the user, allowing them to input data that will be used in subsequent steps of the workflow. Forms can include various field types such as text inputs, dropdowns, checkboxes, and file uploads.

A form node must reference a [**Form**](./forms.md) that defines the structure and fields of the form to be presented. Programmatically, this corresponds to the `content` database column of the node, which contains the form's `mname` (machine name). When a workflow execution reaches a form node, the system retrieves the corresponding form definition using the `mname` and renders it for the user to fill out. When the user submits the form, the input data is validated and stored in an [**ApplicationData**](https://github.com/HellenicSpaceCenter/geodatahub-erm/blob/main/services/core/modules/flows/orders/models.py#L337) record linked to the order, making it available for use in subsequent nodes of the workflow.

![Form node in workflow graph](../img/nodes/form-in-wf-graph.png)
///caption
Form node in a workflow graph
///

#### Purpose
Collect form field data from users.

#### Runtime behavior

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


### <i data-lucide="split" class="icon-small"></i> Boolean

#### Purpose

Capture a binary choice and branch workflow accordingly.

#### Runtime behavior

- User chooses true/false and confirms submission.
- Value is stored as string (`"true"` or `"false"`).
- Next node is selected by matching child edge condition value.

#### Settings

| Setting | Label | Required | Description |
|---|---|---|---|
| **Title** | Τίτλος | Yes | The title of the node displayed to users |
| **True Label** | Ετικέτα "Ναι" | No | Label for the "true" option |
| **False Label** | Ετικέτα "Όχι" | No | Label for the "false" option |

![Boolean node settings](../img/nodes/boolean-settings.png)
///caption
Boolean node settings menu.
///

### <i data-lucide="user-plus" class="icon-small"></i> Assignation

#### Purpose
Assign the order to a specific operator.

#### Runtime behavior

- Administrator selects one target user.
- Backend sets `application.operator` from submitted user id (uuid).
- Flow then proceeds to next child.

#### Settings

| Setting | Label | Required | Description |
|---|---|---|---|
| **Title** | Τίτλος | Yes | The title of the node displayed to users |
| **Operator** | Επιλογή Χρήστη | Yes | Select the operator to assign the order to |

![Assignation node settings](../img/nodes/assignation-settings.png)
///caption
Assignation node settings menu.
///

### <i data-lucide="bookmarked" class="icon-small"></i> Submit

#### Purpose
Final submission checkpoint for users to confirm their data and intent before forwarding the order to the Hellenic Space Center team.

#### Runtime behavior

- User confirms submission.
- Backend sets `application.final = True` and `submitted_at`.
- Backend finalizes previous node data and marks application cancellable (`is_cancellable = True`).

#### Settings
| Setting | Label | Required | Description |
|---|---|---|---|
| **Title** | Τίτλος | Yes | The title of the node displayed to users |
| **Confirmation Message** | Μήνυμα Επιβεβαίωσης | Yes | Message displayed to the user for final confirmation |

![Submit node settings](../img/nodes/submit-settings.png)
///caption
Submit node settings menu.
///

### <i data-lucide="cpu" class="icon-small"></i> Harvester Subsystem

#### Purpose

Operational step for launching and monitoring Harvester ingestion tasks. The harvester subsystem is responsible for ingesting completed orders' data bundles into the [Geodatahub catalog service]({{env.CATALOG_URL}}).

!!! warning "Harvester Subsystem"
    In practice, this node should **always** only be accessible by internal users. 

#### Runtime behavior

- UI allows selecting provider and source folder.
- Triggers harvester submit API.
- Polls task status and displays logs.
- Once a task is completed, user can continue flow.

#### Settings
| Setting | Label | Required | Description |
|---|---|---|---|
| **Title** | Τίτλος | Yes | The title of the node displayed to users |
| **Message** | Μήνυμα | No | Optional message to display to users when workflow reaches this node |

![Harvester Subsystem node settings](../img/nodes/harvester-subsystem-settings.png)
///caption
Harvester Subsystem node settings menu.
///

### <i data-lucide="bell" class="icon-small"></i> Notify

#### Purpose
Send notification(s) to users based on workflow events. This node allows configuring and sending notifications to users when the workflow reaches this point. Notifications can be used to inform users about important events, such as order submission, status changes, or when their input is required to proceed with the workflow.

#### Runtime behavior

- When workflow execution reaches this node, a notification is created.
- Notification content can include dynamic data from the order context, using a templating syntax.
- Notifications are recorded in the database and can be viewed in the order's notification history.
- The notification is sent using the relevant channels (e.g. email, in-app).

#### Settings
| Setting | Label | Required | Description |
|---|---|---|---|
| **Title** | Τίτλος | Yes | The title of the node |
| **Notification Content** | Περιεχόμενο Ειδοποίησης | Yes | Define the content of the notification. Can either be text, supporting dynamic values, or an [Email Template](../email-templates.md). |
| **Notification Type** | Τύπος Ειδοποίησης | No | Specify the type of notification (email, in-app) |
| **Recipients** | Παραλήπτες | Yes | Specify the recipients of the notification |

![Notify node settings](../img/nodes/notify-settings.png)
///caption
Notify node settings menu.
///

#### Recipient Selection

Recipient selection supports 4 modes:

1. **Specific users**: Select individual users to receive the notification. ![alt text](../img/nodes/notification-recipients/specific-users.png)

2. **Role-based**: Select user groups based on their role in the order (e.g. Author, Supervisor, Operator). ![alt text](../img/nodes/notification-recipients/role-based.png)

3. **User groups**: Select user groups (e.g. Supervisors, Operators) to receive the notification. ![alt text](../img/nodes/notification-recipients/user-groups.png)

4. **Relation-based**: Select users based on their relation to the order (author, assigned operator). ![alt text](../img/nodes/notification-recipients/relation-based.png)

### <i data-lucide="stamp" class="icon-small"></i> Register

#### Purpose

Assign `geodatahub_order_id` to application, if not already set. This marks the order as registered in the system, ceasing to be a "draft" and becoming an official order in the system. After this point, the order is visible in the order management interface and can be processed by the Hellenic Space Center team.

#### Runtime behavior

- Backend generates unique `geodatahub_order_id` and assigns it to `application.geodatahub_order_id`.

#### Settings
| Setting | Label | Required | Description |
|---|---|---|---|
| **Title** | Τίτλος | Yes | The title of the node |
| **Mode** | Τρόπος | Yes | Select the mode for generating the order ID (Incremental or Random) |

![Register node settings](../img/nodes/register-node-settings.png)
///caption
Register node settings menu.
///

### <i data-lucide="forward" class="icon-small"></i> Transition

#### Purpose
Change application status.

### Runtime behavior

- Finalizes previous node data.
- Sets `application.status = node.transition`.
- If status is one of `completed`, `rejected`, `cancelled`, `failed`, application is closed and all data is finalized.

#### Settings
| Setting | Label | Required | Description |
|---|---|---|---|
| **Title** | Τίτλος | Yes | The title of the node |
| **Transition** | Αλλαγή κατάστασης σε: | Yes | The application status to transition to when the workflow reaches this node. |

![Transition node settings](../img/nodes/transition-node-settings.png)
///caption
Transition node settings menu.
///

### <i data-lucide="webhook" class="icon-small"></i> Webhook

!!! UI
    Webhooks are hybrid in the sense that they are backend nodes that can also be rendered in the UI, to show internal users the status of the webhook call and allow retriggering it if necessary.

#### Purpose
Trigger an outbound HTTP call to an external API, and show call history in the UI.

#### Runtime behavior
- Backend makes HTTP request to specified URL with given method, headers, and body.
- Flow progresses immediately after triggering the call, without waiting for response.
- Call is recorded in the database (`WebhookCall` model) with status and response details.

#### Settings
| Setting | Label | Required | Description |
|---|---|---|---|
| **Title** | Τίτλος | Yes | The title of the node displayed to users |
| **URL** | URL | Yes | The URL to which the HTTP request will be sent |
| **HTTP Method** | HTTP Method | Yes | The HTTP method to use|
| **Payload** | Payload | No | The body of the HTTP request, for methods like POST or PUT |
| **Authentication** | Authentication | No | Credentials to use for authentication (e.g. API key, Basic Auth). Credentials are created and managed in the [Credentials Management](../credentials-management.md) section. |

![Webhook node settings](../img/nodes/webhook-settings.png)
///caption
Webhook node settings menu.
///

#### Dynamic Values

Webhook node settings support dynamic values for the URL and payload fields, allowing them to be constructed using data from the order context. This is achieved through a templating syntax ([Jinja2](https://jinja.palletsprojects.com/en/3.1.x/)) that references application data fields.

A helper dropdown is available in the UI to assist users in constructing these dynamic values. The dropdown lists all available order data fields that can be used in the templates, such as:

- Order ([Application](https://github.com/HellenicSpaceCenter/geodatahub-erm/blob/main/services/core/modules/flows/orders/models.py#L133)) fields 
- Form inputs collected in previous nodes. 

When a user selects a field from the dropdown, the corresponding Jinja2 template syntax is copied to the clipboard, which they can then paste into the URL or payload fields to include dynamic data in their webhook calls.


![Webhook dynamic values helper](../img/nodes/webhook-settings-dynamic-values.png)
///caption
Webhook dynamic values helper dropdown.
///
