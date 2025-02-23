/// room_set_view_better(width, height)
/// @desc Sets the view size of the room.
/// @param {int} width
/// @param {int} height
/// @returns {void}

var _width; _width = argument0;
var _height; _height = argument1;

view_enabled[0] = true;
view_visible[0] = true;
view_wview[0] = _width;
view_hview[0] = _height;
view_wport[0] = _width;
view_hport[0] = _height;
view_hborder[0] = _width / 2;
view_vborder[0] = _height / 2;