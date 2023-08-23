/// user_input_left(type, [device])

// Return held input:
if(argument[0] == "held"){
    if(argument_count >= 2) {
        if(argument[1] == "keyboard") return ctrl_input.keyboard_left;
        else if(argument[1] == "gamepad") return ctrl_input.gamepad_left;
        else return ctrl_input.input_left;
    } else return ctrl_input.input_left;
}

// Return pressed input:
if(argument[0] == "pressed"){
    if(argument_count >= 2) {
        if(argument[1] == "keyboard") return ctrl_input.keyboard_left_pressed;
        else if(argument[1] == "gamepad") return ctrl_input.gamepad_left_pressed;
        else return ctrl_input.input_left_pressed;
    } else return ctrl_input.input_left_pressed;
}

// Return released input:
if(argument[0] == "released"){
    if(argument_count >= 2) {
        if(argument[1] == "keyboard") return ctrl_input.keyboard_left_released;
        else if(argument[1] == "gamepad") return ctrl_input.gamepad_left_released;
        else return ctrl_input.input_left_released;
    } else return ctrl_input.input_left_released;
}
