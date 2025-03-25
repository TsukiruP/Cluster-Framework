/// debug_option_keyboard_right(return)
/// @param {int} return
/// @returns {any}

var _return; _return = argument0;

var input_index; input_index = INP_RIGHT;

switch (_return)
{
    // Text:
    case 0:
        return "Right:";

    // Value:
    case 1:
        return string_input(input_index, DEV_KEYBOARD);

    // Confirm:
    case 2:
        debug_input_rebind(input_index, DEV_KEYBOARD);
        return true;

    // Undefined:
    default:
        return undefined;
}
