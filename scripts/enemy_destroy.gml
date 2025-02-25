/// enemy_destroy()
/// @desc Creates an explosion effect.
/// @returns {void}

audio_play_sfx("snd_destroy", true);
effect_create(x, y, pick(collision_point(x, y, obj_water_mask, true, false) == noone, sequence_explosion_water, sequence_explosion_enemy), -depth);
