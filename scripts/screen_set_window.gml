/// screen_set_window()
/// @desc Sets the window size based on screen configs.
/// @returns {void}

if (!window_get_fullscreen())
{
    var screen_scale; screen_scale = game_get_config("screen_scale");
    var screen_width; screen_width = screen_get_width() * screen_scale;
    var screen_height; screen_height = screen_get_height() * screen_scale;

    if (window_get_width() != screen_width || window_get_height() != screen_height)
    {
        window_set_size(screen_width, screen_height);
        window_set_region_size(screen_get_width(), screen_get_height(), false);
        window_set_region_scale(screen_scale, false);
        window_resize_buffer(screen_get_width(), screen_get_height(), false, false);
        window_center();
    }
}
else
{
    if (window_get_region_scale() != -1 || window_get_region_width() != screen_get_width() || window_get_region_height() != screen_get_height())
    {
        window_set_region_size(screen_get_width(), screen_get_height(), false);
        window_set_region_scale(-1, false);
        window_resize_buffer(screen_get_width(), screen_get_height(), false, false);
    }
}
