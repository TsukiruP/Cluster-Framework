/// config_get_gamepad(gamepad, key)
/// @desc Returns the value corresponding to the gamepad key.
/// @param {int} gamepad
/// @param {string} key
/// @returns {int}

var _gamepad; _gamepad = argument0;
var _key; _key = argument1;

with (ctrl_config) return ds_map_get(ds_list_find_value(gamepad_list, _gamepad), _key);
