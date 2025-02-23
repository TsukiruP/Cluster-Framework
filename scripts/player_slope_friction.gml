/// player_slope_friction(friction)
/// @desc Applies slope friction.
/// @param {number} friection
/// @returns {void}

var _friction; _friction = argument0;

// Abort if...
if (x_speed == 0 && input_lock_alarm <= 0) exit; // Not moving
if (relative_angle > 135 && relative_angle < 225) exit; // Attached to a ceiling
if (relative_angle < 22.5 || relative_angle > 337.5) exit; // Surface is too shallow

// Apply
x_speed -= dsin(relative_angle) * _friction;