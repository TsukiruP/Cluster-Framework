/// player_effect_splash()
// Creates the splash effect at the bottom of the player.

if (on_surface == true) {
    effect_create(ctl_splash_3, x, obj_water_surface.y, depth, image_xscale);
}
