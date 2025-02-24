/// player_get_cliff()
/// @desc Sets the cliff direction.
/// @returns {int}

// Reset direction:
cliff_direction = 0;

var total_solids; total_solids = ds_list_size(solid_list);

var left; left = noone;
var right; right = noone;
var center; center = noone;

// Evaluate all solids:
for ({var n; n = 0}; n < total_solids; n += 1)
{
    // Get the current solid:
    var inst; inst = ds_list_find_value(solid_list, n);

    // Check sensors
    if (collision_ray_vertical(-x_radius, y_radius * 2, mask_rotation, inst) != noone)
    {
        // Left edge:
        left = inst;
    }

    if (collision_ray_vertical(x_radius, y_radius * 2, mask_rotation, inst) != noone)
    {
        // Right edge:
        right = inst;
    }

    if (collision_ray_vertical(0, y_radius * 2, mask_rotation, inst) != noone)
    {
        // Center ray:
        center = inst;
    }
}

// Check if only one edge is colliding with the ground
if (center == noone && (left != noone ^^ right != noone))
{
    // Face right:
    if (left != noone)
    {
        cliff_direction = 1;
    }

    // Face left:
    if (right != noone)
    {
        cliff_direction = -1;
    }
}

return cliff_direction;