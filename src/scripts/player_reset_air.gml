/// player_reset_air()
/// @desc Resets the player's ground variables.
/// @returns {void}

if (y_speed < 0) player_jump_splash_create();
angle = gravity_direction;
relative_angle = 0;
mask_direction = angle;
ground_inst = noone;
on_ground = false;
