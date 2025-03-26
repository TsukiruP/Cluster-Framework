/// debug_option_config_reset(return, [execute])
/// @param {int} return
/// @param {bool} [execute]
/// @returns {any}

var _return; _return = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_return)
{
    // Text:
    case 0:
        return "Reset Config";

    // Confirm:
    case 2:
        if (_execute) game_reset_config();
        return true;

    // Undefined:
    default:
        return undefined;
}