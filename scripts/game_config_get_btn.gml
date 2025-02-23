/// game_config_get_btn(device, input)
/// @desc Returns the button corresponding to the input.
/// @param {int} device
/// @param {int} input
/// @returns {int}

var _device; _device = argument0;
var _input; _input = argument1;

with (ctrl_game) return ds_list_find_value(ds_map_get(ds_list_find_value(gamepad_list, _device), "input_list"), _input);