/// effect_create(timeline, x, y, [xscale, yscale])
// Creates an effect using the timeline given.

var xscale, yscale;

// Set xscale:
if (argument_count >= 4) xscale = argument[3];
else xscale = 1;

// Set yscale:
if (argument_count >= 5) yscale = argument[4];
else yscale = 1;

with (instance_create(argument[1], argument[2], eff_basic)) {
    timeline_set(argument[0]);
    image_xscale = xscale;
    image_yscale = yscale;
}
