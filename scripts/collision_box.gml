/// collision_box(ox, oy, invert, obj)
/// @desc Returns the id of the given object that is in collision with a rectangle of size {ox * 2, oy * 2} centered on the calling instance, or noone on failure.
/// @param {number} ox
/// @param {number} oy
/// @param {bool} invert
/// @param {object} obj
/// @returns {object}

var _ox; _ox = argument0;
var _oy; _oy = argument1;
var _invert; _invert = argument2;
var _obj; _obj = argument3;

var x_int; x_int = floor(x);
var y_int; y_int = floor(y);

if (_invert)
{
    return collision_rectangle(x_int - _oy, y_int - _ox, x_int + _oy, y_int + _ox, _obj, true, true);
}

return collision_rectangle(x_int - _ox, y_int - _oy, x_int + _ox, y_int + _oy, _obj, true, true);
