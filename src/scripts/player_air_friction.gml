/// player_air_friction()
/// @desc Applies air friction.
/// @returns {void}

if (abs(x_speed) > air_friction_threshold && y_speed > -4 && y_speed < 0) x_speed *= air_friction;
