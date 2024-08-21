/// player_rotate_mask()
// Rotates the player's mask along uneven ground.

// Abort if not colliding with the ground:
if (collision_box(y_radius * 2, x_radius, (mask_rotation mod 180 != 0), ground_id) == noone) {
    exit;
}

var difference, new_rotation, new_angle, new_difference;

// Calculate offsets:
difference   = angle_difference(mask_rotation, angle); // Rotational offset between angle and mask rotation
new_rotation = angle_wrap(mask_rotation + 90 * sign(difference)); // New mask rotation

// Calculate ground angle from new mask rotation:
new_angle = player_get_angle(ground_id, new_rotation);

// Calculate new offset:
new_difference = angle_difference(mask_rotation, new_angle);

// Abort:
if (sign(difference) != sign(new_difference)) {
    exit; // Rotating the wrong way
}

if (abs(difference) < 45 || abs(new_difference) < 45 || abs(new_difference) >= 90) {
    exit; // Offsets are too steep or shallow
}

if (angle == new_angle || difference == new_difference) {
    exit; // Angles and offsets are the same (i.e., no rotation)
}

// Confirm rotation:
mask_rotation = new_rotation;
player_set_ground(ground_id);
