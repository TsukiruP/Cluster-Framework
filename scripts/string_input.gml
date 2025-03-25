/// string_input(input, [device])
/// @desc Returns a string depending on the input and device.
/// @param {int} input
/// @param {int} [device]
/// @returns {string}

var _input; _input = argument[0];
var _device; if (argument_count > 1) _device = argument[1]; else _device = 0;

_input = pick(_input == INP_ANY, _input, irandom_range(INP_UP, INP_HIDE));

if (_device == DEV_KEYBOARD) return string_key(game_config_get_key(_input));
else if (_device >= DEV_GAMEPAD0)
{
    _device -= DEV_GAMEPAD0;
    return string_button(game_config_get_button(_device, _input), game_config_get_gamepad(_device, "input_style"));
}
else
{
    if (gamepad_get(0) > -1) return string_input(_input, DEV_GAMEPAD0);
    return string_input(_input, DEV_KEYBOARD);
}
