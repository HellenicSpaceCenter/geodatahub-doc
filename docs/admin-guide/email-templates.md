# Email Templating System

The **Email Templating System** (accessible via `Διαχείριση / Πρότυπα Email`) allows administrators to manage reusable email templates and content blocks used by platform notifications.

The page is split into two sections:

- **Πρότυπα Email** (Email Templates): complete email bodies (subject, message, layout)
- **Blocks**: reusable content fragments that can be inserted into templates

![Email templates page](./img/template-system/page.png)
///caption
Email templates and blocks overview page
///

Some templates are marked as **System Template**. These are built-in templates used by core platform functionality.

---

## Templates and Blocks

The editor supports dynamic placeholders and reusable blocks:

- For **variables**, use the syntax: <code>&#123;&#123;variableName&#125;&#125;</code>
- For **blocks**, use the syntax: <code>&#123;&#123;% blockName %&#125;&#125;</code>

In practice, variables such as <code>&#123;&#123;subject&#125;&#125;</code>, <code>&#123;&#123;message&#125;&#125;</code>, and <code>&#123;&#123;datetime&#125;&#125;</code> are resolved at runtime when the email is rendered and sent.


For blocks, the easiest way to insert them is through the editor toolbar's **Blocks** button, which opens a dialog to select from existing blocks (see below on [Inserting a Block in a Template](#inserting-a-block-in-a-template)).


---

## Creating a New Email Template

Click `+ Νέο` in the **Πρότυπα Email** panel to open the new template dialog.

![New email template dialog](./img/template-system/new-template-dialog.png)
///caption
Dialog for creating a new email template
///

In this dialog:

- Set the template **name** (`Όνομα`)
- Write template content in the rich text editor
- Use the toolbar for formatting and inserting links/images
- Click `Αποθήκευση` to persist the new template

---

## Editing an Email Template

Selecting a template opens the full editor page for that template.

![Edit email template](./img/template-system/edit-template.png)
///caption
Template editor page for an email template
///

From this page, administrators can:

- Update the template identifier/name
- Edit the email body in the rich text editor
- Insert variables and blocks
- Save changes using the top-right `Αποθήκευση` button

Unsaved changes are indicated near the save button (`*Μη αποθηκευμένες αλλαγές`).

---

## Inserting a Block in a Template

Use the **Blocks** button in the editor toolbar to insert a reusable block into the current template.

![Select template block dialog](./img/template-system/insert-block-dialog.png)
///caption
Dialog for selecting and inserting a reusable block
///

Workflow:

- Click **Blocks** in the toolbar
- Select a block (e.g. `footer`, `title`)
- Click `Insert`

The selected block is inserted as a block placeholder, which resolves to the block's current content at render time.

---

## Editing a Block

Selecting a block from the **Blocks** panel opens the block editor.

![Edit block](./img/template-system/edit-block.png)
///caption
Editor page for a reusable template block
///

In block editing mode:

- Update the block identifier (`Αναγνωριστικό`)
- Edit the block content in the rich text editor
- Save changes with `Αποθήκευση`
- Delete the block using `Διαγραφή` (bottom-right), if it is no longer needed

Because blocks are reusable, changes to a block affect all templates where that block is referenced.
