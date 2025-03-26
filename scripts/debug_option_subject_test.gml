/// debug_option_subject_test(return, [execute])
/// @param {int} return
/// @param {bool} [execute]
/// @returns {any}

var _return; _return = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_return)
{
    // Text:
    case 0:
        return "Subject Test";

    // Confirm:
    case 2:
        if (_execute) text_set_subject("This message is a test!");
        return true;

    // Undefined:
    default:
        return undefined;
}