/// debug_option_write_data(return)

switch (argument0)
{
    // Text:
    case 0:
        return "Write Data";

    // Confirm:
    case 2:
        save_menu_create(0);;
        return true;

    // Undefined:
    default:
        return undefined;
}
