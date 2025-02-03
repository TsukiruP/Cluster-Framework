/// debug_option_save_read(return)

switch (argument0)
{
    // Text:
    case 0:
        return "Read Save";

    // Confirm:
    case 2:
        save_menu_create(1);
        return true;

    // Undefined:
    default:
        return undefined;
}
