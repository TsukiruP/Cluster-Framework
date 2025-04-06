/// debug_option_keyboard_swap(index)
/// @param {int} index
/// @returns {any}

var _index; _index = argument0;

var input_index; input_index = INP_SWAP;

switch (_index)
{
    case OPTION_TEXT:
        return "Swap:";

    case OPTION_VALUE:
        return string_input(input_index, DEV_KEYBOARD);

    // Confirm:
    case 2:
        debug_input_rebind(input_index, DEV_KEYBOARD);
        return true;

    default:
        return undefined;
}
