/// game_config_set_confirm(device)
/// @desc Sets the confirm and cancel of a gamepad.
/// @param {int} device
/// @returns {void}

var _device; _device = argument0;

switch (game_config_get_gamepad(_device, "input_confirm"))
{
    // Nintendo:
    case 1:
        game_config_set_button(_device, INP_CONFIRM, PAD_FACE2);
        game_config_set_button(_device, INP_CANCEL, PAD_FACE1);
        break;

    // Xbox:
    default:
        game_config_set_button(_device, INP_CONFIRM, PAD_FACE1);
        game_config_set_button(_device, INP_CANCEL, PAD_FACE2);
}
