/// player_get_cliff()
/// @desc Sets the cliff direction.
/// @returns {void}

var left; left = false;
var right; right = false;
var height; height = y_radius * 2;

cliff_direction = 0;

for ({var n; n = ds_list_size(solid_list) - 1}; n > -1; n -= 1)
{
    var inst; inst = ds_list_find_value(solid_list, n);
    
    if (collision_ray_vertical(0, height, mask_direction, inst) != noone) exit;
    if (!left && collision_ray_vertical(-x_radius, height, mask_direction, inst) != noone) left = true;
    if (!right && collision_ray_vertical(x_radius, height, mask_direction, inst) != noone) right = true;
}

if (left ^^ right) cliff_direction = left - right;
