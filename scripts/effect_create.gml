/// effect_create(timeline, x, y, [depth, xscale, yscale])
// Creates an effect using the timeline given.

var effect;

// Initialize:
effect = instance_create(floor(argument1), floor(argument2), par_effect);
effect.depth = depth;

with (effect)
{
    // Set timeline:
    timeline_set(argument0);

    // Set depth:
    if (argument_count >= 4)
    {
        depth = argument[3];
    }

    // Set xscale:
    if (argument_count >= 5)
    {
        image_xscale = argument[4];
    }

    // Set yscale:
    if (argument_count >= 6)
    {
        image_yscale = argument[5];
    }
}

return effect;
