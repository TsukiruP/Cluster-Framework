/// dummy_effect_create(sprite, speed, x, y, depth, [xscale])
// Create a generic effect for the sprite given.

dummy_effect              = instance_create(argument[2], argument[3], eff_dummy);
dummy_effect.sprite_index = argument[0];
dummy_effect.image_speed  = argument[1];
dummy_effect.depth        = argument[4];

if(argument_count == 6) dummy_effect.image_xscale = argument[5];
