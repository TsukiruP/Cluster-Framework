/// debug_option_gamepad_player(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_index)
{
    // Text:
    case 0:
        return "Player:";

    // Value:
    case 1:
        return string(rebind_device - DEV_GAMEPAD0);

    // Change:
    case 3:
        if (_execute) rebind_device = modwrap(rebind_device + menu_x_direction, 0, PLAYER_COUNT) + DEV_GAMEPAD0;
        return true;

    // Undefined:
    default:
        return undefined;
}