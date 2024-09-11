/// effect_create(timeline, x, y, [depth, xscale, yscale])
// Creates an effect using the timeline given.

var effect;

// Initialize:
effect       = instance_create(floor(argument1), floor(argument2), eff_basic);
effect.depth = depth;

// Set timeline:
with (effect)
{
    timeline_set(argument0);
}

// Set depth:
if (argument_count >= 4)
{
    effect.depth = argument[3];
}

// Set xscale:
if (argument_count >= 5)
{
    effect.image_xscale = argument[4];
}

// Set yscale:
if (argument_count >= 6)
{
    effect.image_yscale = argument[5];
}
