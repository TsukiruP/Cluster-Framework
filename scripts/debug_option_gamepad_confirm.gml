/// debug_option_gamepad_confirm(return)
/// @param {int} return
/// @returns {any}

var _return; _return = argument0;

var player_index; player_index = input_device - DEV_GAMEPAD0;
var config_key; config_key = "input_confirm";

switch (_return)
{
    // Text:
    case 0:
        return "Confirm:";

    // Value:
    case 1:
        return string_input(INP_CONFIRM, input_device);

    // Update:
    case 3:
        game_config_set_gamepad(player_index, config_key, wrap(game_config_get_gamepad(player_index, config_key) + menu_x_direction, 0, 1));
        game_config_set_confirm(player_index);
        return true;

    // Undefined:
    default:
        return undefined;
}
