/// user_input_jump(type, [device])

// Return held input:
if(argument[0] == "held"){
    if(argument_count >= 2) {
        if(argument[1] == "keyboard") return ctrl_input.keyboard_jump;
        else if(argument[1] == "gamepad") return ctrl_input.gamepad_jump;
        else return ctrl_input.input_jump;
    } else return ctrl_input.input_jump;
}

// Return pressed input:
if(argument[0] == "pressed"){
    if(argument_count >= 2) {
        if(argument[1] == "keyboard") return ctrl_input.keyboard_jump_pressed;
        else if(argument[1] == "gamepad") return ctrl_input.gamepad_jump_pressed;
        else return ctrl_input.input_jump_pressed;
    } else return ctrl_input.input_jump_pressed;
}

// Return released input:
if(argument[0] == "released"){
    if(argument_count >= 2) {
        if(argument[1] == "keyboard") return ctrl_input.keyboard_jump_released;
        else if(argument[1] == "gamepad") return ctrl_input.gamepad_jump_released;
        else return ctrl_input.input_jump_released;
    } else return ctrl_input.input_jump_released;
}
