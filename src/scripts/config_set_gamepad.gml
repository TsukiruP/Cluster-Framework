/// config_set_gamepad(gamepad, key, val)
/// @desc Sets the value of a gamepad key.
/// @param {int} gamepad
/// @param {string} key
/// @param val
/// @returns {void}

var _gamepad; _gamepad = argument0;
var _key; _key = argument1;
var _val; _val = argument2;

with (ctrl_config) ds_map_set(ds_list_find_value(gamepad_list, _gamepad), _key, _val);
