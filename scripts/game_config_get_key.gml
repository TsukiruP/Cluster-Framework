/// game_config_get_key(input)
/// @desc Returns the key corresponding to the input.
/// @param {int} input
/// @returns {int}

var _input; _input = argument0;

with (ctrl_game) return ds_list_find_value(keyboard_list, _input);