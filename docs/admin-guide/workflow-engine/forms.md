# Forms Reference Guide

This guide documents how Forms work in the platform and provides a full reference of all available FormField types.

## Overview

A workflow node of type `form` links to a Form (`content = form mname`).
Each Form contains ordered FormFields that are rendered to end users and persisted as `ApplicationData` values.

High-level flow:

1. Admin defines form fields and sequencing.
2. Runtime renders fields in sequence (excluding control-only field types).
3. User submits values for the current form node.
4. Backend writes/updates `ApplicationData` records.
5. Workflow proceeds if progression rules pass.

!!! note
    Multiple nodes can reference the same Form, allowing for reuse. While this is supported, it's generally recommended to create separate Forms for each node to allow for independent configuration and evolution.

## Form editor interface

The form editor interface allows admins edit a form's metadata (title, header message) and manage its fields. The field editor supports all field types and their configuration options.

### Metadata

![Form editor interface - metadata](../img/forms/editor/meta-section.png)
///caption
Form editor interface, displaying the metadata editing section.
///

| Metadata field | Description |
| -------------- | ----------- |
| Title          | Form title, shown in the form header and task list. |
| Header message  | Optional message shown at the top of the form, can be used to provide instructions or context to users. Supports HTML formatting. |


### Fields

![Form editor interface - fields](../img/forms/editor/fields-section.png)
///caption
Form editor interface, displaying the field management section.
///

The field management section allows admins to add, edit, delete and reorder form fields. Each field has a type that determines how it's rendered and what kind of input it accepts. Fields can also have custom labels and configuration options depending on their type.

#### <i data-lucide="plus" class="icon-small"></i> Adding new fields
To add a new field, click the "Νέο Πεδίο" button at the bottom of the fields list. A new field will be added to the list, with empty/default values. Configure it and click "Αποθήκευση" at the top-right of the field's editor pane to save it. Until saved, the field will be marked with a "*Draft*" label.

![Form editor interface - new field](../img/forms/editor/adding-new-field.png)
///caption
Form editor interface, adding a new field.
///


#### <i data-lucide="list-ordered" class="icon-small"></i>  Arranging fields

Fields are serially rendered in the order they appear in the list. To change their order, drag the field using the drag pane and drop it in the desired position. Order labels (small gray badge left of the field title) will update to reflect the new order. 

After reordering, click the "Αποθήκευση Διάταξης" button at the top-left of the form editor interface to persist changes.

#### <i data-lucide="edit" class="icon-small"></i>  Editing fields

When adding a new field or editing an existing one, the field editor pane is used. The available configuration settings depend on the field type, but common settings include:

| Configuration option | Label | Description |
| -------------------- | ----- | ----------- |
| Identifier           | Αναγνωριστικό | A unique string identifier for the field, used as the key for storing its value in `ApplicationData`. In the database, this is saved in `FormField.name`. |
| Label                | Τίτλος | The field's label shown to users. |
| Description          | Περιγραφή | Optional additional text shown below the field to provide more context or instructions. Supports HTML formatting. |
| Required             | Υποχρεωτικό | If enabled, users must provide a value for this field before submitting the form. If the field *is not rendered* (see below) this is not enforced. |
| Field type           | Τύπος πεδίου | Determines how the field is rendered and what kind of input it accepts. See the reference table below for all available types. |
| Include in exports | Να συμπεριληφθεί στην εξαγωγή | If enabled, this field's value will be included in application data exports (e.g. XLSX export of applications). |
| Access control | Περιορισμένη πρόσβαση | If enabled, this field's value will only be visible to users with specific role or group. Multiple rules can be combined. |
| Conditional rendering | Εμφάνιση υπό συνθήκη | If enabled, this field will only be rendered if specific conditions are met. Conditions can check values of other fields in the same or in another form, allowing for dynamic and context-sensitive forms. **Caution**: as forms are **not** tightly coupled with workflows, it is the administrator's responsibility to ensure that a form referenced here is: 1. included in the same workflow, 2. Rendered in a previous step. |


## Form field types reference

| Type Key          | Label                       | Typical value format                 | Runtime status     |
| ----------------- | --------------------------- | ------------------------------------ | ------------------ |
| `string`          | Αλφαριθμητικό               | string                               | Rendered           |
| `text`            | Κείμενο                     | string                               | Rendered           |
| `attachment`      | Συνημμένο                   | JSON array of uploaded file metadata | Rendered           |
| `map`             | Χάρτης                      | GeoJSON feature/geometry JSON string | Rendered           |
| `stac_items`      | Αντικείμενα STAC            | JSON array of STAC item URLs         | Rendered           |
| `data_provider`   | Πάροχος Δεδομένων           | provider identifier string           | Rendered           |
| `data_product`    | Προϊόν Δεδομένων            | product identifier string            | Rendered           |
| `boolean`         | Δυαδική Επιλογή (Boolean)   | `"true"` or `"false"`                | Rendered           |
| `radio`           | Μοναδική Επιλογή (radio)    | selected option value string         | Rendered           |
| `select`          | Μοναδική Επιλογή (dropdown) | selected option value string         | Rendered           |
| `checkbox`        | Πολλαπλή Επιλογή (checkbox) | JSON array string of selected values | Rendered           |
| `number`          | Αριθμός                     | numeric string/number                | Rendered           |
| `number_range`    | Αριθμητικό εύρος            | JSON array string, e.g. `[10,50]`    | Rendered           |
| `date`            | Ημερομηνία                  | ISO datetime/date string             | Rendered           |
| `datetime`        | Ημερομηνία και Ώρα          | UTC ISO datetime string              | Rendered           |
| `conditional`     | Αρχή δομής ελέγχου          | control marker                       | Control-only       |
| `end-conditional` | Τέλος δομής ελέγχου         | control marker                       | Control-only       |
| `email`           | Email                       | string (email format)                | Available in model |
| `rejection_code`  | Κωδικός Απόρριψης           | rejection code string                | Rendered           |

### Notes on special/runtime-only behavior

- `map` and `stac_items` are geometry-capable field types (`geometry_types`).
- `rejection_code` may also update `Application.rejection_code` on write.
- `conditional` and `end-conditional` are editor/runtime control helpers and are filtered out of visible field inputs.



## Field type settings

Some field types have additional configuration options that can/must be set in the field editor. 

### Unique choice (`radio`, `select`)

![Form editor interface - unique choice options](../img/forms/fields/radio-options.png)
///caption
Options editor for a `radio` field type. Identical interface is used for `select` field types.
///


These field types require a predefined set of options. Each option consists of a label (shown to users) and a value (stored in the database). To add a new option, click the "Add option" button and fill in the label and value. Click on the "x" button at the right of an option to delete it.


### String

![Form editor interface - string field](../img/forms/fields/string-validation.png)
///caption
Validation rules for a `string` field type.
///

String fields can have additional validation rules to enforce specific formats or constraints on user input. Validation is performed in the frontend at the time of input, before form submission. The settings allow the admin to define a regex pattern that the input must match in order to be considered valid, and an error message that will be shown to users if their input does not match the pattern.

Validation rules are configured via a Javascript regular expression pattern. You can use [regexr](https://regexr.com/) to create and test your regex patterns. Some examples of common regex patterns:

| Validation rule | Regex pattern | Description |
| --------------- | ------------- | ----------- |
| Email format | `^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$` | Validates that the input is in a valid email format. |
| Numeric only | `^\d+$` | Validates that the input contains only digits. |
| Minimum length | `^.{10,}$` | Validates that the input is at least 10 characters long. |
| Alphanumeric | `^[a-zA-Z0-9]+$` | Validates that the input contains only letters and numbers. |
| Alphabetic | `^[a-zA-Z]+$` | Validates that the input contains only letters. |


### Attachment

![Form editor interface - attachment field](../img/forms/fields/attachment-settings.png)
///caption
Settings for an `attachment` field type.
///

Attachment fields allow users to upload files as part of their form submission. The field editor provides settings to restrict the types of files that can be uploaded and the maximum file size allowed.

### Map

Map type fields have a setting to control whether the user can edit the field's value (by uploading a GeoJSON) or if it's read-only and only renders a GeoJSON value set by a previous workflow step. This allows for use cases where a user needs to review a geometry (e.g. an AOI) defined in a previous step without being able to modify it.

### Data Provider 

![Form editor interface - data provider field](../img/forms/fields/data-provider-settings.png)
///caption
Settings for a `data_provider` field type.
///

Data provider fields display a selection of [Data Providers](../data-providers.md) and have optional settings to filter the selectable providers by:

- **Sensor type**: the setting value is another field in the same form that is expected to contain a sensor type string (e.g. "optical", "thermal", "sar"). Only providers that offer products with that sensor type would be displayed in the list.
- **Product resolution**: the setting value is another field in the same form that is expected to contain a string value representing the desired product resolution (e.g. "high", "very_high", etc). Only providers that offer products with that resolution or better would be displayed in the list.


### Data Product

![Form editor interface - data product field](../img/forms/fields/data-product-settings.png)
///caption
Settings for a `data_product` field type.
///

Data product fields have optional settings to filter the selectable products by:

- **Data provider**: the setting value is another field in the same form that is expected to contain a data provider identifier. This allows for dynamic filtering of selectable products based on the selected data provider in another field. For example, a user could select a data provider in a dropdown field, and the data product field would then only show products from that provider.
- **Product type**: the setting value is another field in the same form that is expected to contain a product type string (e.g. "optical", "thermal", "sar"). 
- **Product resolution**: the setting value is another field in the same form that is expected to contain a numeric value representing the desired product resolution in meters. The data product field would then only show products that have that resolution or better.


### Number & Number range

![Form editor interface - number field](../img/forms/fields/number-settings.png)
///caption
Settings for a `number` field type.
///


`Number` and `number_range` fields have the following additional configuration options:

| Configuration option | Label | Description |
| -------------------- | ----- | ----------- |
| Default value | Προεπιλεγμένη τιμή | An optional default numeric value for the field. This value will be pre-filled when the form is rendered, but users can change it before submitting the form. |
| Units | Μονάδες Μέτρησης | An optional string to indicate the units of the number (e.g. "meters", "degrees", etc). This is for display purposes only and does not affect validation or storage. |

Number fields can also have validation rules to enforce minimum and maximum values. These rules are applied at the time of input, before form submission. The configuration options for validation rules are:

| Configuration option | Label | Description |
| -------------------- | ----- | ----------- |
| Apply validation rules | Εφαρμογή κανόνων επαλήθευσης | If enabled, min/max validation rules will be applied to the field. |
| Min | Minimum size | If validation rules are applied, this sets the minimum value that users can enter. |
| Max | Maximum size | If validation rules are applied, this sets the maximum value that users can enter. |
|