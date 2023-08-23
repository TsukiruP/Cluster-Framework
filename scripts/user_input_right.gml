/// user_input_right(type, [device])

// Return held input:
if(argument[0] == "held"){
    if(argument_count >= 2) {
        if(argument[1] == "keyboard") return ctrl_input.keyboard_right;
        else if(argument[1] == "gamepad") return ctrl_input.gamepad_right;
        else return ctrl_input.input_right;
    } else return ctrl_input.input_right;
}

// Return pressed input:
if(argument[0] == "pressed"){
    if(argument_count >= 2) {
        if(argument[1] == "keyboard") return ctrl_input.keyboard_right_pressed;
        else if(argument[1] == "gamepad") return ctrl_input.gamepad_right_pressed;
        else return ctrl_input.input_right_pressed;
    } else return ctrl_input.input_right_pressed;
}

// Return released input:
if(argument[0] == "released"){
    if(argument_count >= 2) {
        if(argument[1] == "keyboard") return ctrl_input.keyboard_right_released;
        else if(argument[1] == "gamepad") return ctrl_input.gamepad_right_released;
        else return ctrl_input.input_right_released;
    } else return ctrl_input.input_right_released;
}
