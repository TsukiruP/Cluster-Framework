/// debug_option_config_read(return)

switch (argument0)
{
    // Text:
    case 0:
        return "Read Config";

    // Confirm:
    case 2:
        game_config_read();
        window_set_fullscreen(game_config_get("screen_full"));
        return true;

    // Undefined:
    default:
        return undefined;
}
