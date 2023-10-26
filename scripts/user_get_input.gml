/// user_get_input(input, check, [device])
// Returns true if the given input passes the given check on the given device.

if(argument_count > 2) {
    if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_input[argument[0], argument[1]];
    else if(argument[2] == DEV_JOYSTICK0) return ctrl_input.joystick_input[argument[0], argument[1]];
} else return ctrl_input.user_input[argument[0], argument[1]];
