/// player_surface_splash()
/// @desc Creates a splash effect for jumping and landing on a water surface.
/// @returns {void}

if (underwater) exit;

var surface_inst; surface_inst = collision_point(x, floor(y) + y_radius + 1, obj_water_mask, false, false);

if (on_ground && surface_inst != noone) effect_create(x, surface_inst.y, sequence_splash_3, depth, image_xscale);