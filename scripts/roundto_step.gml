/// roundto_step(val, step)
/// @desc roundto that adds a step value. Automatically rounds to 1 if to is 0.
/// @param {number} val
/// @param {number} step
/// @returns {number}

var _val; _val = argument0;
var _step; _step = argument1;

return roundto(_val + _step, pick(abs(_step) != 0, 1, _step));
