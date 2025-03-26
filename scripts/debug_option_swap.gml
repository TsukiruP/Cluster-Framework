/// debug_option_swap(index, [event])
/// @param {int} index
/// @param {bool} [event]
/// @returns {any}

var _index; _index = argument[0];
var _event; if (argument_count > 1) _event = argument[1]; else _event = true;

var save_key; save_key = "swap";

switch (_index)
{
    // Text:
    case 0:
        return "Swap:";

    // Value:
    case 1:
        return string_bool(game_get_save(save_key), true);

    // Change:
    case 3:
        if (_event) game_set_save(save_key, !game_get_save(save_key));
        return true;

    // Undefined:
    default:
        return undefined;
}