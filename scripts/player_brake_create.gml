/// player_brake_create()
/// @desc Creates a new brake effect every 4 frames.
/// @returns {void}

if (animation_time mod 4 == 0) player_ground_effect_create(seq_brake);
