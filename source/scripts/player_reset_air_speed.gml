/// player_reset_air_speed()
/// @desc Resets the player's speed before resetting their ground variables.
/// @returns {void}

var g_speed; g_speed = x_speed;

x_speed = dcos(relative_angle) * g_speed;
y_speed = -(dsin(relative_angle) * g_speed);
player_reset_air();
