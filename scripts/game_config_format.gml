/// game_config_format()
// Sets config map to default values.

var i;

// Interface:
game_config_set("interface_red", 0);
game_config_set("interface_green", 24);
game_config_set("interface_blue", 176);
game_config_set("interface_alpha", 0.6);

// Screen:
game_config_set("screen_mode", 0);
game_config_set("screen_ratio", 0);
game_config_set("screen_scale", 1);
game_config_set("screen_full", false);

// Audio:
game_config_set("audio_sfx", 50);
game_config_set("audio_bgm", 0);

// Keyboard:
game_keyboard_format();

// Gamepad:
for (i = 0; i < PLAYER_COUNT; i += 1)
{
    var gamepad_string;

    gamepad_string = "input_gamepad" + string(i);
    game_gamepad_format(i);
    game_config_set(gamepad_string + "_deadzone", 0.1);
    game_config_set(gamepad_string + "_confirm", 0);
    game_config_set(gamepad_string + "_style", 0);
    game_gamepad_confirm(i);
}

game_config_set("input_gamepad_focus", true);

// Gameplay:
game_config_set("gameplay_shields", 0);
game_config_set("gameplay_debuffs", true);
game_config_set("gameplay_checkpoint", true);

// Advance:
game_config_set("advance_turn", true);
game_config_set("advance_brake", true);
game_config_set("advance_hurt", true);
game_config_set("advance_flicker", true);

// Misc.:
game_config_set("misc_hud", 1);
game_config_set("misc_status", 1);
game_config_set("misc_feed", true);
game_config_set("misc_trails", true);
game_config_set("misc_reticle", 1);
game_config_set("misc_tally", true);
