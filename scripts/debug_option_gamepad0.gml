/// debug_option_gamepad0(index)
/// @param {int} index
/// @returns {any}

var _index; _index = argument0;

var gamepad_index; gamepad_index = 0;

switch (_index)
{
    // Text:
    case 0:
        return "Gamepad 0:";

    // Value:
    case 1:
        return pick_offset(gamepad_get(gamepad_index), -2, "Off", "Seeking", string(gamepad_get(gamepad_index)));

    // Confirm:
    case 2:
        if (gamepad_get(gamepad_index) > -1)
        {
            input_device = DEV_GAMEPAD0 + gamepad_index;
            debug_set_next(debug_menu_gamepad_rebind);
            return true;
        }

        return false;

    // Undefined:
    default:
        return undefined;
}
