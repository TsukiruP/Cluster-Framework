/// game_reset_config()
/* Resets config map. */

var i;

game_set_config("interface_red", 0);
game_set_config("interface_green", 24);
game_set_config("interface_blue", 176);
game_set_config("interface_alpha", 0.6);

game_set_config("screen_mode", 0);
game_set_config("screen_ratio", 0);
game_set_config("screen_scale", 1);
game_set_config("screen_full", false);

game_set_config("audio_sfx", 50);
game_set_config("audio_bgm", 0);

game_config_reset_key();

for (i = 0; i < PLAYER_COUNT; i += 1)
{
    var gamepad_string;

    gamepad_string = "input_gamepad" + string(i);
    game_config_reset_btn(i);
    game_set_config(gamepad_string + "_deadzone", 0.1);
    game_set_config(gamepad_string + "_confirm", 0);
    game_set_config(gamepad_string + "_style", 0);
    game_config_set_confirm(i);
}

game_set_config("input_gamepad_focus", true);

game_set_config("gameplay_shields", 0);
game_set_config("gameplay_debuffs", true);
game_set_config("gameplay_bonuses", true);

game_set_config("advance_turn", true);
game_set_config("advance_brake", true);
game_set_config("advance_hurt", true);
game_set_config("advance_flicker", true);

game_set_config("misc_hud", 1);
game_set_config("misc_status", 1);
game_set_config("misc_feed", true);
game_set_config("misc_trails", true);
game_set_config("misc_reticle", 1);
game_set_config("misc_tally", false);
