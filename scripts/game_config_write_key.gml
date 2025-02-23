/// game_config_write_key()
/// @desc Writes the keyboard list to the config map.
/// @returns {void}

with (ctrl_game) game_set_config("input_keyboard", ds_list_write(keyboard_list));