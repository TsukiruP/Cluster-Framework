/// debug_option_gamepad_confirm(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var player_index; player_index = rebind_device - DEV_GAMEPAD0;
var config_key; config_key = "input_confirm";

switch (_index)
{
    // Text:
    case 0:
        return "Confirm:";

    // Value:
    case 1:
        return string_input(INP_CONFIRM, rebind_device);

    // Change:
    case 3:
        if (_execute)
        {
            game_config_set_gamepad(player_index, config_key, wrap(game_config_get_gamepad(player_index, config_key) + menu_x_direction, 0, 1));
            game_config_set_confirm(player_index);
        }

        return true;

    // Undefined:
    default:
        return undefined;
}