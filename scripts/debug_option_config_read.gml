/// debug_option_config_read(return)

switch (argument0)
{
    // Text:
    case 0:
        return "Read Config";

    // Confirm:
    case 2:
        game_read_config();
        window_set_fullscreen(game_get_config("screen_full"));
        return true;

    // Undefined:
    default:
        return undefined;
}
