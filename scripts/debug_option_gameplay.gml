/// debug_option_gameplay(return)

switch (argument0)
{
    // Text:
    case 0:
        return "Gameplay";

    // Confirm:
    case 2:
        debug_set_next(debug_menu_gameplay);
        return true;

    // Undefined:
    default:
        return undefined;
}
