/// gamepad_exists(gamepad)
/// @desc Returns whether a gamepad exists in the gamepad list.
/// @param {int} gamepad
/// @returns {bool}

var _gamepad; _gamepad = argument0;

with (ctrl_input)
{
    return (_gamepad > -1 && ds_list_find_index(gamepad_list, _gamepad) != -1);
}
