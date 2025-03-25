/// gamepad_get_any(gamepad, check)
/// @desc Returns any button that fulfills the check. Uses the button array.
/// @param {int} gamepad
/// @param {int} check
/// @returns {int}

var _gamepad; _gamepad = argument0;
var _check; _check = argument1;

for ({var i; i = PAD_FACE1}; i <= PAD_SHARE; i += 1)
{
    if (gamepad_get_check(_gamepad, i, _check)) return i;
}

return PAD_NONE;
