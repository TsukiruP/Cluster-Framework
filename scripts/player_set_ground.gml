/// player_set_ground(obj)
/// @desc Sets the player's ground instance.
/// @param {object} obj
/// @returns {void}

var _obj; _obj = argument0;

var new_angle; new_angle = player_get_angle(_obj, mask_direction);

// Abort if solid is too steep:
if (on_ground && abs(angle_difference(angle, new_angle)) > 45)
{
    on_ground = false;
    exit;
}

// Set new ground angle:
angle = new_angle;
relative_angle = (angle - gravity_direction) mod 360;

// Confirm ground:
ground_inst = _obj;
on_ground = true;
player_reset_skill();

// Align to ground:
mask_direction = angle_wrap(round(angle / 90) * 90);
var sine; sine = dsin(mask_direction);
var csine; csine = dcos(mask_direction);

// Rise up while inside:
repeat (y_radius)
{
    if (collision_box_vertical(x_radius, y_radius, mask_direction, ground_inst) != noone)
    {
        x -= sine;
        y -= csine;
    }
    else break;
}

// Snap down while outside:
repeat (y_radius + 1)
{
    if (collision_box_vertical(x_radius, y_radius + 1, mask_direction, ground_inst) == noone)
    {
        x += sine;
        y += csine;
    }
    else break;
}
