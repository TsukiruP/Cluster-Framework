/// room_set_view_all(width, height)
/* Sets all the rooms to have views with the given dimensions. */

var i;

for (i = room_first; i != -1; i = room_next(i))
{
    room_set_view_enabled(i, true);
    room_set_view(i, 0, true, 0, 0, argument0, argument1, 0, 0, argument0, argument1, argument0 / 2, argument1 / 2, -1, -1, noone);
}
