/// player_rotate_mask()
// Rotates the player's mask along uneven ground.

var difference;

// Calculate rotational offset between angle and mask rotation:
difference = angle_difference(mask_rotation, angle);

// Abort if...
if (abs(difference) <= 45 or abs(difference) >= 90) exit; // Offset is too steep or shallow
if (collision_box(y_radius * 2, x_radius, (mask_rotation mod 180 != 0), ground_id) == noone) exit; // Not colliding with the ground
var new_rotation, new_angle, new_difference;

// Calculate...
new_rotation = angle_wrap(mask_rotation + 90 * sign(difference)); // New mask rotation
new_angle = player_get_angle(ground_id, new_rotation); // Ground angle from new mask rotation
new_difference = angle_difference(mask_rotation, new_angle); // Rotational offset from new mask rotation

// Abort if...
//if (angle == new_angle or difference == new_difference) exit; // Angles and offsets are the same (i.e., no rotation)
if (sign(difference) != sign(new_difference)) exit; // Rotating the wrong way
if (abs(new_difference) <= 45 or abs(new_difference) >= 90) exit; // New offset is too steep or shallow

// Confirm rotation:
angle = new_angle;
relative_angle = angle_wrap(angle - gravity_angle());
mask_rotation = new_rotation;
