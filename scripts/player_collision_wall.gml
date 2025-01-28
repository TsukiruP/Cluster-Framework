/// player_collision_wall(radius)
/* Returns the id of the first solid that is in collision with the wall sensor of the player's bounding box, or noone on failure. */

var n, inst;

// Evaluate all solids:
for (n = ds_list_size(solid_list) - 1; n > -1; n -= 1)
{
    // Get the current solid:
    inst = ds_list_find_value(solid_list, n);

    // Continue if not colliding with/passing through the current solid:
    if (collision_ray(wall_radius + argument0, 0, mask_rotation, inst) == noone || inst.semisolid)
    {
        continue;
    }

    // Confirm matching solid:
    return inst;
}

// If no solids were found:
return noone;
