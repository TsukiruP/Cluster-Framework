/// screen_set_size(width, height)
// Sets the screen size.

with (mgr_screen)
{
    screen_width = argument0;
    screen_height = argument1;
    room_set_view_all();
}
