/// debug_option_misc_tally(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var config_key; config_key = "misc_tally";

switch (_index)
{
    // Text:
    case 0:
        return "Tally BGM:";

    // Value:
    case 1:
        return string_bool(game_config_get(config_key), true);

    // Change:
    case 3:
        if (_execute) game_config_set(config_key, !game_config_get(config_key));
        return true;

    // Undefined:
    default:
        return undefined;
}