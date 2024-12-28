/// debug_option_save_delete(return)

switch (argument0)
{
    // Text:
    case 0:
        return "Delete Save";

    // Confirm:
    case 2:
        save_menu_create(2);
        return true;

    // Undefined:
    default:
        return undefined;
}
