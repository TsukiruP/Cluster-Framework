/// debug_option_character(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_index)
{
    // Text:
    case 0:
        return "Character Debug";

    // Select:
    case 2:
        if (_execute) text_set_body("Change player characters and their skills.");
        return true;

    // Confirm:
    case 4:
        if (_execute) debug_set_next(debug_menu_character);
        return true;

    // Undefined:
    default:
        return undefined;
}