# Users

GeodataHub follows the [EOEPCA](https://eoepca.readthedocs.io/projects/iam/en/latest/) architecture, and uses Keycloak as the Identity and Access Management (IAM) system for user authentication and authorization. This allows for robust user management features, including role-based access control, single sign-on, and integration with external identity providers.

???+ danger "Using the Keycloak admin console is strongly discouraged"
    While using the Keycloak [admin console]({{ env.KEYCLOAK_URL }}/admin/master/console) is feasible, it is **strongly discouraged**, as many of the server settings are controlled via the deployment plane, and changing them might either break the system, cause unexpected behavior, or be overridden in a future deployment. Instead, the platform provides an administration page for managing users and their permissions, which is the recommended way to manage users in the system.

---

Users are divided into 2 main categories:

- **Internal Users (HSC)**: Hellenic Space Center (HSC) employees who have access to the platform for administrative and operational purposes.
- **External Users (Customers)**: External users who can access the platform to place orders and manage their data. These users are typically customers of the HSC, such as government agencies & research institutions. They must be authorized by an HSC admin, or by an [organization]() admin, before they can log in to the system.

## Roles

The platform uses role-based (RBAC) & attribute-based access control (ABAC) to manage user permissions. There are 4 roles in the system, which are assigned to users to control their access to different features and functionalities. On top of these, there are also 2 [*organization-specific* roles](../orgs/index.md#organization-specific-roles).


| Role              | Category | Description                                                                                                                                                                                                                 |
| ----------------- | -------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Administrator** | Internal | Has full access to all features and functionalities of the platform, including user management, workflow management, form editing and system configuration. This role is reserved for a very small number of trusted users. |
| **Supervisor**    | Internal | Acts as a manager for the platform, with permissions to view and manage orders, reject orders, assign orders to the appropriate _operator_, analytics views, but without access to user management or system configuration. |
| **Operator**      | Internal | Responsible for processing orders, which includes viewing order details, communicating with customers, and updating order status.                                                                                           |
| **Authorized**    | External | This role is assigned to external users (customers) who are authorized to place orders and access their data. Users with this role can view and manage their own orders and data.                                           |

///caption
Platform-wide user roles
///



## Login


The platform supports 2 login methods:

- **Username/Password**: Users can log in using a username and password. This is reserved for local/internal/custom users, and is not recommended for production use.
- **GSIS/TaxisNet login**: Users can log in using their GSIS/TaxisNet credentials. This is the recommended login method for production use, as it allows users to authenticate using their existing government credentials, and provides a seamless login experience, as well as _strong proof of identity_ via unique tax registration numbers (AFM).


![alt text](../img/pre-login-screen.png "Pre-login Screen")
///caption
Pre-login homepage
///



![alt text](../img/login-screen.png "Login Screen")
///caption
**Login screen**:
User can choose to log in with either their username/password, or with their GSIS/TaxisNet credentials.
///

???+ note "Self-registration is **disabled**"
    All users must be created and verified by an administrator, or invited by an organization admin. This is to ensure that only authorized users can access the system, and to maintain control over who has access to the platform.

