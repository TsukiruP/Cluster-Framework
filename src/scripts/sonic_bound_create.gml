/// sonic_bound_create()
/// @desc Creates Sonic's bound effect every 2 frames.
/// @returns {bool}

if (animation_time mod 2 == 0) effect_create(x, y, seq_bound_jump, 10);
