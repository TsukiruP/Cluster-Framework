/// effect_create(x, y, sequence, [depth, xscale, yscale])
/* Creates an effect */

var effect;

effect = instance_create(floor(argument0), floor(argument1), par_effect);
effect.depth = depth;

with (effect)
{
    sequence_set(argument2);
    if (argument_count > 3) depth = argument[3];
    if (argument_count > 4) image_xscale = argument[4];
    if (argument_count > 5) image_yscale = argument[5];
}

return effect;
