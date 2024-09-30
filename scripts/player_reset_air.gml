/// player_reset_air()
// Sets the player into an aerial state.

angle = gravity_angle();
relative_angle = 0;
mask_rotation = angle;

ground_id = noone;
on_ground = false;
on_surface = false;
