/// game_config_reset()
/// @desc Resets the config map.
/// @returns {void}

game_config_reset_interface();
game_config_reset_screen();
game_config_reset_audio();

game_config_reset_key();
game_config_write_key();

for ({var i; i = 0}; i < PLAYER_COUNT; i += 1)
{
    game_config_reset_gamepad(i)
}

game_config_write_gamepad();
game_config_reset_input_background();

game_config_reset_gameplay();
game_config_reset_advance();
game_config_reset_misc();
