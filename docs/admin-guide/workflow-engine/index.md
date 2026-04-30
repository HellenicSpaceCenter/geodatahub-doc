# Workflow Engine

The Workflow Engine is the central Business Process Modeling component of the platform. It allows the dynamic definition of arbitrarily complex workflows that can include user interactions, automated tasks, conditional logic, and integration with external systems. It is specifically designed for the needs of the platform.

[*Workflows*](./workflows.md) are **semantically** and physically tied to the **Application** (order) object, and specifically model the lifecycle of an order. The platform needs an [active workflow](../platform-settings.md#workflows) for each defined order type:

- New data order
- Archive data order
- Axis-3 order
  
When a user (or machine, e.g. the Axis-3 orchestrator) creates an order, the relevant workflow acts as the "brain" of the order, guiding it through its lifecycle. The workflow defines the steps that need to be taken, the conditions for moving from one step to the next, and the actions that should be performed at each step.


*Workflows* are defined as directed graphs of nodes, where each node represents a step in the process. Nodes can be of various types, such as:

- **Form Nodes**: Collect input from users through customizable [forms](./forms.md).
- **Action Nodes**: Perform automated tasks, such as sending notifications or updating records.
- **Decision Nodes**: Implement conditional logic to determine the next steps based on data or user input.


### Important concepts

The Workflow Engine is a complex component with many features and capabilities. It is built using some foundational models/concepts that are important to understand:

- **Workflows**: A workflow is a *directed graph* that defines the bussiness logic model for a specific order type. Each workflow has a unique name and is associated with an order type (see [Platform Settings](../platform-settings.md#workflows)). A workflow consists of nodes and connections that define the flow of the process. 
- **Nodes**: Nodes are the building blocks of workflows. Each node represents a step in the process and can be of various types (form, action, decision, etc.). Nodes have properties that define their behavior and connections to other nodes. Node permissions can be set to control which users can interact with them (view/edit). Some node types are user-facing (e.g. Forms, Decision), while others are backend-only (e.g. Notification, State Transition).
- **Forms**: Forms are used to collect input from users. They are rendered in *form nodes* in a workflow, and they define the fields and layout of the user interface for that step in the process. They are built with **FormFields**, which control the data type, validation, presentation, ability to export, and permissions of each field in the form. The data of a FormField for a specific order (application instance) are saved in an **ApplicationData** object.



### Integrity

It is important to note that the Workflow Engine is a flexible tool that allows for the definition of complex processes, but it does always enforce the integrity and consistency of the defined workflows. Common pitfalls that administrators should be aware of include:

- **Unreachable nodes**: If a node is not connected to the initial node (the starting point of the workflow) through a valid path, it will never be executed. This can lead to parts of the process being effectively "dead code".
- **Unconnected nodes**: If a node is not connected to any other node, it will not be executed as part of the workflow. This can lead to incomplete processes and unexpected behavior.
- **Dead-end paths**: If a node does not have any outgoing connections, it will be a dead-end in the workflow. The backend will try to progress the workflow to the next node after executing a node, and if there are no outgoing connections it will not be able to proceed, effectively "freezing" the order in that step.


!!! warning "Order data"
    After a workflow, node and form have been used in an active order, they become tightly coupled with the data of that order. Deleting or modifying them can lead to data integrity issues and loss of important information. If you need to make changes, other than include a new form field, it is recommended to create a new workflow and phase out the old one, rather than modifying it in place. This way, existing orders can continue to function with the old workflow, while new orders can use the updated workflow.
    


