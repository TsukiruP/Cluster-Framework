/// player_collision_right_edge(x, y, angle)
// Returns true if colliding with terrain.
/*
var mask_temp, sprite_temp, image_temp, collision_test;

// Store mask and sprite as a temporal variables:
mask_temp   = mask_index;
sprite_temp = sprite_index;
image_temp  = image_index;

// Switch mask and sprite:
mask_index   = mask_lines;
sprite_index = mask_lines;
image_index  = floor(argument2);

// Collision test:
collision_test = player_collision(floor(argument0 + dcos(argument2) * 8 + dsin(argument2) * 11), floor(argument1 - dsin(argument2) * 11 + dcos(argument2) * 11), collision_layer);

// Restore temporal mask:
mask_index   = mask_temp;
sprite_index = sprite_temp;
image_index  = image_temp;

// Return test:
return collision_test;
