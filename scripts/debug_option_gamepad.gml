/// debug_option_gamepad(return)
/// @param {int} return
/// @returns {any}

var _return; _return = argument0;

switch (_return)
{
    // Text:
    case 0:
        return "Gamepad";

    // Confirm:
    case 2:
        input_device = DEV_GAMEPAD0;
        debug_set_next(debug_menu_gamepad);
        return true;

    // Undefined:
    default:
        return undefined;
}
