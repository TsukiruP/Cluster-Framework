/// player_reset_air()
/// @desc Resets the players solid variables.
/// @returns {void}

if (y_speed < 0) player_surface_splash();

angle = gravity_direction;
relative_angle = 0;
mask_rotation = angle;
ground_inst = noone;
on_ground = false;
