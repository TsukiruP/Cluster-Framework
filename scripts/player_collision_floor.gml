/// player_collision_floor(radius)
// Returns whether any solids are in collision with the lower half of the player's bounding box.

var total_solids, oy, n, inst;

total_solids = ds_list_size(solid_list);

// Scan rectangle within radius:
for (oy = 0; oy < argument0; oy += 1) {
    // Evaluate all solids
    for (n = 0; n < total_solids; n += 1) {
        // Get the current solid:
        inst = ds_list_find_value(solid_list, n);
        
        // Not colliding with the current solid:
        if (collision_box_vertical(x_radius, oy, mask_rotation, inst) == noone) {
            continue;
        }
        
        // Passing through the current solid:
        if (oy == 0 && inst.semi_solid) {
            continue;
        }

        // Confirm:
        return inst;
    }
}

// If there was no collision:
return noone;
