/// debug_option_input_right(index, [event])
/// @param {int} index
/// @param {bool} [event]
/// @returns {any}

var _index; _index = argument[0];
var _event; if (argument_count > 1) _event = argument[1]; else _event = true;

var input_index; input_index = INP_RIGHT;

switch (_index)
{
    // Text:
    case 0:
        return input_get_name(input_index) + ":";

    // Value:
    case 1:
        return string_input(input_index, input_device);

    // Confirm:
    case 2:
        if (_event) debug_set_rebind(input_index);
        return true;

    // Undefined:
    default:
        return undefined;
}
