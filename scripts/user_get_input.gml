/// user_get_input(input, check, [device], [gamepad id])
// Returns true if the given input passes the given check on the given device. Assumes user/player 1 if no gamepad id is given.

if(argument_count > 2) {
    if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_input[argument[0], argument[1]];
    else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_input[argument[0], argument[1]];
} else return ctrl_input.user_input[argument[0], argument[1]];
