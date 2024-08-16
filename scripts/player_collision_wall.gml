/// player_collision_wall(radius)
// Returns whether any solids are in collision with the wall sensor of the player's bounding box.

var total_solids, n, inst;

total_solids = ds_list_size(solid_list);

// Evaluate all solids
for (n = 0; n < total_solids; n += 1) {
    // Get the current solid:
    inst = ds_list_find_value(solid_list, n);

    // Continue if not colliding with/passing through the current solid:
    if (collision_ray(wall_radius + argument0, 0, mask_rotation, inst) == noone || inst.semi_solid) {
        continue;
    }

    // Confirm
    return inst;
}

// If there was no collision:
return noone;
