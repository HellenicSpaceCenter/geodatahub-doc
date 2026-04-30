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

![Form editor interface - metadata](../img/forms/editor-meta.png)
///caption
Form editor interface, displaying the metadata editing section.
///

| Metadata field | Description |
| -------------- | ----------- |
| Title          | Form title, shown in the form header and task list. |
| Header message  | Optional message shown at the top of the form, can be used to provide instructions or context to users. Supports HTML formatting. |


### Fields

![Form editor interface - fields](../img/forms/editor-fields.png)
///caption
Form editor interface, displaying the field management section.
///

The field management section allows admins to add, edit, delete and reorder form fields. Each field has a type that determines how it's rendered and what kind of input it accepts. Fields can also have custom labels and configuration options depending on their type.

#### Adding new fields
To add a new field, click the "Νέο Πεδίο" button at the bottom of the fields list. A new field will be added to the list, with empty/default values. Configure it and click "Αποθήκευση" at the top-right of the field's editor pane to save it. Until saved, the field will be marked with a "*Draft*" label.

![Form editor interface - new field](../img/forms/editor/adding-new-field.png)
///caption
Form editor interface, adding a new field.
///


#### Arranging fields

Fields are serially rendered in the order they appear in the list. To change their order, drag the field using the drag pane and drop it in the desired position. Order labels (small gray badge left of the field title) will update to reflect the new order. 

After reordering, click the "Αποθήκευση Διάταξης" button at the top-left of the form editor interface to persist changes.






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

