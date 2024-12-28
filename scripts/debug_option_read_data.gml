/// debug_option_read_data(return)

switch (argument0)
{
    // Text:
    case 0:
        return "Read Data";

    // Confirm:
    case 2:
        save_menu_create(1);;
        return true;

    // Undefined:
    default:
        return undefined;
}
