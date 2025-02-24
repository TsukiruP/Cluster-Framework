/// player_collision_floor(radius)
/// @desc Returns the id of the first solid that is in collision with the lower half of the player's bounding box, or noone on failure.
/// @param {int} radius
/// @returns {object}

var _radius; _radius = argument0;

// Scan rectangle within radius:
for ({var oy; oy = 0}; oy < _radius; oy += 1)
{
    // Evaluate all solids:
    for ({var n; n = ds_list_size(solid_list) - 1}; n > -1; n -= 1)
    {
        // Get the current solid:
        var inst; inst = ds_list_find_value(solid_list, n);

        // Continue:
        if (inst.semisolid && collision_ray(x_radius, 0, mask_rotation, inst) != noone) continue;
        if (collision_box_vertical(x_radius, oy, mask_rotation, inst) == noone) continue;

        // Confirm matching solid:
        return inst;
    }
}

// If no solids were found:
return noone;
