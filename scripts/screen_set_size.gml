/// screen_set_size(width, height)
/// @desc Sets the screen size.
/// @param width
/// @param height
/// @returns {bool}

var _width; _width = argument0;
var _height; _height = argument1;

with (ctrl_screen)
{
    screen_width = _width;
    screen_height = _height;
    return true;
}