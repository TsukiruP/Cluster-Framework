/// debug_option_gamepad_style(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var player_index; player_index = rebind_device - DEV_GAMEPAD0;
var config_key; config_key = "input_style";

switch (_index)
{
    case OPTION_TEXT:
        return "Style:";

    case OPTION_VALUE:
        return string(game_config_get_gamepad(player_index, config_key))

    case OPTION_CHANGE:
        if (_execute) game_config_set_gamepad(player_index, config_key, wrap(game_config_get_gamepad(player_index, config_key) + menu_x_direction, 0, 2));
        return true;

    default:
        return undefined;
}