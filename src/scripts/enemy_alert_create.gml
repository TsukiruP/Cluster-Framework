/// enemy_alert_create()
/// @desc Creates an alert above the enemy.
/// @returns {void}

effect_create(x, y - 40 * sign(image_yscale), seq_enemy_alert);
audio_play_sfx("snd_enemy_alert", true);
