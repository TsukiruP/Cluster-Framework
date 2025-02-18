/// debug_option_player0(return)

var character_index; character_index = 0;

switch (argument0)
{
    // Text:
    case 0:
        return "Player 0:";

    // Value:
    case 1:
        return pick(game_save_get_character(character_index), "Sonic", "Miles", "Knuckles", "Amy", "Classic");

    // Confirm:
    case 2:
        switch (game_save_get_character(character_index))
        {
            // Sonic:
            case CHAR_SONIC:
                debug_set_next(debug_menu_sonic);
                return true;

            // Default:
            default:
                return false;
        }
        break;

    // Update:
    case 3:
        game_save_set_character(character_index, wrap(game_save_get_character(character_index) + menu_x_direction, CHAR_SONIC, CHAR_CLASSIC));
        return true;

    // Undefined:
    default:
        return undefined;
}