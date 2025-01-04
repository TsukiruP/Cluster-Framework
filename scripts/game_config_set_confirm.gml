/// game_config_set_confirm(id)
// Sets the confirm and cancel buttons of a gamepad list.

switch (game_get_config("input_gamepad" + string(argument0) + "_confirm"))
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
