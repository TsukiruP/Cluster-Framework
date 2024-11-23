/// game_gamepad_confirm(id)
// Sets the confirm and cancel buttons of a gamepad list.

switch (game_setting_get("input_gamepad" + string(argument0) + "_confirm"))
{
    // Nintendo:
    case 1:
        game_gamepad_set(argument0, INP_CONFIRM, PAD_FACE2);
        game_gamepad_set(argument0, INP_CANCEL, PAD_FACE1);
        break;


    // Xbox:
    default:
        game_gamepad_set(argument0, INP_CONFIRM, PAD_FACE1);
        game_gamepad_set(argument0, INP_CANCEL, PAD_FACE2);
}
