/// game_config_init()
/// @desc Initializes game config.
/// @returns {void}

config_directory = "data\saves\"
config_map = ds_map_create();
keyboard_list = ds_list_create();
gamepad_list = ds_list_create();
game_config_init_gamepad();
game_config_reset();
game_config_read();
