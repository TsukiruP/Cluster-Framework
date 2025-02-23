/// cosine_wave(time, period, amplitude, midpoint)
/// @desc sine_wave but for cosine.
/// @param {number} time
/// @param {number} period
/// @param {number} amplitude
/// @param {number} midpoint
/// @returns {number}

var _time; _time = argument0;
var _period; _period = argument1;
var _amplitude; _amplitude = argument2;
var _midpoint; _midpoint = argument3;

return cos(_time * 2 * pi / _period) * _amplitude + _midpoint;