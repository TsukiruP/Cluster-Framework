/// debug_option_interface(return)

switch (argument0)
{
    // Text:
    case 0:
        return "Interface";

    // Confirm:
    case 2:
        debug_set_next(debug_menu_interface);
        return true;

    // Undefined:
    default:
        return undefined;
}
