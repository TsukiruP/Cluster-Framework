/// debug_option_advance_brake(return, [execute])
/// @param {int} return
/// @param {bool} [execute]
/// @returns {any}

var _return; _return = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var config_key; config_key = "advance_brake";

switch (_return)
{
    // Text:
    case 0:
        return "Brake:";

    // Value:
    case 1:
        return pick(game_get_config(config_key), "Classic", "Advance");

    // Update:
    case 3:
        if (_execute) game_set_config(config_key, !game_get_config(config_key));
        return true;

    // Undefined:
    default:
        return undefined;
}