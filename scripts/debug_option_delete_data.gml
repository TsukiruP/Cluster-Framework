/// debug_option_delete_data(return)

switch (argument0)
{
    // Text:
    case 0:
        return "Delete Data";

    // Confirm:
    case 2:
        save_menu_create(2);;
        return true;

    // Undefined:
    default:
        return undefined;
}
