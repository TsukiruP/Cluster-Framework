/// debug_option_player0(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var character_index; character_index = 0;

switch (_index)
{
    case OPTION_TEXT:
        return "Player 0:";

    case OPTION_VALUE:
        return pick(save_get_character(character_index), "Sonic", "Miles", "Knuckles", "Amy", "Classic");

    case OPTION_CHANGE:
        if (_execute) save_set_character(character_index, wrap(save_get_character(character_index) + menu_x_direction, CHAR_SONIC, CHAR_CLASSIC));
        return true;

    case OPTION_CONFIRM:
        switch (save_get_character(character_index))
        {
            case CHAR_SONIC:
                if (_execute) debug_set_next(debug_menu_sonic);
                return true;

            default:
                return false;
        }
        break;

    default:
        return undefined;
}
