/// player_collision_ceiling(height)
/// @desc Finds the first solid intersecting the upper half of the player's collision mask.
/// @param {int} height
/// @returns {object}

var _height; _height = argument0;

// Extend mask up to height:
for ({var oy; oy = 0}; oy < _height; oy += 1)
{
    // Evaluate all solids:
    for ({var n; n = ds_list_size(solid_list) - 1}; n > -1; n -= 1)
    {
        // Get the current solid:
        var inst; inst = ds_list_find_value(solid_list, n);

        // Continue if not intersecting / passing through it:
        if (collision_box_vertical(x_radius, -oy, mask_direction, inst) == noone || inst.semisolid) continue;

        // Confirm matching solid:
        return inst;
    }
}

// No solid found:
return noone;
