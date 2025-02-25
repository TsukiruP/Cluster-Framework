/// instance_create_single(x, y, obj)
/// @desc Returns the id of a new object instance if it doesn't already exist.
/// @param {number} x
/// @param {number} y
/// @param {object} obj
/// @returns {object}

var _x; _x = argument0;
var _y; _y = argument1;
var _obj; _obj = argument2;

if (!instance_exists(_obj)) return instance_create(_x, _y, _obj);
