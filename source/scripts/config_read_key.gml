/// config_read_key()
/// @desc Reads the keyboard list from the keyboard map.
/// @returns {void}

with (ctrl_config) ds_list_read(keyboard_list, config_get("input_keyboard"));
