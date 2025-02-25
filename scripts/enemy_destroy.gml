/// enemy_destroy()
/// @desc Enemy variant of instance_destroy().
/// @returns {void}

audio_play_sfx("snd_destroy", true);
effect_create(x, y, pick(place_meeting(x, y, obj_water_mask), sequence_explosion_enemy, sequence_explosion_water), -depth);
instance_destroy();
