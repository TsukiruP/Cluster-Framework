/// debug_option_config(return)

switch (argument0)
{
    // Text:
    case 0:
        return "Config";

    // Confirm:
    case 2:
        debug_set_next(debug_menu_config);
        return true;

    // Undefined:
    default:
        return undefined;
}
