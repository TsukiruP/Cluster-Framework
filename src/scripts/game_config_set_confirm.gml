/// game_config_set_confirm(gamepad)
/// @desc Sets the confirm and cancel of a gamepad.
/// @param {int} gamepad
/// @returns {void}

var _gamepad; _gamepad = argument0;

switch (game_config_get_gamepad(_gamepad, "input_confirm"))
{
    // Nintendo:
    case 1:
        game_config_set_button(_gamepad, INP_CONFIRM, PAD_FACE2);
        game_config_set_button(_gamepad, INP_CANCEL, PAD_FACE1);
        break;

    // Xbox:
    default:
        game_config_set_button(_gamepad, INP_CONFIRM, PAD_FACE1);
        game_config_set_button(_gamepad, INP_CANCEL, PAD_FACE2);
}