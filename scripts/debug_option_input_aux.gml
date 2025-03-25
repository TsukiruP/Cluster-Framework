/// debug_option_input_aux(return)
/// @param {int} return
/// @returns {any}

var _return; _return = argument0;

var input_index; input_index = INP_AUX;

switch (_return)
{
    // Text:
    case 0:
        return input_get_name(input_index) + ":";

    // Value:
    case 1:
        return string_input(input_index, input_device);

    // Confirm:
    case 2:
        debug_set_rebind(input_index);
        return true;

    // Undefined:
    default:
        return undefined;
}
