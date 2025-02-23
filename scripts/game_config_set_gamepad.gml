/// game_config_set_gamepad(device, key, val)
/// @desc Sets the value of a gamepad key.
/// @param {int} device
/// @param {string} key
/// @param val
/// @returns {void}

var _device; _device = argument0;
var _key; _key = argument1;
var _val; _val = argument2;

with (ctrl_game) ds_map_set(ds_list_find_value(gamepad_list, _device), _key, _val);