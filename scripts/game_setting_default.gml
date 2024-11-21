/// game_setting_default()
// Sets the setting map to default values.

// Interface:
game_setting_set("interface_red", 0);
game_setting_set("interface_green", 24);
game_setting_set("interface_blue", 176);
game_setting_set("interface_alpha", 0.6);

// Screen:
game_setting_set("screen_mode", 0);
game_setting_set("screen_ratio", 0);
game_setting_set("screen_scale", 1);
game_setting_set("screen_full", false);
game_setting_set("screen_vsync", false);

// Audio:
game_setting_set("audio_bgm", 1);
game_setting_set("audio_sfx", 1);

// Gameplay:
game_setting_set("gameplay_shields", 0);
game_setting_set("gameplay_debuffs", true);
game_setting_set("gameplay_checkpoint", true);

// Advance:
game_setting_set("advance_turn", true);
game_setting_set("advance_brake", true);
game_setting_set("advance_hurt", true);
game_setting_set("advance_flicker", false);

// Misc.:
game_setting_set("misc_hud", 1);
game_setting_set("misc_status", 1);
game_setting_set("misc_feed", true);
game_setting_set("misc_trails", true);
game_setting_set("misc_reticle", 1);
game_setting_set("misc_tally", true);
