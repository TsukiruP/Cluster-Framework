/// debug_option_input_super(return, [execute])
/// @param {int} return
/// @param {bool} [execute]
/// @returns {any}

var _return; _return = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var input_index; input_index = INP_SUPER;

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
        if (_execute) debug_set_rebind(input_index);
        return true;

    // Undefined:
    default:
        return undefined;
}