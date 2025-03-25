/// debug_option_gamepad_index(return)
/// @param {int} return
/// @returns {any}

var _return; _return = argument0;

var player_index; player_index = input_device - DEV_GAMEPAD0;

switch (_return)
{
    // Text:
    case 0:
        return "Gamepad:";

    // Value:
    case 1:
        return string(gamepad_get(player_index));

    // Update:
    case 3:
        var gamepad_index; gamepad_index = gamepad_get(player_index);

        gamepad_index += menu_x_direction;
        while (gamepad_exists(gamepad_index)) gamepad_index += menu_x_direction;
        gamepad_index = wrap(gamepad_index, -2, -1 + joystick_count());
        gamepad_set(player_index, gamepad_index);
        return true;

    // Undefined:
    default:
        return undefined;
}