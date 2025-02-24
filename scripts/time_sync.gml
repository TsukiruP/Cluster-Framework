/// time_sync(time, frequency, max)
/// @desc Returns the time divided by the frequency and kept between 0 and the max - max exclusive.
/// @param {number} time
/// @param {int} frequency
/// @param {int} max
/// @returns {int}

var _time; _time = argument0;
var _frequency; _frequency = argument1;
var _max; _max = argument2;

return (_time div _frequency) mod _max;