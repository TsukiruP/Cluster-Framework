/// input_get_string(input, [device])
// Returns the string of the indicated input.

var input_id, input_device;

// Input id:
input_id = argument[0];

if (input_id == INP_ANY) {
    input_id = irandom_range(INP_UP, INP_HELP);
}

// Set device:
if (argument_count >= 2) {
    input_device = argument[1];
} else {
    input_device = DEV_USER;
}

// Keyboard:
if (input_device == DEV_KEYBOARD) {
    // Return:
    return key_get_string(global.input_key[input_id]);
}

// Joystick:
else if (input_device >= DEV_JOYSTICK0) {
    var joystick_id;

    // Joystick offset:
    input_device -= DEV_JOYSTICK0;

    // Return:
    return joy_get_char(global.input_joy[input_device, input_id], global.input_style[input_device]);
}

// User:
else {
    // Return joystick if it's connected:
    if (ctrl_input.joystick_device[0, 0] > -1) {
        return input_get_string(input_id, DEV_JOYSTICK0);
    }
    
    // Default to keyboard otherwise:
    else {
        return input_get_string(input_id, DEV_KEYBOARD);
    }
}
