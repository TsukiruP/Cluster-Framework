/// config_get_button(gamepad, input)
/// @desc Returns the button corresponding to the input.
/// @param {int} gamepad
/// @param {int} input
/// @returns {int}

var _gamepad; _gamepad = argument0;
var _input; _input = argument1;

with (ctrl_config) return ds_list_find_value(ds_map_get(ds_list_find_value(gamepad_list, _gamepad), "input_list"), _input);
