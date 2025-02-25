/// player_rotate_mask()
/// @desc Rotates the player's mask along uneven ground.
/// @returns {void}

var difference; difference = angle_difference(mask_direction, angle);

// Abort:
if (abs(difference) <= 45 || abs(difference) >= 90) exit;
if (collision_box(y_radius + 1, x_radius, (mask_direction mod 180 != 0), ground_inst) == noone) exit;

var new_rotation; new_rotation = angle_wrap(mask_direction + 90 * sign(difference));
var new_angle; new_angle = player_get_angle(ground_inst, new_rotation);
var new_difference; new_difference = angle_difference(mask_direction, new_angle);

// Abort:
if (sign(difference) != sign(new_difference)) exit;
if (abs(new_difference) <= 45 || abs(new_difference) >= 90) exit;

// Confirm rotation:
angle = new_angle;
relative_angle = angle_wrap(angle - gravity_direction);
mask_direction = new_rotation;
