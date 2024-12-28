/// debug_option_save_write(return)

switch (argument0)
{
    // Text:
    case 0:
        return "Write Save";

    // Confirm:
    case 2:
        save_menu_create(0);
        return true;

    // Undefined:
    default:
        return undefined;
}
