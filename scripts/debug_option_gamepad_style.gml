/// debug_option_gamepad_style(return, [execute])
/// @param {int} return
/// @param {bool} [execute]
/// @returns {any}

var _return; _return = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var player_index; player_index = input_device - DEV_GAMEPAD0;
var config_key; config_key = "input_style";

switch (_return)
{
    // Text:
    case 0:
        return "Style:";

    // Value:
    case 1:
        return string(game_config_get_gamepad(player_index, config_key))

    // Update:
    case 3:
        if (_execute) game_config_set_gamepad(player_index, config_key, wrap(game_config_get_gamepad(player_index, config_key) + menu_x_direction, 0, 2));
        return true;

    // Undefined:
    default:
        return undefined;
}