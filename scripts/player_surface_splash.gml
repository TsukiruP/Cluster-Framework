/// player_surface_splash()
/* Shorthand for the splash made for jumping and landing on the water's surface. */

if (on_ground && on_surface)
{
    effect_create(sequence_splash_3, x, obj_water_surface.y, depth, image_xscale);
}
