/// debug_option_gamepad1(return)
/// @param {int} return
/// @returns {any}

var _return; _return = argument0;

var gamepad_index; gamepad_index = 1;

switch (_return)
{
    // Text:
    case 0:
        return "Gamepad 1:";

    // Value:
    case 1:
        return pick_offset(gamepad_get(gamepad_index), -2, "Off", "Seeking", string(gamepad_get(gamepad_index)));

    // Undefined:
    default:
        return undefined;
}
