/// debug_option_misc_hud(return)

var config_key;

// Config key:
config_key = "misc_hud";

switch (argument0)
{
    // Text:
    case 0:
        return "HUD:";

    // Value:
    case 1:
        return pick(game_get_config(config_key), "None", "Default", "S4E2");

    // Update:
    case 3:
        game_set_config(config_key, wrap(game_get_config(config_key) + menu_x_direction, 0, 2));
        return true;

    // Undefined:
    default:
        return undefined;
}
