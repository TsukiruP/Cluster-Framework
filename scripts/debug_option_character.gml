/// debug_option_character(return)

switch (argument0)
{
    // Text:
    case 0:
        return "Character Debug";

    // Confirm:
    case 2:
        debug_set_next(debug_menu_character);
        return true;

    // Undefined:
    default:
        return undefined;
}