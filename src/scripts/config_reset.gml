/// config_reset()
/// @desc Resets the config map.
/// @returns {void}

config_reset_interface();
config_reset_screen();
config_reset_audio();

config_reset_key();
config_write_key();

for ({var i; i = 0}; i < PLAYER_COUNT; i += 1)
{
    config_reset_gamepad(i)
}

config_write_gamepad();
config_reset_input_background();

config_reset_gameplay();
config_reset_advance();
config_reset_misc();
