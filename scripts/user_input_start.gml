/// user_input_start(type, [device])

// Return held input:
if(argument[0] == "held"){
    if(argument_count >= 2) {
        if(argument[1] == "keyboard") return ctrl_input.keyboard_start;
        else if(argument[1] == "gamepad") return ctrl_input.gamepad_start;
        else return ctrl_input.input_start;
    } else return ctrl_input.input_start;
}

// Return pressed input:
if(argument[0] == "pressed"){
    if(argument_count >= 2) {
        if(argument[1] == "keyboard") return ctrl_input.keyboard_start_pressed;
        else if(argument[1] == "gamepad") return ctrl_input.gamepad_start_pressed;
        else return ctrl_input.input_start_pressed;
    } else return ctrl_input.input_start_pressed;
}

// Return released input:
if(argument[0] == "released"){
    if(argument_count >= 2) {
        if(argument[1] == "keyboard") return ctrl_input.keyboard_start_released;
        else if(argument[1] == "gamepad") return ctrl_input.gamepad_start_released;
        else return ctrl_input.input_start_released;
    } else return ctrl_input.input_start_released;
}
