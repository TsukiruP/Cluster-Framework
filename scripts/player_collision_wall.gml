/// player_collision_wall(radius)
/// @desc Returns the id of the first solid that is in collision with the wall sensor of the player's bounding box, or noone on failure.
/// @param {int} radius
/// @returns {object}

var _radius; _radius = argument0;

// Evaluate all solids:
for ({var n; n = ds_list_size(solid_list) - 1}; n > -1; n -= 1)
{
    // Get the current solid:
    var inst; inst = ds_list_find_value(solid_list, n);

    // Continue if not colliding with/passing through the current solid:
    if (collision_ray(wall_radius + _radius, 0, mask_rotation, inst) == noone || inst.semisolid) continue;

    // Confirm matching solid:
    return inst;
}

// If no solids were found:
return noone;