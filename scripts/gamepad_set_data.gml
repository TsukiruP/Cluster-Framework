/// gamepad_set_data(player, data, val)
/// @desc Sets gamepad data in the input controller.
/// @param {int} player
/// @param {int} data
/// @param {int} val
/// @returns {void}

var _player; _player = argument0;
var _data; _data = argument1;
var _val; _val = argument2;

with (ctrl_input)
{
    gamepad_data[_player, _data] = _val;
}
