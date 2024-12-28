/// screen_set_window()
// Resizes the window to screen configs.

if (!window_get_fullscreen())
{
    var screen_width, screen_height;

    screen_width = screen_get_width() * game_config_get("screen_scale");
    screen_height = screen_get_height() * game_config_get("screen_scale");

    if (window_get_width() != screen_width || window_get_height() != screen_height)
    {
        window_set_size(screen_width, screen_height);
        window_set_region_size(screen_width, screen_height, false);
        window_resize_buffer(screen_width, screen_height, true, false);
        window_center();
    }
}
