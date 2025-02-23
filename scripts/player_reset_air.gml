/// player_reset_air()
/* Sets the player into an aerial state. */

if (y_speed < 0)
{
    player_surface_splash();
}

angle = gravity_direction;
relative_angle = 0;
mask_rotation = angle;

ground_inst = noone;
on_ground = false;
