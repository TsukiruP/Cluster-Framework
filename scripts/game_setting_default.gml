/// game_setting_default()
// Sets setting map to default values.

var i;

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
game_setting_set("audio_sfx", 0.5);
game_setting_set("audio_bgm", 0);

// Keyboard:
game_keyboard_default();
game_setting_set("input_keyboard", ds_list_write(keyboard_list));

// Gamepad:
for (i = 0; i < game_get_player_count(); i += 1)
{
    var gamepad_string;

    gamepad_string = "input_gamepad" + string(i);
    game_gamepad_default(i);
    game_setting_set(gamepad_string, ds_list_write(gamepad_list[i]));
    game_setting_set(gamepad_string + "_deadzone", 0.1);
    game_setting_set(gamepad_string + "_confirm", 0);
    game_setting_set(gamepad_string + "_style", 0);
}

game_setting_set("input_gamepad_focus", true);

// Gameplay:
game_setting_set("gameplay_shields", 0);
game_setting_set("gameplay_debuffs", true);
game_setting_set("gameplay_checkpoint", true);

// Advance:
game_setting_set("advance_turn", true);
game_setting_set("advance_brake", true);
game_setting_set("advance_hurt", true);
game_setting_set("advance_flicker", true);

// Misc.:
game_setting_set("misc_hud", 1);
game_setting_set("misc_status", 1);
game_setting_set("misc_feed", true);
game_setting_set("misc_trail", true);
game_setting_set("misc_reticle", 1);
game_setting_set("misc_tally", true);
