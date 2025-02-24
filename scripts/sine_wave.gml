/// sine_wave(time, period, amplitude, midpoint)
/// @desc https://gm48.net/resource/33/sine-waves-make-your-game-prettier
/// @param {number} time
/// @param {number} period
/// @param {number} amplitude
/// @param {number} midpoint
/// @returns {number}

var _time; _time = argument0;
var _period; _period = argument1;
var _amplitude; _amplitude = argument2;
var _midpoint; _midpoint = argument3;

return sin(_time * 2 * pi / _period) * _amplitude + _midpoint;