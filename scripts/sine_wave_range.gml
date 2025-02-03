/// sine_wave_range(time, period, minimum, maximum)
/* https://gm48.net/resource/33/sine-waves-make-your-game-prettier */

var midpoint, amplitude;

midpoint = mean(argument2, argument3);
amplitude = argument3 - midpoint;

return sine_wave(argument0, argument1, amplitude, midpoint);
