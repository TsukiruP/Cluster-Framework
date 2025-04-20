/// audio_reset_volume()
/// @desc Resets audio volume to config values..
/// @returns {void}

sound_kind_volume(0, game_config_get("audio_sfx") / 100);
sound_kind_volume(1, game_config_get("audio_bgm") / 100);
sound_kind_volume(3, game_config_get("audio_bgm") / 100);
