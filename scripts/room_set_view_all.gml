/// room_set_view_all()
// Sets all the rooms to have views with the proper dimensions.

var room_handle;

room_handle = room_first;

while (room_handle != -1)
{
    room_set_view_enabled(room_handle, true);
    room_set_view(room_handle, 0, true, 0, 0, screen_width, screen_height, 0, 0, screen_width, screen_height, screen_width / 2, screen_height / 2, -1, -1, noone);
    room_handle = room_next(room_handle);
}
