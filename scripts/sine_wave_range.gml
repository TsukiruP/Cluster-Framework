/// sine_wave_range(time, period, min, max)
/// @desc https://gm48.net/resource/33/sine-waves-make-your-game-prettier
/// @param {number} time
/// @param {number} period
/// @param {number} min
/// @param {number} max
/// @returns {number}

var _time; _time = argument0;
var _period; _period = argument1;
var _min; _min = argument2;
var _max; _max = argument3;

var midpoint; midpoint = mean(_min, _max);
var amplitude; amplitude = _max - midpoint;

return sine_wave(_time, _period, amplitude, midpoint);
