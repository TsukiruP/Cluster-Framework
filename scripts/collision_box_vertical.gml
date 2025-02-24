/// collision_box_vertical(ox, oy, rot, obj)
/// @desc Returns the id of the given object that is in collision with a rectangle of size {ox * 2, oy} centered on the calling instance, or noone on failure. This rectangle rotates with its top edge centered against the calling instance's center point.
/// @param {number} ox
/// @param {number} oy
/// @param {number} rot
/// @param {object} obj
/// @returns {object}

var _ox; _ox = argument0;
var _oy; _oy = argument1;
var _rot; _rot = argument2;
var _obj; _obj = argument3;

_rot = round(_rot / 90) * 90;

var x_int; x_int = floor(x);
var y_int; y_int = floor(y);
var sine; sine = dsin(_rot);
var csine; csine = dcos(_rot);

var x1; x1 = x_int - (csine * _ox);
var y1; y1 = y_int + (sine * _ox);
var x2; x2 = x_int + (csine * _ox) + (sine * _oy);
var y2; y2 = y_int - (sine * _ox) + (csine * _oy);

return collision_rectangle(x1, y1, x2, y2, _obj, true, true);
