/// effect_create(sequence, x, y, [depth, xscale, yscale])
/* Creates an effect */

var effect;

effect = instance_create(floor(argument1), floor(argument2), par_effect);
effect.depth = depth;

with (effect)
{
    sequence_set(argument0);
    if (argument_count > 3) depth = argument[3];
    if (argument_count > 4) image_xscale = argument[4];
    if (argument_count > 5) image_yscale = argument[5];
}

return effect;
