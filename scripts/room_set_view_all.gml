/// room_set_view_all(width, height)
/// @desc Sets the view size of all rooms.
/// @param {int} width
/// @param {int} height
/// @returns {void}

var _width; _width = argument0;
var _height; _height = argument1;

for ({var i; i = room_first}; i != -1; i = room_next(i))
{
    room_set_view_enabled(i, true);
    room_set_view(i, 0, true, 0, 0, _width, _height, 0, 0, _width, _height, _width / 2, _height / 2, -1, -1, noone);
}