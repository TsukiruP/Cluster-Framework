/// player_set_ground(inst)
/// @desc Sets the player's ground instance.
/// @param {object} inst
/// @returns {void}

var _inst; _inst = argument0;

// Confirm assignment
ground_inst = _inst;
on_ground = true;
player_reset_skill();

// Calculate and set new ground angle
angle = player_get_angle(ground_inst, mask_rotation);
relative_angle = angle_wrap(angle - gravity_direction);

var sine; sine = dsin(mask_rotation);
var csine; csine = dcos(mask_rotation);

// Rise up while inside
repeat (y_radius * 2)
{
    if (collision_box_vertical(x_radius, y_radius, mask_rotation, ground_inst) != noone)
    {
        x -= sine;
        y -= csine;
    }
    else
    {
        break;
    }
}

// Snap down while outside
repeat (y_radius * 2)
{
    if (collision_box_vertical(x_radius, y_radius + 1, mask_rotation, ground_inst) == noone)
    {
        x += sine;
        y += csine;
    }
    else
    {
        break;
    }
}