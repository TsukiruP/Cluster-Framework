/// debug_option_advance_hurt(return)
/// @param {any} return
/// @returns {any}

var _return; _return = argument0;

var config_key; config_key = "advance_hurt";

switch (_return)
{
    // Text:
    case 0:
        return "Hurt:";

    // Value:
    case 1:
        return pick(game_get_config(config_key), "Classic", "Advance");

    // Update:
    case 3:
        game_set_config(config_key, !game_get_config(config_key));
        return true;

    // Undefined:
    default:
        return undefined;
}