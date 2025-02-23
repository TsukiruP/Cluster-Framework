/// screen_is_equal(width, height)
/// @desc Returns whether the current screen size matches the dimensions.
/// @param {int} width
/// @param {int} height
/// @returns {bool}

var _width; _width = argument0;
var _height; _height = argument1;

with (ctrl_screen) return (screen_width == _width && screen_height == _height);