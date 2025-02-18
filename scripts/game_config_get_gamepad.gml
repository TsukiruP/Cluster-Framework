/// game_config_get_gamepad(device, key)
/// @desc Returns the value corresponding to the gamepad key.
/// @param {int} device
/// @param {int} key
/// @returns {int}

var _device; _device = argument0;
var _key; _key = argument1;

with (ctrl_game) return ds_map_get(ds_list_find_value(gamepad_list, _device), _key);
