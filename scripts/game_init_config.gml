/// game_init_config()
/* Initializes config. */

config_directory = "data\saves\"
config_map = ds_map_create();
keyboard_list = ds_list_create();
//gamepad_list = ds_list_create();
game_reset_config();
game_read_config();
game_config_read_key();
