/// game_config_reset()
/// @desc Resets the config map.
/// @returns {void}

game_config_set("interface_red", 0);
game_config_set("interface_green", 24);
game_config_set("interface_blue", 176);
game_config_set("interface_alpha", 0.6);

game_config_set("screen_mode", 0);
game_config_set("screen_ratio", 0);
game_config_set("screen_scale", 1);
game_config_set("screen_full", false);

game_config_set("audio_sfx", 50);
game_config_set("audio_bgm", 0);

game_config_reset_key();
game_config_write_key();

for ({var i; i = 0}; i < PLAYER_COUNT; i += 1)
{
    game_config_reset_gamepad(i)
}

game_config_write_gamepad();
game_config_set("input_gamepad_focus", true);

game_config_set("gameplay_shields", 0);
game_config_set("gameplay_debuffs", true);
game_config_set("gameplay_bonuses", true);

game_config_set("advance_turn", true);
game_config_set("advance_brake", true);
game_config_set("advance_hurt", true);
game_config_set("advance_flicker", true);

game_config_set("misc_hud", 1);
game_config_set("misc_status", 1);
game_config_set("misc_feed", true);
game_config_set("misc_trails", true);
game_config_set("misc_reticle", 1);
game_config_set("misc_tally", false);
