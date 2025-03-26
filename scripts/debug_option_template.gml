/// debug_option_template(index, [event])
/// @param {int} index
/// @param {bool} [event]
/// @returns {any}

var _index; _index = argument[0];
var _event; if (argument_count > 1) _event = argument[1]; else _event = true;

switch (_index)
{
    // Text:
    case 0:
        return "Character Debug";

    // Value:
    case 1:
        return undefined;
    
    // Select:
    case 2:
        if (_event) return true;
        return false;
    
    // Change:
    case 3:
        if (_event) return true;
        return false;

    // Confirm:
    case 4:
        if (_event) return true;
        return false;

    // Undefined:
    default:
        return undefined;
}