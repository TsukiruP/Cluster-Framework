/// debug_option_sonic_homing(index, [event])
/// @param {int} index
/// @param {bool} [event]
/// @returns {any}

var _index; _index = argument[0];
var _event; if (argument_count > 1) _event = argument[1]; else _event = true;

var skill_key; skill_key = "homing";

switch (_index)
{
    // Text:
    case 0:
        return "Homing Attack:";

    // Value:
    case 1:
        return pick(game_save_get_skill(CHAR_SONIC, skill_key), "None", "1998", "2008", "2022", "2024");

    // Update:
    case 3:
        if (_event) game_save_set_skill(CHAR_SONIC, skill_key, wrap(game_save_get_skill(CHAR_SONIC, skill_key) + menu_x_direction, HOMING_NONE, HOMING_GENERATIONS));
        return true;

    // Undefined:
    default:
        return undefined;
}
