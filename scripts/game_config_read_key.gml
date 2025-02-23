/// game_config_read_key()
/// @desc Reads the keyboard list from the keyboard map.
/// @returns {void}

with (ctrl_game) ds_list_read(keyboard_list, game_get_config("input_keyboard"));