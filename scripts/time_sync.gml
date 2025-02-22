/// time_sync(time, frequency, maximum)
/// @desc Returns the time divided by the frequency and kept between 0 and the maximum - maximum exclusive.
/// @param {number} time
/// @param {int} frequency
/// @param {int} maximum
/// @returns {int}

var _time; _time = argument0;
var _frequency; _frequency = argument1;
var _maximum; _maximum = argument2;

return (_time div _frequency) mod _maximum;