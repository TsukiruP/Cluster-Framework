/// player_collision_floor(radius)
/* Returns the id of the first solid that is in collision with the lower half of the player's bounding box, or noone on failure. */

var oy, n, inst;

// Scan rectangle within radius:
for (oy = 0; oy < argument0; oy += 1)
{
    // Evaluate all solids:
    for (n = ds_list_size(solid_list) - 1; n > -1; n -= 1)
    {
        // Get the current solid:
        inst = ds_list_find_value(solid_list, n);

        // Continue:
        if (collision_box_vertical(x_radius, oy, mask_rotation, inst) == noone || (inst.semisolid && collision_ray(x_radius, 0, mask_rotation, inst) != noone))
        {
            continue;
        }

        // Confirm matching solid:
        return inst;
    }
}

// If no solids were found:
return noone;
