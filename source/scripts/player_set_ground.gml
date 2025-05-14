/// player_set_ground(obj)
/// @desc Sets the player's ground instance.
/// @param {object} obj
/// @returns {void}

var _obj; _obj = argument0;

// Calculate new ground angle:
var new_angle; new_angle = player_get_angle(_obj, mask_direction);

// Abort if terrain is too steep to map to:
if (on_ground && abs(angle_difference(angle, new_angle)) > 45)
{
    ground_inst = noone;
    on_ground = false;
    exit;
}

// Confirm ground assignment:
ground_inst = _obj;
on_ground = true;
player_reset_skill();

// Set new ground angle:
angle = new_angle;
relative_angle = angle_wrap(angle - gravity_direction);

// Align to ground:
var _rotation; _rotation = round(angle / 90) * 90;
for ({var oy; oy = 0}; oy < y_radius * 2; oy += 1)
{
    if (collision_box_vertical(x_radius, oy, _rotation, ground_inst) != noone)
    {
        var _height; _height = (y_radius - oy) + 1;
        x -= dsin(_rotation) * _height;
        y -= dcos(_rotation) * _height;
        break;
    }
}
