/// debug_option_sonic_peel(index, [event])
/// @param {int} index
/// @param {bool} [event]
/// @returns {any}

var _index; _index = argument[0];
var _event; if (argument_count > 1) _event = argument[1]; else _event = true;

var skill_key; skill_key = "peel";

switch (_index)
{
    // Text:
    case 0:
        return "Peel Out:";

    // Value:
    case 1:
        return string_bool(game_save_get_skill(CHAR_SONIC, skill_key), true);

    // Update:
    case 3:
        if (_event) game_save_set_skill(CHAR_SONIC, skill_key, !game_save_get_skill(CHAR_SONIC, skill_key));
        return true;

    // Undefined:
    default:
        return undefined;
}
