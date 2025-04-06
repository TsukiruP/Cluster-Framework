/// debug_option_input_left(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var input_index; input_index = INP_LEFT;

switch (_index)
{
    // Text:
    case 0:
        return input_get_name(input_index) + ":";

    // Value:
    case 1:
        return string_input(input_index, rebind_device);

    // Confirm:
    case 4:
        if (_execute) debug_set_rebind(input_index);
        return true;

    // Undefined:
    default:
        return undefined;
}