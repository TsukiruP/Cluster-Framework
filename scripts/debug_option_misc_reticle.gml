/// debug_option_misc_reticle(return)
/// @param {any} return
/// @returns {any}

var _return; _return = argument0;

var config_key; config_key = "misc_reticle";

switch (_return)
{
    // Text:
    case 0:
        return "Reticle:";

    // Value:
    case 1:
        return pick(game_get_config(config_key), "None", "Default", "Colors DS");

    // Update:
    case 3:
        game_set_config(config_key, wrap(game_get_config(config_key) + menu_x_direction, 0, 2));
        return true;

    // Undefined:
    default:
        return undefined;
}