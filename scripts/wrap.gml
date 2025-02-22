/// wrap(value, minimum, maximum)
/// @desc Returns the value inside the window defined by minimum and maximum - maximum inclusive.
/// @param {int} value
/// @param {int} minimum
/// @param {int} maximum
/// @returns {int}

var _value; _value = argument0;
var _minimum; _minimum = argument1;
var _maximum; _maximum = argument2;

if (_value < _minimum) return _maximum;
else if (_value > _maximum) return _minimum;
else return _value;