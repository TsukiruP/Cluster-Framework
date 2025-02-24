/// input_get_time(input, target)
/// @desc Returns whether the input's time is equal to or greater than the target.
/// @param {int} input
/// @param {int} target
/// @returns {int}

var _input; _input = argument0;
var _target; _target = argument1;

with (ctrl_input) return input_time[_input] >= _target;