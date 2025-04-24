/// game_reset_config()
/// @desc Resets the config map.
/// @returns {void}

config_set("interface_red", 0);
config_set("interface_green", 24);
config_set("interface_blue", 176);
config_set("interface_alpha", 0.6);

config_set("screen_mode", 0);
config_set("screen_ratio", 0);
config_set("screen_scale", 1);
config_set("screen_full", false);

config_set("audio_sfx", 50);
config_set("audio_bgm", 0);

config_reset_key();
config_write_key();

for ({var i; i = 0}; i < PLAYER_COUNT; i += 1)
{
    config_reset_gamepad(i)
}

config_write_gamepad();
config_set("input_gamepad_focus", true);

config_set("gameplay_shields", 0);
config_set("gameplay_debuffs", true);
config_set("gameplay_bonuses", true);

config_set("advance_turn", true);
config_set("advance_brake", true);
config_set("advance_hurt", true);
config_set("advance_flicker", true);

config_set("misc_hud", 1);
config_set("misc_status", 1);
config_set("misc_feed", true);
config_set("misc_trails", true);
config_set("misc_reticle", 1);
config_set("misc_tally", false);
