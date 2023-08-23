/// character_collision_object_right(x, y, angle, mask, obj)
// Returns true if colliding with the given object from the right.

var mask_temp, collision_test;

// Store mask as a temporal variables:
mask_temp = mask_index;

// Switch mask:
mask_index = argument3;

// Collision test:
collision_test = instance_place(floor(argument0 + dcos(argument2) * 11), floor(argument1 - dsin(argument2) * 11), argument4);

// Restore temporal mask:
mask_index = mask_temp;

// Return test:
return collision_test;
