/// game_config_set_confirm(index)
/* Sets the confirm and cancel buttons of a gamepad list. */

switch (game_config_get_gamepad(argument0, "input_confirm"))
{
    // Nintendo:
    case 1:
        game_config_set_btn(argument0, INP_CONFIRM, PAD_FACE2);
        game_config_set_btn(argument0, INP_CANCEL, PAD_FACE1);
        break;

    // Xbox:
    default:
        game_config_set_btn(argument0, INP_CONFIRM, PAD_FACE1);
        game_config_set_btn(argument0, INP_CANCEL, PAD_FACE2);
}
