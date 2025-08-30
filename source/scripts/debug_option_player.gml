/// debug_option_player(index, [execute], [player])
/// @param {int} index
/// @param {bool} [execute]
/// @param {int} [player]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;
var _player; if (argument_count > 2) _player = argument[2]; else _player = 0;

switch (_index)
{
    case OPTION_TEXT:
        return "Player " + string(_player) + ":";

    case OPTION_VALUE:
        if (save_get_character(_player) < CHAR_SONIC) return "None";
        else return pick(save_get_character(_player), "Sonic", "Miles", "Knuckles", "Amy", "Classic");

    case OPTION_CHANGE:
        if (_execute)
        {
            var min_index; min_index = pick(_player == 0, -1, CHAR_SONIC);
            var char_index; char_index = save_get_character(_player) + menu_x_direction;

            while (char_index == CHAR_KNUX || char_index == CHAR_AMY) char_index += menu_x_direction;
            char_index = wrap(char_index, min_index, CHAR_CLASSIC);

            save_set_character(_player, char_index);
        }
        return true;

    case OPTION_CONFIRM:
        switch (save_get_character(_player))
        {
            case CHAR_SONIC:
                if (_execute) debug_set_next(debug_menu_sonic);
                return true;

            case CHAR_MILES:
                if (_execute) debug_set_next(debug_menu_miles);
                return true;

            default:
                return false;
        }
        break;

    default:
        return undefined;
}
