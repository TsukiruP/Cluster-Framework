/// debug_option_gamepad_index(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var player_index; player_index = rebind_device - DEV_GAMEPAD0;

switch (_index)
{
    // Text:
    case 0:
        return "Gamepad:";

    // Value:
    case 1:
        return string(gamepad_get(player_index));

    // Change:
    case 3:
        if (_execute)
        {
            var gamepad_index; gamepad_index = gamepad_get(player_index);

            gamepad_index += menu_x_direction;
            while (gamepad_exists(gamepad_index)) gamepad_index += menu_x_direction;
            gamepad_index = wrap(gamepad_index, -2, -1 + joystick_count());
            gamepad_set(player_index, gamepad_index);
        }

        return true;

    // Undefined:
    default:
        return undefined;
}