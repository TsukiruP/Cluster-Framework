/// debug_option_subject_test(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_index)
{
    case OPTION_TEXT:
        return "Subject Test";

    case OPTION_CONFIRM:
        if (_execute) text_set_subject("This message is a test!");
        return true;

    default:
        return undefined;
}