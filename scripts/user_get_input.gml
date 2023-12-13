/// user_get_input(input, check, [device])
// Returns true if the given input passes the given check on the given device.

// Return ANY held input:
if(argument[0] == INP_ANY) {
    if(argument[1] == CHECK_HELD) {
        var keyboard_any, joystick1_any, joystick2_any;

        keyboard_any  = keyboard_check(vk_anykey);
        joystick1_any = false;
        joystick2_any = false;

        // Any joystick 1 input:
        if(ctrl_input.joystick_device[0, 0] > -1) {
            var device_id, button_id;

            // Device id:
            device_id = ctrl_input.joystick_device[0, 0];

            for(i = 0; i < joystick_buttons(device_id); i += 1) {
                if(joystick_check_button(device_id, i) ||
                    joystick_axis(device_id, ctrl_input.joystick_button[JOY_TRIGGERL, ctrl_input.joystick_device[0, 1]]) != -1 ||
                    joystick_axis(device_id, ctrl_input.joystick_button[JOY_TRIGGERR, ctrl_input.joystick_device[0, 1]]) != -1 ||
                    (joystick_has_pov(device_id) && joystick_pov_direction(device_id) != -1)) joystick1_any = true;
            }
        }

        // Any joystick 2 input:
        if(ctrl_input.joystick_device[1, 0] > -1) {
            var device_id, button_id;

            // Device id:
            device_id = ctrl_input.joystick_device[1, 0];

            for(i = 0; i < joystick_buttons(device_id); i += 1) {
                if(joystick_check_button(device_id, i) ||
                    joystick_axis(device_id, ctrl_input.joystick_button[JOY_TRIGGERL, ctrl_input.joystick_device[0, 1]]) != -1 ||
                    joystick_axis(device_id, ctrl_input.joystick_button[JOY_TRIGGERR, ctrl_input.joystick_device[0, 1]]) != -1 ||
                    (joystick_has_pov(device_id) && joystick_pov_direction(device_id) != -1)) joystick2_any = true;
            }
        }

        // Return any input:
        if(argument_count > 2) {
            if(argument[2] == DEV_KEYBOARD) return keyboard_any;
            else if(argument[2] == DEV_JOYSTICK0) return joystick1_any;
            else if(argument[2] == DEV_JOYSTICK1) return joystick2_any;
        } else return (keyboard_any || joystick1_any)
    } else return false;
} else {
    // Return a specific input:
    if(argument_count > 2) {
        if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_input[argument[0], argument[1]];
        else if(argument[2] == DEV_JOYSTICK0) return ctrl_input.joystick_input[argument[0], argument[1]];
        else if(argument[2] == DEV_JOYSTICK1) return ctrl_input.joystick_input[argument[0], argument[1] + 3];
    } else return ctrl_input.user_input[argument[0], argument[1]];
}
