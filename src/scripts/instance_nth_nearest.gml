/// instance_nth_nearest(x, y, obj, n)
/// @desc Returns the id of the nth nearest instance.
/// @param {number} x
/// @param {number} y
/// @param {object} obj
/// @param {int} n
/// @returns {object}

var _x; _x = argument0;
var _y; _y = argument1;
var _obj; _obj = argument2;
var _n; _n = argument3;

_n = min(max(1, _n), instance_number(_obj));

var list; list = ds_priority_create();
var nearest; nearest = noone;

with (_obj) ds_priority_add(list, id, distance_to_point(_x, _y));
repeat (_n) nearest = ds_priority_delete_min(list);
ds_priority_destroy(list);
return nearest;
