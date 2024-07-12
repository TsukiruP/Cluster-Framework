/// input_get_check(input, check, [device])
// Returns whether the input meets the check.

var input_device, input_keyboard, input_joystick, input_user;

// Default to false:
input_keyboard = false;
input_joystick = false;

// Set device:
if (argument_count > 2) {
    input_device = argument[2];
} else {
    input_device = DEV_USER;
}

// Keyboard:
if (input_device == DEV_KEYBOARD) {
    // Any:
    if (argument[0] == INP_ANY) {
        switch (argument[1]) {
            // Pressed:
            case CHECK_PRESSED:
                input_keyboard = keyboard_check_pressed(vk_anykey);
                break;

            // Released:
            case CHECK_RELEASED:
                input_keyboard = keyboard_check_released(vk_anykey);
                break;

            // Held:
            default:
                input_keyboard = keyboard_check(vk_anykey);
        }
    }

    else {
        input_keyboard = ctrl_input.input_keyboard[argument[0], argument[1]];
    }

    return input_keyboard;
    /*
    var key_target;

    // Key:
    if (argument[0] == INP_ANY) {
        key_target = vk_anykey;
    } else {
        key_target = global.input_key[argument[0]];
    }

    switch (argument[1]) {
        // Pressed:
        case CHECK_PRESSED:
            input_keyboard = keyboard_check_pressed(key_target);
            break;

        // Released:
        case CHECK_RELEASED:
            input_keyboard = keyboard_check_released(key_target);
            break;

        // Held:
        default:
            input_keyboard = keyboard_check(key_target);
    }
    */
}

// Joystick:
else if (input_device >= DEV_JOYSTICK0) {
    var joystick_id;

    // Joystick offset:
    input_device -= 2;

    // Joystick id:
    joystick_id = ctrl_input.joystick_device[input_device, 0];

    // Joystick range:
    if (argument[0] == INP_ANY) {
        for (i = JOY_FACE1; i <= JOY_SHARE; i+= 1) {
            if (joystick_get_check(input_device, i, argument[1])) {
                input_joystick = true;
            }
        }
    } else {
        input_joystick = ctrl_input.input_joystick[argument[0], argument[1] + (input_device * 3)];
    }

    return input_joystick;
    /*
    var joystick_id;

    // Joystick offset:
    input_device -= 2;

    // Joystick id:
    joystick_id = ctrl_input.joystick_device[input_device, 0];

    // Joystick range:
    if (argument[0] == INP_ANY) {
        for (i = JOY_FACE1; i <= JOY_SHARE; i+= 1) {
            if (joystick_get_check(input_device, i, argument[1])) {
                input_joystick = true;
            }
        }
    } else {
        input_joystick = joystick_get_check(input_device, global.input_joy[argument[0], input_device], argument[1]);
    }
    */
}

// User:
else {
    if (argument[0] == INP_ANY) {
        input_user = (input_get_check(argument[0], argument[1], DEV_KEYBOARD) || input_get_check(argument[0], argument[1], DEV_JOYSTICK0));
    } else {
        input_user = ctrl_input.input_user[argument[0], argument[1]];
    }
}

// Return:
//return (input_keyboard || input_joystick);
