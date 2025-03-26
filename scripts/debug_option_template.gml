/// debug_option_template(return, [execute])
/// @param {int} return
/// @param {bool} [execute]
/// @returns {any}

var _return; _return = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_return)
{
    // Text:
    case 0:
        return "Character Debug";

    // Value:
    case 1:
        return undefined;

    // Confirm:
    case 2:
        if (_execute) return true;
        return false;

    // Update:
    case 3:
        if (_execute) return true;
        return false;

    // Undefined:
    default:
        return undefined;
}
