/// wrap(val, min, max)
/// @desc Returns the value inside the window defined by min and max - max inclusive.
/// @param {number} val
/// @param {number} min
/// @param {number} max
/// @returns {number}

var _val; _val = argument0;
var _min; _min = argument1;
var _max; _max = argument2;

if (_val < _min) return _max;
else if (_val > _max) return _min;
else return _val;