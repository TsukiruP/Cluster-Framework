/// collision_box_vertical(xrad, ylen, rot, obj)
/// @desc Checks if the given instance intersects a rectangle whose top edge is centered on the calling instance.
/// @param {number} xrad
/// @param {number} ylen
/// @param {number} rot
/// @param {object} obj
/// @returns {object}

var _xrad; _xrad = argument0;
var _ylen; _ylen = argument1;
var _rot; _rot = argument2;
var _obj; _obj = argument3;

var x_int; x_int = floor(x);
var y_int; y_int = floor(y);
var sine; sine = dsin(_rot);
var csine; csine = dcos(_rot);

var x1; x1 = x_int - (csine * _xrad);
var y1; y1 = y_int + (sine * _xrad);
var x2; x2 = x_int + (csine * _xrad) + (sine * _ylen);
var y2; y2 = y_int - (sine * _xrad) + (csine * _ylen);

return collision_rectangle(x1, y1, x2, y2, _obj, true, false);
