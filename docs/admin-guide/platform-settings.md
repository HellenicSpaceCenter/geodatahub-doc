# Platform Settings

Platform administrators can configure various settings of the system via the ['Διαχείριση/Ρυθμίσεις']({{env.ERM_PRODUCTION_URL}}/admin/app-configuration) page. The page is broken down into various sections, each corresponding to a different aspect of the platform's configuration. 

!!! info "Persisting changes"
    After making changes to the settings, make sure to click the `Αποθήκευση` button at the top-right of the page to save your changes. This action will save changes from **all** tabs, not just the currently active one. If you navigate away from the page without saving, any unsaved changes will be lost.

## Spatiotemporal Asset Catalogs (STAC)

This tab allows administrators to manage the Spatiotemporal Asset Catalogs (STAC) that are registered in the system. These are the catalogs that are displayed to the users when they **search for data**, before submitting an order. Administrators can add new catalogs, edit existing ones, and delete or disable catalogs that are no longer needed.

![STAC Settings](./img/app-settings/stac.png)
///caption
STAC settings page
///

For each catalog, administrators can specify the following details:

| Field | Description |
|-------|-------------|
| Title | A human-readable name for the catalog. |
| URL | The endpoint URL of the STAC API. |
| Thumbnail URL | An optional URL for a thumbnail image that represents the catalog in the user interface. |
| Active/Inactive | A toggle to enable or disable the catalog. Inactive catalogs will not be displayed to users in the search interface. |


### Managing catalogs

- To delete a catalog, click on the trash icon on the top-right of the catalog entry.
- To toggle a catalog's active status, click on the toggle switch on the top-right of the catalog entry.
- To add a new catalog, click on the 'Προσθήκη καταλόγου' button, at the bottom of the catalogs list.

![New catalog form](./img/app-settings/new-catalog-form.png)
///caption
New catalog form
///

----

## Rejection Codes

This tab allows administrators to manage the rejection codes that are used in the workflows of the platform. Rejection codes are standardized codes that specify the reason for rejecting an order at a specific step in a workflow. They are used to provide clear and consistent feedback to users when their orders are rejected, and to allow administrators to analyze and report on the reasons for rejections.

The list is pre-filled with some agreed-upon standard rejection codes, which **cannot** be deleted. Administrators can add new rejection codes. Once a code is added, it also **cannot** be deleted (this is to ensure **data integrity**, as there is **no database-level enforcement** of the relationship between rejection codes and workflow steps, but we want to avoid orphaned references to deleted codes).

![Rejection codes settings](./img/app-settings/rejection-codes.png)
///caption
Rejection codes settings page
///

----

## Workflows

In this tab the active workflows of the system are specified. There are 2 workflows that are currently supported:

- **New order workflow**: This workflow is triggered when a user submits an order requesting the new data to be acquired by the HSC from an upstream provider.
- **Archive order workflow**: This workflow is triggered when a user submits an order requesting data that is already available in the HSC's archive.

![Workflow settings](./img/app-settings/workflows.png)
///caption
Workflow settings
///

These settings effectively make the workflow instances active. The admin can create an arbitrary number of workflows in the [workflows management page]({{env.ERM_PRODUCTION_URL}}/admin/edit/workflows). These workflows are then only triggered when they are set as active in the platform settings. This allows administrators to have multiple versions of a workflow (e.g. a testing version and a production version), and to easily switch between them by changing the active workflow in the settings.

**Note**: orders that have already been initialized with a previous workflow will continue to follow that workflow, even if the active workflow is changed in the settings. The active workflow only affects new orders that are submitted after the change.

!!! warning "Caution"
    Workflows are delicate, and require extensive validation before they can be safely used in production. Make sure to thoroughly test any changes to the workflows in a staging environment before activating them in production. Also, any **major changes** to a workflow should ideally be rolled out as a **new version** of that workflow, rather than modifying the existing one. This allows for safer rollouts and easier rollbacks in case of issues.

![Workflows settings](./img/app-settings/workflows.png)
///caption
Workflows settings page
///


----

## Governmental Hub Integration (Axis-3)

![Governmental Hub settings](./img/app-settings/axis-3.png)
///caption
Governmental Hub settings
///

This tab allows administrators to configure settings regarding the integration of the HSC Geodatahub with the Governmental Hub (Axis-3 of the Greek National Satellite Space Project). The settings include:

- **Active workflow (Ροή Παραγγελιών)**: The workflow that will be triggered when receiving an order from the Governmental Hub via API, or when a user originating from the Governmental Hub submits an order through the HSC Geodatahub interface.
- **Order data form**: This is the form that will be used to collect the necessary information for processing orders originating from the Governmental Hub. The admin can select from a list of the forms that are used in the **active workflow**. This form should have specific fields that conform to the [agreed-upon interface payload]({{env.ERM_PRODUCTION_URL}}/api/redoc/#operation/createHubOrder) between the HSC Geodatahub and the Governmental Hub, in order for the integration to work properly.


## Orders Table Configuration

This tab allows administrators to configure which form fields are displayed and available for filtering in the **Orders Management** table that HSC staff uses to view, search, and manage orders.

![Orders Table Configuration page](./img/app-settings/orders-table/page.png)
///caption
Orders Table Configuration overview
///

The configuration determines:

- Which **dynamically-defined form fields** appear as columns in the orders table
- Which fields are available as **filters** in the orders management interface
- The **display order** of both static and dynamic columns

---

### Field Selection and Filtering

At the top of the page, use the **Field Search** to locate specific fields by name, label, or form name.

![Choose fields interface](./img/app-settings/orders-table/choose-fields.png)
///caption
Field selection interface showing available form fields
///

The fields table displays:

| Column | Description |
|--------|-------------|
| **Πεδίο** (Field) | Field name/label, grouped by source form (`mname`). Shows the form source as a link. |
| **Στήλη** (Column) | Checkbox to include the field as a column in the orders table. |
| **Φίλτρο** (Filter) | Checkbox to make the field available for filtering in the orders management view. |
| **Τύποι** (Type) | Data type of the field (e.g. `number`, `text`, `rejection_code`, `radio`). |

**Toggle Dynamic Columns**: The toggle at the top-left (`Δυναμικές Στήλες Πεδίων`) enables or disables the inclusion of dynamically-defined form fields in the orders table. When disabled, only static/built-in columns are shown.

**Provider Filter**: The toggle for `Φίλτρο Παρόχου` enables filtering of the orders table by data provider.

---

### Column Ordering

Below the field selection table are three draggable sections for reorganizing the display order of columns:

![Column ordering interface](./img/app-settings/orders-table/column-order.png)
///caption
Three column sections with drag-and-drop ordering
///

**1. Σειρά βασικών στηλών (Basic Columns Order)**

These are static, built-in columns always available:

- Κωδικός Αιτήματος (Order ID)
- Κατηγορία (Category)
- Οργανισμός (Organization)
- Κατάσταση (Status)
- Ημερομηνία Δημιουργίας (Creation Date)
- Τελευταία Ενέργεια (Last Action)

Drag fields to reorder how they appear in the orders table (from left to right).

**2. Σειρά προαιρετικών στηλών (Optional Columns Order)**

Optional columns that appear based on workflow context:

- Ημερομηνία Υποβολής (Submission Date)
- Ημερομηνία Ολοκλήρωσης (Completion Date)
- Αιτόν (Requester)
- Χειριστής (Handler/Assignee)

Reorder as needed to customize the table layout.

**3. Σειρά επιλεγμένων δυναμικών στηλών (Dynamic Columns Order)**

These are form fields that were marked with the **Στήλη** checkbox in the field selection table above. Examples include:

- Επιλογή μέγιστης νεφοκάλυψης (Cloud Cover Selection)
- Επιλογή γωνίας λήψης (Off-Nadir Angle Selection)
- Μέγιστη Αποδεκτή Νεφοκάλυψη (Maximum Acceptable Cloud Cover)
- Αναγνωριστικό Δεδομένων (Data Identifier)
- Σχόλια (Comments)
- Αιτιολόγηση Προϊόντος (Product Justification)

Drag to reorder the display sequence of these dynamic columns in the orders table.

!!! info "Dynamic fields"
    Fields in the "Σειρά επιλεγμένων δυναμικών στηλών" section are automatically populated based on which fields have the **Στήλη** checkbox enabled in the field selection table. Reordering them here determines their left-to-right sequence in the actual orders table viewed by HSC staff.

---

## Saving Changes

Click the `Αποθήκευση` button at the top-right of the settings page to persist all changes to the orders table configuration. Remember: this save button applies changes from **all** active settings tabs, not just the selected one.



## Developer Note

The platform settings are represented as a singleton [`modules.app_configuration.models.AppConfiguration`](https://github.com/HellenicSpaceCenter/geodatahub-erm/blob/main/services/core/modules/app_configuration/models.py#L172) django model. The implementation is based on [django-solo](https://github.com/lazybird/django-solo)

This model is persisted as a single row in the database table `app_configuration`.