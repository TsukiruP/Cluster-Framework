/// debug_menu_option_character_debug(phase)

switch (argument0)
{
    // Text:
    case 0:
        return "Character Debug";

    // Confirm:
    case 2:
        debug_menu_set_list(1);
        break;

    // Default:
    default:
        return undefined;
}
