/// debug_option_subject_test(index, [event])
/// @param {int} index
/// @param {bool} [event]
/// @returns {any}

var _index; _index = argument[0];
var _event; if (argument_count > 1) _event = argument[1]; else _event = true;

switch (_index)
{
    // Text:
    case 0:
        return "Subject Test";

    // Confirm:
    case 4:
        if (_event) text_set_subject("This message is a test!");
        return true;

    // Undefined:
    default:
        return undefined;
}