/// player_collision_right(x, y, angle, mask)
// Returns true if colliding with terrain from the right.

var mask_temp, collision_test;

// Store mask as a temporal variables:
mask_temp = mask_index;

// Switch mask:
mask_index = argument3;

// Collision test:
collision_test = player_collision(floor(argument0 + dcos(argument2) * 11), floor(argument1 - dsin(argument2) * 11), collision_layer);

// Restore temporal mask:
mask_index = mask_temp;

// Return test:
return collision_test;
