/// screen_set_window()
// Resizes the window to screen settings.

if (!window_get_fullscreen())
{
    if (window_get_width() != screen_get_width() * game_setting_get("screen_scale") || window_get_height() != screen_get_height() * game_setting_get("screen_scale"))
    {
        window_set_size(screen_get_width() * game_setting_get("screen_scale"), screen_get_height() * game_setting_get("screen_scale"));
        window_center();
    }
}
