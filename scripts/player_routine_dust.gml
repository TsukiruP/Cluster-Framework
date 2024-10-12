/// player_routine_dust()
// Creates the brake effect every 4 frames.

if (animation_timer mod 4 == 0) {
    var sine, csine;

    sine  = dsin(mask_rotation);
    csine = dcos(mask_rotation);

    effect_create(ctl_brake, x + sine * y_radius, y + csine * y_radius);
}
