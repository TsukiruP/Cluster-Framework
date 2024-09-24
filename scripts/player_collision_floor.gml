/// player_collision_floor(radius)
// Returns whether any solids are in collision with the lower half of the player's bounding box.

var total_solids, oy, n, inst;

total_solids = ds_list_size(solid_list);

// Scan rectangle within radius:
for (oy = 0; oy < argument0; oy += 1)
{
    // Evaluate all solids
    for (n = 0; n < total_solids; n += 1)
    {
        // Get the current solid:
        inst = ds_list_find_value(solid_list, n);

        // Continue:
        if (collision_box_vertical(x_radius, oy, mask_rotation, inst) == noone ||
            (inst.semisolid && collision_ray(x_radius, 0, mask_rotation, inst) != noone))
        {
            continue;
        }

        // Confirm:
        return inst;
    }
}

// If there was no collision:
return noone;
