/// debug_option_config_write(return, [execute])
/// @param {int} return
/// @param {bool} [execute]
/// @returns {any}

var _return; _return = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_return)
{
    // Text:
    case 0:
        return "Write Config";

    // Confirm:
    case 2:
        if (_execute) game_write_config();
        return true;

    // Undefined:
    default:
        return undefined;
}