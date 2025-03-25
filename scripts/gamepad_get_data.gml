/// gamepad_get_data(player, [data])
/// @desc Returns gamepad data from the input controller.
/// @param {int} player
/// @param {int} [data]
/// @returns {int}

var _player; _player = argument[0];
var _data; if (argument_count > 1) _data = argument[1]; else _data = 0;

with (ctrl_input)
{
    return gamepad_data[_player, _data];
}
