/// player_collision_object_main(x, y, obj)
// Returns true if colliding with the given object.

var mask_temp, collision_test;

// Store mask as a temporal variables:
mask_temp = mask_index;

// Switch mask:
mask_index = mask_main;

// Collision test:
collision_test = instance_place(floor(argument0), floor(argument1), argument2);

// Restore temporal mask:
mask_index = mask_temp;

// Return test:
return collision_test;
