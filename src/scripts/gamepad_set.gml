/// gamepad_set(player, gamepad)
/// @desc Sets the player's gamepad.
/// @params {int} player
/// @params {int} gamepad

var _player; _player = argument0;
var _gamepad; _gamepad = argument1;

with (ctrl_input)
{
    ds_list_replace(gamepad_list, _player, _gamepad);
}
