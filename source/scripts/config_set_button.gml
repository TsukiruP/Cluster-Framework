/// config_set_button(gamepad, input, button)
/// @desc Sets the button of an input.
/// @param {int} gamepad
/// @param {int} input
/// @param {int} button
/// @returns {void}

var _gamepad; _gamepad = argument0;
var _input; _input = argument1;
var _button; _button = argument2;

with (ctrl_config) ds_list_replace(ds_map_get(ds_list_find_value(gamepad_list, _gamepad), "input_list"), _input, _button);
