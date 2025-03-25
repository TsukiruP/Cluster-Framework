/// debug_option_advance_brake(return)
/// @param {int} return
/// @returns {any}

var _return; _return = argument0;

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
        game_set_config(config_key, !game_get_config(config_key));
        return true;

    // Undefined:
    default:
        return undefined;
}
