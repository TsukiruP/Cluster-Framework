/// input_check(input, check, [device])
// Returns true if the given input passes the given check on the given device.

// Return ANY input:
if(argument[0] == INP_ANY) {
    var keyboard_any, joystick_target, joystick_any;

    joystick_any = false;

    switch(argument[1]) {
        case CHECK_HELD:
            // Keyboard:
            keyboard_any  = keyboard_check(vk_anykey);

            // Joysticks:
            if(argument_count > 2) {
                if(argument[2] > DEV_KEYBOARD) joystick_target = argument[2] - 1;
                else exit;
            } else joystick_target = 0;

            for(i = JOY_FACE1; i <= JOY_SHARE; i += 1) {
                if(joystick_check(joystick_target, i)) {
                    joystick_any = true;
                    break;
                }
            }
            break;

        case CHECK_PRESSED:
            // Keyboard:
            keyboard_any = keyboard_check_pressed(vk_anykey);

            // Joysticks:
            if(argument_count > 2) {
                if(argument[2] > DEV_KEYBOARD) joystick_target = argument[2] - 1;
                else exit;
            } else joystick_target = 0;

            for(i = JOY_FACE1; i <= JOY_SHARE; i += 1) {
                if(joystick_check_pressed(joystick_target, i)) {
                    joystick_any = true;
                    break;
                }
            }
            break;

        case CHECK_RELEASED:
            // Keyboard:
            keyboard_any = keyboard_check_released(vk_anykey);

            // Joysticks:
            if(argument_count > 2) {
                if(argument[2] > DEV_KEYBOARD) joystick_target = argument[2] - 1;
                else exit;
            } else joystick_target = 0;

            for(i = JOY_FACE1; i <= JOY_SHARE; i += 1) {
                if(joystick_check_released(joystick_target, i)) {
                    joystick_any = true;
                    break;
                }
            }
            break;
    }

    // Return a specific device:
    if(argument_count > 2) {
        if(argument[2] > DEV_KEYBOARD) return joystick_any;
        else return keyboard_any;
    } else return (keyboard_any || joystick_any);
}

// Return a specific input:
else {
    // Return a specific device:
    if(argument_count > 2) {
        if(argument[2] > DEV_KEYBOARD) return ctrl_input.joystick_input[argument[0], argument[1] + 3 * (argument[2] - 1)];
        else return ctrl_input.keyboard_input[argument[0], argument[1]];
    } else return ctrl_input.user_input[argument[0], argument[1]];
}
