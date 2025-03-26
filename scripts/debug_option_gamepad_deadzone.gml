/// debug_option_gamepad_deadzone(return, [execute])
/// @param {int} return
/// @param {bool} [execute]
/// @returns {any}

var _return; _return = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var player_index; player_index = input_device - DEV_GAMEPAD0;
var config_key; config_key = "input_deadzone";

switch (_return)
{
    // Text:
    case 0:
        return "Deadzone:";

    // Value:
    case 1:
        return string(game_config_get_gamepad(player_index, config_key));

    // Update:
    case 3:
        if (in_range(game_config_get_gamepad(player_index, config_key) + menu_x_direction / 100, 0, 1))
        {
            if (_execute) game_config_set_gamepad(player_index, config_key, clamp(game_config_get_gamepad(player_index, config_key) + menu_x_direction / 100, 0, 1));
            return true;
        }

        return false;

    // Undefined:
    default:
        return undefined;
}