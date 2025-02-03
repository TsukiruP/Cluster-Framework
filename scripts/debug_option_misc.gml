/// debug_option_misc(return)

switch (argument0)
{
    // Text:
    case 0:
        return "Misc.";

    // Confirm:
    case 2:
        debug_set_next(debug_menu_misc);
        return true;

    // Undefined:
    default:
        return undefined;
}
