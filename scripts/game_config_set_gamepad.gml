/// game_config_set_gamepad(device, key, value)
/// @desc Sets the value of a gamepad key.
/// @param {int} device
/// @param {int} key
/// @param value
/// @returns {void}

var _device; _device = argument0;
var _key; _key = argument1;
var _value; _value = argument2;

with (ctrl_game) ds_map_set(ds_list_find_value(gamepad_list, _device), _key, _value);
