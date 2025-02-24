/// collision_ray_vertical(ox, oy, rot, obj)
/// @desc Returns the id of the given object that is in collision with a line of height {oy * 2} and length {ox} from the calling instance's center point, or noone on failure.
/// @param {number} ox
/// @param {number} oy
/// @param {number} rot
/// @param {object} obj
/// @returns {object}

var _ox; _ox = argument0;
var _oy; _oy = argument1;
var _rot; _rot = argument2;
var _obj; _obj = argument3;

var x_int; x_int = floor(x);
var y_int; y_int = floor(y);
var sine; sine = dsin(_rot);
var csine; csine = dcos(_rot);

var x1; x1 = x_int + (csine * _ox) - (sine * _oy);
var y1; y1 = y_int - (sine * _ox) - (csine * _oy);
var x2; x2 = x_int + (csine * _ox) + (sine * _oy);
var y2; y2 = y_int - (sine * _ox) + (csine * _oy);

return collision_line(x1, y1, x2, y2, _obj, true, true);
