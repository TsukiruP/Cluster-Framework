/// gamepad_get(player)
/// @desc Returns gamepad index corresponding to the player.
/// @param {int} player
/// @returns {int}

var _player; _player = argument0;

with (ctrl_input)
{
    return ds_list_find_value(gamepad_list, _player);
}