/// config_set_key(input, key)
/// @desc Sets the key of an input.
/// @param {int} input
/// @param {int} key
/// @returns {void}

var _input; _input = argument0;
var _key; _key = argument1;

with (ctrl_config) ds_list_replace(keyboard_list, _input, _key);
