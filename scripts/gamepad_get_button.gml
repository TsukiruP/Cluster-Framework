/// gamepad_get_button(gamepad, button)
/// @desc Returns a button index of a gamepad.
/// @param {int} gamepad
/// @param {int} button
/// @returns {int}

var _gamepad; _gamepad = argument0;
var _button; _button = argument1;

with (ctrl_input)
{
    if (joystick_exists(_gamepad))
    {
        var layout_index; layout_index = 0;

        if (!joystick_has_pov(_gamepad))
        {
            switch (joystick_name(_gamepad))
            {
                case "Nintendo Switch Pro Controller":
                    layout_index = 2;
                    break;

                default:
                    layout_index = 1;
            }
        }
    }

    return gamepad_button[_button, layout_index];
}