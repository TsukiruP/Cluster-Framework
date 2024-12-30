/// screen_set_resolution()
// Sets the screen width and height based on configs.

switch (game_config_get("screen_mode"))
{
    // 3DS:
    case 1:
        switch (game_config_get("screen_ratio"))
        {
            // 4:3:
            case 1:
                if (!screen_is_equal(320, 240))
                {
                    return screen_set_size(320, 240);
                }
                break;

            // 5:3:
            case 2:
                if (!screen_is_equal(400, 240))
                {
                    return screen_set_size(400, 240);
                }
                break;

            // 16:9:
            default:
                if (!screen_is_equal(426, 240))
                {
                    return screen_set_size(426, 240);
                }
        }
        break;

    // Misc.:
    case 2:
        if (!screen_is_equal(420, 240))
        {
            return screen_set_size(420, 240);
        }
        break;

    // Default:
    default:
        switch (game_config_get("screen_ratio"))
        {
            // 4:3:
            case 1:
                if (!screen_is_equal(360, 270))
                {
                    return screen_set_size(360, 270);
                }
                break;

            // 16:9:
            default:
                if (!screen_is_equal(480, 270))
                {
                    return screen_set_size(480, 270);
                }
        }
}

return false;
