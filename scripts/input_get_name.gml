/// input_get_name(input)
/// @desc Returns a string depending on the input.
/// @param {int} input
/// @returns {string}

var _input; _input = argument0;

switch (_input)
{
    case INP_UP:
        return "Up";

    case INP_DOWN:
        return "Down";

    case INP_LEFT:
        return "Left";

    case INP_RIGHT:
        return "Right";

    case INP_JUMP:
        return "Jump";

    case INP_AUX:
        return "Aux";

    case INP_SWAP:
        return "Swap";

    case INP_SUPER:
        return "Super";

    case INP_TAG:
        return "Tag";

    case INP_ALT:
        return "Alt";

    case INP_START:
        return "Start";

    case INP_SELECT:
        return "Select";

    case INP_CONFIRM:
        return "Confirm";

    case INP_CANCEL:
        return "Cancel";

    case INP_LOG:
        return "Log";

    case INP_HIDE:
        return "Hide";

    default:
        return "Any";
}
