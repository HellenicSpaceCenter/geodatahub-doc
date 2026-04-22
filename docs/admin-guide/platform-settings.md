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