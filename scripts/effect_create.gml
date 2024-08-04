/// effect_create(timeline, x, y, [depth, xscale, yscale])
// Creates an effect using the timeline given.

var effect;

effect = instance_create(floor(argument[1]), floor(argument[2]), eff_basic);

// Set depth:
if (argument_count >= 4) {
    effect.depth = argument[3];
} else {
    effect.depth = depth;
}

// Set xscale:
if (argument_count >= 5) {
    effect.image_xscale = argument[4];
} else {
    effect.image_xscale = 1;
}

// Set yscale:
if (argument_count >= 6) {
    effect.image_yscale = argument[5];
} else {
    effect.image_yscale = 1;
}

// Set timeline:
with (effect) {
    timeline_set(argument[0]);
}
