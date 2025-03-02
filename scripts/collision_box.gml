/// collision_box(xrad, yrad, invert, obj)
/// @desc Checks if the given instance intersects a rectangle centered on the calling instance.
/// @param {number} xrad
/// @param {number} yrad
/// @param {bool} invert
/// @param {object} obj
/// @returns {object}

var _xrad; _xrad = argument0;
var _yrad; _yrad = argument1;
var _invert; _invert = argument2;
var _obj; _obj = argument3;

var x_int; x_int = floor(x);
var y_int; y_int = floor(y)

if (_invert) return collision_rectangle(x_int - _yrad, y_int - _xrad, x_int + _yrad, y_int + _xrad, _obj, true, false);
return collision_rectangle(x_int - _xrad, y_int - _yrad, x_int + _xrad, y_int + _yrad, _obj, true, false);
