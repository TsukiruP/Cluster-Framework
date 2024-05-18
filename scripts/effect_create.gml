/// effect_create(timeline, x, y, [depth, xscale, yscale])
// Creates an effect using the timeline given.

var cdepth, xscale, yscale;

// Set depth:
if (argument_count >= 4) cdepth = argument[3];
else cdepth = 0;

// Set xscale:
if (argument_count >= 5) xscale = argument[4];
else xscale = 1;

// Set yscale:
if (argument_count >= 6) yscale = argument[5];
else yscale = 1;

with (instance_create(argument[1], argument[2], eff_basic)) {
    depth = cdepth;
    timeline_set(argument[0]);
    image_xscale = xscale;
    image_yscale = yscale;
}
