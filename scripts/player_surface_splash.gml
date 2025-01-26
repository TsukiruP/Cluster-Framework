/// player_surface_splash()
/* Shorthand for the splash made for jumping and landing on the water's surface. */

var surface_handle;

surface_handle = collision_point(x, floor(y) + y_radius + 1, obj_water_mask, false, false);

if (on_ground && surface_handle != noone)
{
    effect_create(sequence_splash_3, x, surface_handle.y, depth, image_xscale);
}
