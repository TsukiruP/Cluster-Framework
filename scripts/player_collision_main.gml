/// player_collision_main(x, y)
// Returns true if colliding with terrain.

var mask_temp, collision_test;

// Store mask as a temporal variables:
mask_temp = mask_index;

// Switch mask:
mask_index = mask_main;

// Collision test:
collision_test = player_collision(floor(argument0), floor(argument1), collision_layer);

// Restore temporal mask:
mask_index = mask_temp;

// Return test:
return collision_test;
