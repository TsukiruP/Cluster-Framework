/// player_get_cliff()
// I'm hanging on to the other side...

var total_solids, left, right, center, n, inst;

// Reset direction:
cliff_direction = 0;

total_solids = ds_list_size(solid_list);

left = noone;
right = noone;
center = noone;

// Evaluate all solids:
for (n = 0; n < total_solids; n += 1)
{
    // Get the current solid:
    inst = ds_list_find_value(solid_list, n);

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
