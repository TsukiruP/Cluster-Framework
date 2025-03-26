/// debug_option_gamepad_player(return, [execute])
/// @param {int} return
/// @param {bool} [execute]
/// @returns {any}

var _return; _return = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_return)
{
    // Text:
    case 0:
        return "Player:";

    // Value:
    case 1:
        return string(input_device - DEV_GAMEPAD0);

    // Update:
    case 3:
        if (_execute) input_device = modwrap(input_device + menu_x_direction, 0, PLAYER_COUNT) + DEV_GAMEPAD0;
        return true;

    // Undefined:
    default:
        return undefined;
}