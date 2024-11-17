/// screen_set_resolution()
// Sets the screen width and height based on settings.

switch (game_setting_get("screen_mode"))
{
    // 3DS:
    case 1:
        break;

    // Misc.:
    case 2:
        break;

    // Default:
    default:
        switch (game_setting_get("screen_ratio"))
        {
            // 4:3:
            case 1:
                if (!screen_is_equal(370, 270))
                {
                    screen_set_size(480, 270);
                }
                break;

            // 16:9:
            default:
                if (!screen_is_equal(480, 270))
                {
                    screen_set_size(480, 270);
                }
        }
}
