/// player_rotate_mask()
/// @desc Rotates the player's mask along uneven ground. Returns whether this was successful or not.
/// @returns {bool}

// Calculate rotational offset between angle and mask rotation:
var difference; difference = angle_difference(mask_rotation, angle);

// Abort if...
if (abs(difference) <= 45 or abs(difference) >= 90) return false; // Offset is too steep or shallow
if (collision_box(y_radius * 2, x_radius, (mask_rotation mod 180 != 0), ground_inst) == noone) return false; // Rotating would make the player fall
var new_rotation, new_angle, new_difference;

// Calculate...
var new_rotation; new_rotation = angle_wrap(mask_rotation + 90 * sign(difference)); // New mask rotation
var new_angle; new_angle = player_get_angle(ground_inst, new_rotation); // Ground angle from new mask rotation
var new_difference; new_difference = angle_difference(mask_rotation, new_angle); // Rotational offset from new mask rotation

// Abort if...
if (sign(difference) != sign(new_difference)) return false; // Rotating the wrong way
if (abs(new_difference) <= 45 or abs(new_difference) >= 90) return false; // New offset is too steep or shallow

// Confirm rotation:
angle = new_angle;
relative_angle = angle_wrap(angle - gravity_direction);
mask_rotation = new_rotation;
return true;