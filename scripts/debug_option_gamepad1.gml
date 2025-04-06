/// debug_option_gamepad1(index)
/// @param {int} index
/// @returns {any}

var _index; _index = argument0;

var gamepad_index; gamepad_index = 1;

switch (_index)
{
    case OPTION_TEXT:
        return "Gamepad 1:";

    case OPTION_VALUE:
        return pick_offset(gamepad_get(gamepad_index), -2, "Off", "Seeking", string(gamepad_get(gamepad_index)));

    default:
        return undefined;
}
