/// sine_between(time, period, minimum, maximum)
/* https://gm48.net/resource/33/sine-waves-make-your-game-prettier */

var midpoint, amplitude;

midpoint = mean(argument2, argument3);
amplitude = maximum - midpoint;

return sine_wave(argument0, argument1, amplitude, midpoint);
