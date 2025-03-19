/// player_set_ground(obj)
/// @desc Sets the player's ground instance.
/// @param {object} obj
/// @returns {void}

var _obj; _obj = argument0;


// Confirm ground assignment:
ground_inst = _obj;
on_ground = true;
player_reset_skill();

// Calculate and set new ground angle:
angle = player_get_angle(ground_inst, mask_direction);
relative_angle = angle_wrap(angle - gravity_direction);

// Align to ground:
var _rotation; _rotation = round(angle / 90) * 90;
var _height; _height = (y_radius - ground_offset) + 1;
x -= dsin(_rotation) * _height;
y -= dcos(_rotation) * _height;
