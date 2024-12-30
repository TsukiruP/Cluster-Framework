/// debug_option_misc_reticle(return)

var config_key;

// Config key:
config_key = "misc_reticle";

switch (argument0)
{
    // Text:
    case 0:
        return "Reticle:";

    // Value:
    case 1:
        return pick(game_config_get(config_key), "None", "Default", "Colors DS");

    // Update:
    case 3:
        game_config_set(config_key, wrap(game_config_get(config_key) + menu_x_direction, 0, 2));
        return true;

    // Undefined:
    default:
        return undefined;
}
