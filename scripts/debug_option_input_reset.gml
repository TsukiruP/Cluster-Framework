/// debug_option_input_reset(return)
/// @param {int} return
/// @returns {any}

var _return; _return = argument0;

switch (_return)
{
    // Text:
    case 0:
        return "Reset";

    // Confirm:
    case 2:
        if (input_device == DEV_KEYBOARD) game_config_reset_key();
        else game_config_reset_gamepad(input_device - DEV_GAMEPAD0);
        return true;

    // Undefined:
    default:
        return undefined;
}
