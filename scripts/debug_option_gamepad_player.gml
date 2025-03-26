/// debug_option_gamepad_player(index, [event])
/// @param {int} index
/// @param {bool} [event]
/// @returns {any}

var _index; _index = argument[0];
var _event; if (argument_count > 1) _event = argument[1]; else _event = true;

switch (_index)
{
    // Text:
    case 0:
        return "Player:";

    // Value:
    case 1:
        return string(input_device - DEV_GAMEPAD0);

    // Change:
    case 3:
        if (_event) input_device = modwrap(input_device + menu_x_direction, 0, PLAYER_COUNT) + DEV_GAMEPAD0;
        return true;

    // Undefined:
    default:
        return undefined;
}