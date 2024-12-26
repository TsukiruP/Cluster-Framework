/// debug_option_character_debug(phase)

switch (argument0)
{
    // Text:
    case 0:
        return "Character Debug";

    // Confirm:
    case 2:
        debug_set_next(debug_list_character);
        break;

    // Default:
    default:
        return undefined;
}
