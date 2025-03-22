/// debug_option_keyboard_cancel(return)
/// @param {any} return
/// @returns {any}

var _return; _return = argument0;

var input_index; input_index = INP_CANCEL;

switch (_return)
{
    // Text:
    case 0:
        return "Cancel:";

    // Value:
    case 1:
        return string_input(input_index, DEV_KEYBOARD);

    // Confirm:
    case 2:
        menu_alarm = 15;
        input_device = DEV_KEYBOARD;
        input_rebind = input_index;
        return true;

    // Undefined:
    default:
        return undefined;
}
