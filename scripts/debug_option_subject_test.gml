/// debug_option_subject_test(return)
/// @param {any} return
/// @returns {any}

var _return; _return = argument0;

switch (_return)
{
    // Text:
    case 0:
        return "Subject Test";

    // Confirm:
    case 2:
        text_set_subject("This message is a test!");
        return true;

    // Undefined:
    default:
        return undefined;
}