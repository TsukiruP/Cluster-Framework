/// game_config_read_key()
/* Reads the keyboard list to the config map. */

with (ctrl_game) ds_list_read(keyboard_list, game_get_config("input_keyboard"));
