/// player_collision_platform_fix(x, y, angle, mask)
// Returns true if colliding with slopes.

var mask_temp, collision_test;

// Store mask as a temporal variables:
mask_temp = mask_index;

// Switch mask:
mask_index = argument3;

// Collision test:
collision_test = (!place_meeting(x, y, par_platform) && !player_collision_object_bottom(x, y, angle, mask_big, par_platform) && !player_collision_object_top(x, y - 6, angle, mask_big, par_platform) && place_meeting(floor(argument0 + dsin(argument2) * 23), floor(argument1 + dcos(argument2) * 23), par_platform));

// Restore temporal mask:
mask_index = mask_temp;

// Return test:
return collision_test;
