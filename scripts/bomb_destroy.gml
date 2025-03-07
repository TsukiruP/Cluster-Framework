/// bomb_destroy()
/// @desc Bomb variant of enemy_destroy().
/// @returns {void}

effect_create(x, y, pick(position_meeting(x, y, obj_water_mask), seq_explosion_large, seq_explosion_water), -depth);
enemy_debris_create();
audio_play_sfx("snd_explosion4", true);
instance_destroy();
