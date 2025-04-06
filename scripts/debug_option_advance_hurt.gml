/// debug_option_advance_hurt(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var config_key; config_key = "advance_hurt";

switch (_index)
{
    // Text:
    case 0:
        return "Hurt:";

    // Value:
    case 1:
        return pick(game_config_get(config_key), "Classic", "Advance");

    // Change:
    case 3:
        if (_execute) game_config_set(config_key, !game_config_get(config_key));
        return true;

    // Undefined:
    default:
        return undefined;
}