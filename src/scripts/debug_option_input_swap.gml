/// debug_option_input_swap(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var input_index; input_index = INP_SWAP;

switch (_index)
{
    case OPTION_TEXT:
        return input_get_name(input_index) + ":";

    case OPTION_VALUE:
        return string_input(input_index, rebind_device);

    case OPTION_CONFIRM:
        if (_execute)
        {
            if (input_get_check(INP_CONFIRM, CHECK_HELD, rebind_device)) debug_set_rebind(input_index);
            else return false;
        }

        return true;

    default:
        return undefined;
}