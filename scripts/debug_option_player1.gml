/// debug_option_player1(index, [event])
/// @param {int} index
/// @param {bool} [event]
/// @returns {any}

var _index; _index = argument[0];
var _event; if (argument_count > 1) _event = argument[1]; else _event = true;

var character_index; character_index = 1;

switch (_index)
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
                if (_event) debug_set_next(debug_menu_sonic);
                return true;

            default:
                return false;
        }
        break;

    // Update:
    case 3:
        if (_event) game_save_set_character(character_index, wrap(game_save_get_character(character_index) + menu_x_direction, -1, CHAR_CLASSIC));
        return true;

    // Undefined:
    default:
        return undefined;
}
