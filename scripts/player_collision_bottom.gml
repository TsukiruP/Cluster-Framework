/// player_collision_bottom(x, y, angle, mask);
// Returns true if colliding with terrain from the bottom.
/*
var mask_temp, collision_test;

// Store mask as a temporal variables:
mask_temp = mask_index;

// Switch mask:
mask_index = argument3;

// Collision test:
collision_test = player_collision(floor(argument0 + dsin(argument2) * 11), floor(argument1 + dcos(argument2) * 11), collision_layer);

// Special platform case:
if(collision_test == false && ground == false && y_speed >= 0) {
    collision_test = place_meeting(floor(argument0 + dsin(argument2) * 11), floor(argument1 + dcos(argument2) * 11), par_platform) &&
        !place_meeting(floor(argument0), floor(argument1), par_platform);
}

// Restore temporal mask:
mask_index = mask_temp;

// Return test:
return collision_test;
