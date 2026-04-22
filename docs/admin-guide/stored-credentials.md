# Stored Credentials

!!! info "Credentials"
    Stored credentials are used for accessing protected resources through webhook nodes in a workflow.

The **Stored Credentials** page (accessible via `Διαχείριση / Διαπιστευτήρια`) is used to create, maintain, and monitor credentials that are consumed by workflow nodes and external integrations.

![Stored credentials page](./img/stored-credentials/page.png)
///caption
Stored credentials management page
///

The page includes:

- A `+ Νέο Διαπιστευτήριο` button for creating a new credential
- Filter controls for **Τύπος** (type) and **Κατάσταση** (status)
- A credentials table with key metadata and usage information

---

## Credentials List and Filters

The credentials table contains the following columns:

| Column | Description |
|--------|-------------|
| **Όνομα** | Credential display name used for identification. |
| **Τύπος** | Authentication type (e.g. API Key, Basic Auth, OAuth2). |
| **Κατάσταση** | Current status (e.g. active). |
| **Περιγραφή** | Optional short description of the credential purpose. |
| **Χρήσεις** | Number of references/usages across the system. |
| **Τελευταία Χρήση** | Timestamp of the last time the credential was used. |
| **Ενέργειες** | Row actions menu (edit, test, delete). |

Use the filters at the top of the list to narrow down results by type or status. Use `Καθαρισμός` to reset filters and `Ανανέωση` to refresh the list.

---

## Creating a New Credential

Click `+ Νέο Διαπιστευτήριο` to open the creation form.

![New credential form](./img/stored-credentials/new-credential-form.png)
///caption
Form for creating a new credential
///

Base fields in the form:

| Field | Description |
|-------|-------------|
| **Όνομα** *(required)* | A unique, recognizable credential name. |
| **Περιγραφή** | Optional description of where/how the credential is used. |
| **Τύπος** *(required)* | Credential/authentication scheme. Changing this updates the fields shown below. |

After selecting a type, type-specific fields appear.

### Supported Credential Types

There are **3 supported credential types**, each with its own settings:

| Credential Type | Settings |
|-----------------|----------|
| **OAuth2 Client Credentials** | **Client ID**, **Client Secret**, **Token Endpoint URL**, **Scopes** |
| **Basic Auth** | **Username**, **Password** |
| **API Key** | **API Key** |

### API Key Fields

When `Τύπος = API Key`, the form includes:

| Field | Description |
|-------|-------------|
| **API Key** | Secret API key value used for authentication. |

### Basic Auth Fields

![Basic Auth fields](./img/stored-credentials/basic-auth-form.png)
///caption
Type-specific fields for Basic Auth credentials
///

When `Τύπος = Basic Auth`, the form includes:

| Field | Description |
|-------|-------------|
| **Username** | Username part of the Basic Authentication pair. |
| **Password** | Password part of the Basic Authentication pair. |

### OAuth2 Client Credentials Fields

![OAuth2 fields](./img/stored-credentials/oauth2-form.png)
///caption
Type-specific fields for OAuth2 Client Credentials
///

When `Τύπος = OAuth2 Client Credentials`, the form includes:

| Field | Description |
|-------|-------------|
| **Client ID** | OAuth2 client identifier. |
| **Client Secret** | OAuth2 client secret. |
| **Token Endpoint URL** | URL used to obtain access tokens. |
| **Scopes** | Requested OAuth2 scopes (comma-separated). |

Click `Δημιουργία` to save the credential, or `Ακύρωση` to dismiss the form without saving.

---

## Credential Row Actions

Each row provides an actions menu from the `Ενέργειες` column.

![Credential row actions](./img/stored-credentials/credential-row-actions.png)
///caption
Per-credential actions menu
///

Available actions:

- `Επεξεργασία`: Open the credential in edit mode
- `Δοκιμή`: Test credential validity/connectivity
- `Διαγραφή`: Remove the credential

!!! warning "Delete with caution"
    Deleting a credential that is still referenced by workflow nodes or integrations may break authentication-dependent operations.

---

## Editing an Existing Credential

Selecting `Επεξεργασία` opens the edit form.

![Edit credential form](./img/stored-credentials/edit-form.png)
///caption
Credential edit form
///

In edit mode, administrators can update:

- Name and description
- Credential type and corresponding secret/configuration fields
- OAuth2 settings such as token endpoint and scopes (when applicable)

Click `Ενημέρωση` to save changes or `Ακύρωση` to discard them.