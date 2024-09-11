/// window_resize()
// Resizes the window to the proper display settings.

if (global.display_fullscreen == true)
{
    if (window_get_width() != global.display_width || window_get_height() != global.display_height)
    {
        window_set_size(global.display_width, global.display_height);
        window_center();
        room_view_set_all();
    }
}
else
{
    if (window_get_width() != global.display_width * global.display_scale || window_get_height() != global.display_height * global.display_scale)
    {
        window_set_size(global.display_width * global.display_scale, global.display_height * global.display_scale);
        window_center();
        room_view_set_all();
    }
}
