# User Management

Administrators can manage platform users via the ['Διαχείριση/Χρήστες']({{env.ERM_PRODUCTION_URL}}/admin/edit/users) page. This page allows administrators to view, edit, and manage user accounts, including their roles.

![User management page](../img/user-management-page.png)
///caption
User management page
///

The page displays a list of all users, along with their details such as username, email, and assigned role. The list can be filtered by name/email/tax number, verification status, role, active status and GSIS account status.

To add a new user to the platform, click on the 'Νέος χρήστης' button. This will open a form where you can enter the new user's details.

![New user form](../img/add-user-form.png)
///caption
New user form
///

The 'Επαληθευμένος' field indicates whether the user is verified by the admin. If disabled, the user will not be able to login, and will be notified that their account is pending an approval by the administrator.


---- 

### Modifying User Details

Each user in the users table has an actions menu (...) that allows administrators to:

| Action | Description |
|--------|-------------|
| Edit user details (*Επεξεργασία*) | Modify the user's information, including their role |
| Reset password (*Επαναφορά κωδικού*) | Send the user an email with instructions on how to reset their password |
| Delete user (*Διαγραφή*) | Remove the user from the platform |
  

![User actions menu](../img/user-actions-menu.png)
///caption
User actions menu
///

To edit a user's details, click on the 'Επεξεργασία' option in the actions menu. This will open a form where you can modify the user's information, including their role. This form is identical to the new user form, but with the fields pre-filled with the user's current details.