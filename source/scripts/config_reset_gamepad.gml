/// config_reset_gamepad(gamepad)
/// @desc Resets the gamepad map.
/// @param {int} gamepad
/// @returns {void}

var _gamepad; _gamepad = argument0;

config_reset_button(_gamepad);
config_set_gamepad(_gamepad, "input_deadzone", 0.05);
config_set_gamepad(_gamepad, "input_confirm", 0);
config_set_gamepad(_gamepad, "input_style", 0);
config_set_confirm(_gamepad);
