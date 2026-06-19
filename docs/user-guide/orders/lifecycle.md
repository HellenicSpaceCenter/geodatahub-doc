# Order Lifecycle

!!! info "Note"
    The terms "order lifecycle page" and "order details page" are used interchangeably in this documentation. Both refer to the same page, which provides a detailed view of the order's parameters & progress.

An order progresses through several stages from creation to fulfillment or rejection/failure. The platform is designed to minimize necessary communication between the user and HSC, but some back-and-forth may be required. The order lifecycle is designed to be as transparent as possible, with clear status indicators and a full audit trail of all actions taken on the order.

Users are always notified (both in the platform via the notification widget) and/or via email when they need to take an action or submit data. A messaging (chat) system is also implemented to facilitate communication between the user and HSC in the context of a specific order. The chat fulfills the need for non-standardized information exchange, e.g. clarifications. It can only be initiated by the HSC operator handling the order.

## Interface

![Order lifecycle page](../img/lifecycle/order-details-page.png)
///caption
Order lifecycle page (also referred to as the order details page) showing an archival data order which has been succesfully processed and fulfilled. Three steps are shown in the left-hand navigator, with the last one been the succesfully completed step. The first step (order parameters form) is currently selected, displaying the data submitted by the user.
///

The order's detail page is the primary interface for tracking the order's progress, executing actions, and reviewing submitted data. When placing a new order, after setting the initial parameters on the [order creation page](./placing-orders.md), the user is immediately directed to the lifecycle/details page. The first step is always a form with the order's parameters , with parameters specified in the previous page already pre-filled. The user must then fill the rest of the form. 

Before submitting the order, the user can review all parameters and make changes. Once submitted, the order is sent to HSC for review and processing. The user can track the order's progress through the lifecycle page, which provides a clear view of the current status, any required actions, and a history of all changes made to the order.


It is organized into 2 main section:

- The step navigator at the left: shows all steps of the order up to the current one. The user can click on any step to select it and view its details. Each step also displays the date and time when it was completed or modified.
- The main content area at the right: shows the details of the currently selected step. The content varies depending on the step: it may be a form requiring user input, a choice (yes/no) to confirm an action, or an informational section containing a message/data.



### Forms

Forms are used to collect information from the user. They are used in the first step (order parameters) and in any step where HSC requires additional information from the user. The form fields are pre-filled with any data previously submitted by the user, and the user can modify them as needed. 

Forms can contain several field types, some of which are conditional, meaning they are only displayed if certain conditions are met. Some fields are required, and the user cannot proceed to the next step until they are filled. These are marked with a red asterisk (*) next to the field name.

When a form is editable, a "Save and continue" button is displayed at the very bottom of the form. Clicking this button saves the data and moves the order to the next step. Depending on what that next step is, the form may be finalized. Always review the form carefully before submitting, as some fields may be locked after submission and cannot be modified. In the case of the initial order parameters form, the user can always return to it and make changes until the order is explicitly submitted on the following, dedicated, submission step. 

![Form example](../img/lifecycle/form.png)
///caption
Example order parameters form. The form is currently editable, and the "Save and continue" button is displayed at the bottom.
///

### Submission

The submission step is a dedicated step where the user is prompted to review all information before formally submitting the order to the HSC. The HSC cannot see or act on the order until it is submitted. Clicking the "Submit" triggers a confirmation dialog, before performing the finalizing action.

![Submission step](../img/lifecycle/submission.png)
///caption
After saving the order parameters form the user is dericted to the submission step.
///

![Confirmation dialog](../img/lifecycle/confirmation-dialog.png)
///caption
Confirmation dialog displayed when the user clicks the "Submit" button. The user must confirm the action before the order is formally submitted to HSC.
///


## Order evaluation and processing

After submission the HSC is notified of the incoming order. A high-level evaluation is performed to determine if the order can be accepted or rejected immediately. It is then assigned to an operator for processing. The operator may request additional information from the user, or may need to clarify some details. The user is notified of any required actions via the notification widget and/or email, and can respond directly in the order's chat interface.

For tasking orders or archival orders from 3rd-party providers, the operator will fill a form with the actual parameters they will use. Operators are the only actors that have full knowledge and understanding of the operational capabilities of the HSC and the upstream data pipelines, and can thus provide the user with the most accurate information regarding the order's feasibility. They will evaluate the feasibility of the order under the current operational, financial and technical constraints and fill the form with the actual parameters that will be used for tasking or data acquisition from the 3rd-party providers. 

The user must review these parameters and either accept or reject them. If accepted, the order proceeds to the next step for processing. If rejected, the order is closed.


## Data delivery

Upon succesful completion of the order, the user is notified via in-app notification and email. The deliverables are made available for download through a link sent via email. The link has an expiration date, clearly stated in the email.