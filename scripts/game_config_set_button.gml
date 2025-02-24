/// game_config_set_button(device, input, button)
/// @desc Sets the button of an input.
/// @param {int} device
/// @param {int} input
/// @param {int} button
/// @returns {void}

var _device; _device = argument0;
var _input; _input = argument1;
var _button; _button = argument2;

with (ctrl_game) ds_list_replace(ds_map_get(ds_list_find_value(gamepad_list, _device), "input_list"), _input, _button);