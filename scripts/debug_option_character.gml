/// debug_option_character(data)

switch (argument0)
{
    // Text:
    case 0:
        return "Character Debug";

    // Confirm:
    case 2:
        debug_menu_set_next(debug_list_character);
        break;

    // Undefined:
    default:
        return undefined;
}
