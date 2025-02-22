/// sine_wave_range(time, period, minimum, maximum)
/// @desc https://gm48.net/resource/33/sine-waves-make-your-game-prettier
/// @param {number} time
/// @param {int} period
/// @param {int} minimum
/// @param {int} maximum
/// @returns {number}

var _time; _time = argument0;
var _period; _period = argument1;
var _minimum; _minimum = argument2;
var _maximum; _maximum = argument3;

var midpoint; midpoint = mean(_minimum, _maximum);
var amplitude; amplitude = _maximum - midpoint;

return sine_wave(_time, _period, amplitude, midpoint);