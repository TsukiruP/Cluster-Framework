/// player_rotate_mask()
/// @desc Rotates the player's mask along uneven ground.
/// @returns {void}

// Calculate rotational offset between angle and mask direction:
var difference; difference = angle_difference(mask_direction, angle);

// Abort if...
if (abs(difference) <= 45 || abs(difference) >= 90) exit; // Offset is too steep or shallow.
if (collision_box(y_radius + 1, x_radius, (mask_direction mod 180 != 0), ground_inst) == noone) exit; // Rotating would make the player fall.

// Calculate...
var new_direction; new_direction = angle_wrap(mask_direction + 90 * sign(difference)); // New mask direction.
var new_angle; new_angle = player_get_angle(ground_inst, new_direction); // Ground angle from new mask direction.
var new_difference; new_difference = angle_difference(mask_direction, new_angle); // Rotational offset between new angle and mask direction.

// Abort if...
if (sign(difference) != sign(new_difference)) exit; // Rotating the wrong way.
if (abs(new_difference) <= 45 || abs(new_difference) >= 90) exit; // New offset is too steep or shallow.

// Confirm rotation:
angle = new_angle;
relative_angle = angle_wrap(angle - gravity_direction);
mask_direction = new_direction;
