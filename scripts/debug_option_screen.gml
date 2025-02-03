/// debug_option_screen()

switch (argument0)
{
    // Text:
    case 0:
        return "Screen";

    // Confirm:
    case 2:
        debug_set_next(debug_menu_screen);
        return true;

    // Undefined:
    default:
        return undefined;
}
