/// debug_option_gamepad_confirm(index, [event])
/// @param {int} index
/// @param {bool} [event]
/// @returns {any}

var _index; _index = argument[0];
var _event; if (argument_count > 1) _event = argument[1]; else _event = true;

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
        if (_event)
        {
            game_config_set_gamepad(player_index, config_key, wrap(game_config_get_gamepad(player_index, config_key) + menu_x_direction, 0, 1));
            game_config_set_confirm(player_index);
        }

        return true;

    // Undefined:
    default:
        return undefined;
}