/// config_init()
/// @desc Initializes game config.
/// @returns {void}

config_directory = "data\saves\"
config_map = ds_map_create();
keyboard_list = ds_list_create();
gamepad_list = ds_list_create();
config_init_gamepad();
config_reset();
config_read();
