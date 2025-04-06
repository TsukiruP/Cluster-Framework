/// debug_option_player0(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var character_index; character_index = 0;

switch (_index)
{
    // Text:
    case 0:
        return "Player 0:";

    // Value:
    case 1:
        return pick(game_save_get_character(character_index), "Sonic", "Miles", "Knuckles", "Amy", "Classic");

    // Change:
    case 3:
        if (_execute) game_save_set_character(character_index, wrap(game_save_get_character(character_index) + menu_x_direction, CHAR_SONIC, CHAR_CLASSIC));
        return true;

    // Confirm:
    case 4:
        switch (game_save_get_character(character_index))
        {
            case CHAR_SONIC:
                if (_execute) debug_set_next(debug_menu_sonic);
                return true;

            default:
                return false;
        }
        break;

    // Undefined:
    default:
        return undefined;
}