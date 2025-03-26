/// debug_option_gamepad(index, [event])
/// @param {int} index
/// @param {bool} [event]
/// @returns {any}

var _index; _index = argument[0];
var _event; if (argument_count > 1) _event = argument[1]; else _event = true;

switch (_index)
{
    // Text:
    case 0:
        return "Gamepad";

    // Confirm:
    case 4:
        if (_event)
        {
            rebind_device = DEV_GAMEPAD0;
            debug_set_next(debug_menu_gamepad);
        }

        return true;

    // Undefined:
    default:
        return undefined;
}