/// player_routine_dust()
// Creates the brake effect every 4 frames.

if (animation_timer mod 4 == 0) {
    effect_create(ctl_brake, x, y + y_radius);
}
