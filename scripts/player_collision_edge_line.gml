/// player_collision_edge_line()
// Returns true if colliding with terrain.

var mask_temp, collision_test;

// Store mask as a temporal variables:
mask_temp = mask_index;

// Switch mask:
mask_index = mask_edge_line;

// Collision test:
if((x_speed) != 0) collision_test = place_meeting(x + (sign(x_speed) * 6), y, par_terrain);
else collision_test = false;

// Restore temporal mask:
mask_index = mask_temp;

// Return test:
return collision_test;
