/// joystick_check(player, button)
// Returns if the given player is currently holding the given button.

with(ctrl_input) {
    var device_id, button_id;

    // Device id:
    device_id = joystick_device[argument0, 0];

    // Check device id:
    if(device_id <= -1) exit;

    if(joystick_exists(device_id)) {
        switch(argument1) {
            case JOY_TRIGGERL:
                return joystick_trigger[INP_LEFT, CHECK_HELD + (argument0 * 3)];
                break;

            case JOY_TRIGGERR:
                return joystick_trigger[INP_RIGHT, CHECK_HELD + (argument0 * 3)];
                break;

            case JOY_LEFT:
                return joystick_dpad[INP_LEFT, CHECK_HELD + (argument0 * 3)]
                break;

            case JOY_RIGHT:
                return joystick_dpad[INP_RIGHT, CHECK_HELD + (argument0 * 3)];
                break;

            case JOY_UP:
                return joystick_dpad[INP_UP, CHECK_HELD + (argument0 * 3)];
                break;

            case JOY_DOWN:
                button_state = joystick_dpad[INP_DOWN, CHECK_HELD + (argument0 * 3)];
                break;

            default:
                // Button id:
                button_id = joystick_button[argument1, joystick_device[argument0, 1]];

                return joystick_check_button(device_id, button_id);
        }
    }
}
