/// debug_option_player1(return)
/// @param {any} return
/// @returns {any}

var _return; _return = argument0;

var character_index; character_index = 1;

switch (_return)
{
    // Text:
    case 0:
        return "Player 1:";

    // Value:
    case 1:
        return pick_offset(game_save_get_character(character_index), -1, "None", "Sonic", "Miles", "Knuckles", "Amy", "Classic");

    // Confirm:
    case 2:
        switch (game_save_get_character(character_index))
        {
            case CHAR_SONIC:
                debug_set_next(debug_menu_sonic);
                return true;

            default:
                return false;
        }
        break;

    // Update:
    case 3:
        game_save_set_character(character_index, wrap(game_save_get_character(character_index) + menu_x_direction, -1, CHAR_CLASSIC));
        return true;

    // Undefined:
    default:
        return undefined;
}