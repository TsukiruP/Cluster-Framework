/// debug_option_gamepad_player(return)
/// @param {int} return
/// @returns {any}

var _return; _return = argument0;

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
        input_device = modwrap(input_device + menu_x_direction, 0, PLAYER_COUNT) + DEV_GAMEPAD0;
        return true;

    // Undefined:
    default:
        return undefined;
}