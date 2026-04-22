# Organizations & Workspaces

Each user can be associated with one or more organizations, which represent the different entities that the user belongs to, i.e. is authorized to access data/orders of. An organization can represent a government agency, a research institution, or any other entity that needs to access the platform. Each organization has its own workspace, which is a separate area of the platform where users can manage their orders and data.

Each user also has their default "personal" workspace, which is not associated with any organization. Users can switch between workspaces to access the data and orders of different organizations they belong to.

When a user selects a workspace, they can only see the orders and data that belong to that workspace (i.e. organization). This allows for data isolation and security, as users can only access the data that they are authorized to access. 


![Workspace selection](../img/select-workspace.png "Workspace selection")
/// caption
Workspace selection control. If a user only has a personal workspace, no control is displayed.
///

## Organization-specific roles

In addition to the platform-wide roles, there are also 2 organization-specific roles that can be assigned to users within an organization:

| Role              | Description                                                                                         |
| ----------------- | --------------------------------------------------------------------------------------------------- |
| **Org Admin**     | Has full access to all features and functionalities of the organization, including managing users and their roles within the organization, viewing and managing all orders of the organization, and creating user invitations for the organization. |
| **Org Member**    | Can view and manage their own orders within the organization, but cannot manage other users or view/manage orders that they do not own. |

Thechincally, these roles are implemented as namespaced group memberships in Keycloak. Each org is represented by a top-level group, containing sub-groups for each role, e.g. `my-org/admins` and `my-org/users`.

![User's organization orders page](../img/user-org-orders-page.png)
/// caption
User's orders page, showing only the orders of the selected organization.
///

Org **administrators** can:

- Add/remove users from their organization
- Add/remove administrators from their organization
- Create user invitations for their organization, allowing them to invite new users to join the platform and be associated with their organization. 
- View all orders of their organization
- Manage the orders they are owners of.

Org **members** can:

- View and manage the orders they are owners of.

----

## Organization management

Organization management is performed through the "Οργανισμός" page, which is accessibl to org admins. This page allows org admins to manage their organization, including adding/removing users, managing user roles, and creating user invitations.
![Organization management page](../img/org-management-page.png)


### Adding users

Adding a user to an organization is done by clicking the "Προσθήκη Χρήστη" button, which opens the relevant dialog.

![Add user dialog](../img/add-user-dialog.png)
/// caption
Dialog for adding a user to an organization.
///

The admin can search for existing users by their username or email, and add them to the organization. If the user does not exist, they can be invited to join the platform and be associated with the organization (*Πρόσκληση χρήστη με Α.Φ.Μ.*). The invitation requires the user's tax registration number (AFM), which is used to uniquely identify the user and ensure that they are authorized to access the platform. The invitation is created in the background, and the user optionally receives an email with instructions on how to complete their registration and access the platform.


## Organization management (Admin)

New organizations can only be registered by platform administrators, and users cannot create their own organizations. This is to ensure that organizations are properly registered and managed, and to prevent unauthorized access to the platform.

The platform administrators (users with role _administrator_) can manage organizations in the ["Οργανισμοί"]({{env.ERM_PRODUCTION_URL}}/organizations) page, which is accessible from the main menu. This page allows administrators to view all organizations, create new organizations, and manage existing organizations.

![Organizations Admin Page](../img//orgs-admin-page.png)
///caption
Organizations management page for platform administrators.
///

![Add new organization dialog](../img/add-org-dialog.png)
/// caption
Dialog for adding a new organization.
///

To create a new organization, the administrator clicks the "Προσθήκη Οργανισμού" button, which opens the relevant dialog. The administrator can then enter the name of the organization and click "Create" to create the organization. Once created, the organization can be managed by org admins as described in the previous section. The administrator also has access to the same management features as org admins (adding & inviting users, setting org admins etc), allowing them to manage any organization on the platform.



