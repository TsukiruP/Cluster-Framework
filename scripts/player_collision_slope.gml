/// player_collision_slope(x, y, angle, mask)
// Returns true if colliding with slopes.

var mask_temp, collision_test;

// Store mask as a temporal variables:
mask_temp = mask_index;

// Switch mask:
mask_index = argument3;

// Collision test:
collision_test = player_collision(floor(argument0 + dsin(argument2) * 23), floor(argument1 + dcos(argument2) * 23), collision_layer);

// Restore temporal mask:
mask_index = mask_temp;

// Return test:
return collision_test;
