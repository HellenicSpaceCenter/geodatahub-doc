# Satellite Data Providers

The **Satellite Data Providers** page (accessible via `Διαχείριση / Πάροχοι Δεδομένων`) lets administrators manage the upstream satellite imagery providers registered in the system. Each provider groups a set of **data products** (satellite sensors or imaging modes).

These providers and data products are then available to users when selecting the data they want to order in the order submission form, and throughout the system, wherever the data provider/product information is used.

![Data providers page](./img/data-providers-page.png)
///caption
Data providers administration page
///

The page displays all registered providers as a card grid. Each card shows:

- The provider's **thumbnail** (logo)
- The provider's **name** and **internal identifier** (slug)
- The **date** the provider was added
- The number of **data products** associated with the provider, along with a summary list of product names
- A **Διαχείριση** (Manage) link that opens the data products management dialog for that provider

To add a new provider, click the `+ Προσθήκη` button at the top-right of the page.

---

## Editing a Provider

![Provider card with edit button](./img/provider-card-with-edit-btn.png)
///caption
Data provider card with edit button on the top-right
///

Each provider card has an **edit button** (pencil icon) at the top-right corner. Clicking it opens the provider edit form.

![Provider edit form](./img/provider-edit-form.png)
///caption
Provider edit form
///

The edit form contains the following fields:

| Field | Description |
|-------|-------------|
| **Όνομα** (Name) | The display name of the provider. |
| **Ενεργός** (Active) | Toggle to enable or disable the provider. Inactive providers are not shown to users. |
| **Κλειδί AXIS-3 Run Product** | The key used for integration with the AXIS-3 harvester. This key is required when submitting an ingestion request to the harvester, to let it know the type of product to expect. |
| **Περιγραφή** (Description) | An optional short description of the data provider. |
| **Μικρογραφία** (Thumbnail) | An image file upload for the provider's logo, displayed on the provider card. |

Click `Ενημέρωση Παρόχου` to save changes, or `Ακύρωση` to discard them.

---

## Managing Data Products

![Provider data products edit menu](./img/provider-edit-products.png)
///caption
Data products management dialog for a provider
///

Clicking **Διαχείριση** on a provider card opens the **Manage Data Products** dialog. This dialog lists all data products associated with the provider in a table with the following columns:

| Column | Description |
|--------|-------------|
| **Name** | The display name of the data product (e.g. *Spotlight*, *Stripmap*). |
| **Type** | The sensor/imaging type (e.g. `sar`, `optical`). |
| **Resolution** | The nominal resolution of the product in meters. |
| **Enabled** | A toggle to enable or disable the product. Disabled products are not available for selection in orders. |
| **Actions** | Edit (pencil) or delete (trash) the product entry. |

### Adding a New Data Product

![Form to add a new data product to a provider](./img/provider-add-data-product.png)
///caption
Add New Data Product form
///

Click the `+ Add Product` button in the Manage Data Products dialog to open the **Add New Data Product** form. Fill in the following fields:

| Field | Description |
|-------|-------------|
| **Name** *(required)* | The display name of the data product. |
| **Identifier** | A unique machine-readable slug for the product (e.g. `sentinel-2`). |
| **Resolution (meters)** | The nominal spatial resolution of the product in meters. |
| **Type** | The sensor type of the product (e.g. SAR, optical). |
| **Enabled** | Whether the product is immediately available to users upon creation. |

Click `Add Product` to save, or `Cancel` to discard.