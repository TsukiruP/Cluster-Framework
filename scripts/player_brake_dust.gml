/// player_brake_dust()
/* Creates the brake effect every 4 frames. */

if (animation_time mod 4 == 0)
{
    var sine, csine;

    sine = dsin(mask_rotation);
    csine = dcos(mask_rotation);
    effect_create(x + sine * y_radius, y + csine * y_radius, sequence_brake);
}
