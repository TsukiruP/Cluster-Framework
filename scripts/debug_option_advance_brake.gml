/// debug_option_advance_brake(index, [event])
/// @param {int} index
/// @param {bool} [event]
/// @returns {any}

var _index; _index = argument[0];
var _event; if (argument_count > 1) _event = argument[1]; else _event = true;

var config_key; config_key = "advance_brake";

switch (_index)
{
    // Text:
    case 0:
        return "Brake:";

    // Value:
    case 1:
        return pick(game_config_get(config_key), "Classic", "Advance");

    // Change:
    case 3:
        if (_event) game_config_set(config_key, !game_config_get(config_key));
        return true;

    // Undefined:
    default:
        return undefined;
}
