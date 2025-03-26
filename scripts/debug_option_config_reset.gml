/// debug_option_config_reset(index, [event])
/// @param {int} index
/// @param {bool} [event]
/// @returns {any}

var _index; _index = argument[0];
var _event; if (argument_count > 1) _event = argument[1]; else _event = true;

switch (_index)
{
    // Text:
    case 0:
        return "Reset Config";

    // Confirm:
    case 4:
        if (_event) game_reset_config();
        return true;

    // Undefined:
    default:
        return undefined;
}