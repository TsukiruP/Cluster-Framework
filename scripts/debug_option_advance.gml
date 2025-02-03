/// debug_option_advance(return)

switch (argument0)
{
    // Text:
    case 0:
        return "Advance";

    // Confirm:
    case 2:
        debug_set_next(debug_menu_advance);
        return true;

    // Undefined:
    default:
        return undefined;
}
