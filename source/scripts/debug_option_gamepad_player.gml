/// debug_option_gamepad_player(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_index)
{
    case OPTION_TEXT:
        return "Player:";

    case OPTION_VALUE:
        return string(rebind_device - DEV_GAMEPAD0);
    
    case OPTION_SELECT:
        if (_execute) text_set_body("Sets which player's input to display.");
        return true;

    case OPTION_CHANGE:
        if (_execute) rebind_device = modwrap(rebind_device + menu_x_direction, 0, PLAYER_COUNT) + DEV_GAMEPAD0;
        return true;

    default:
        return undefined;
}