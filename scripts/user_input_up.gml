/// user_input_up(type, [device])

// Return held input:
if(argument[0] == "held"){
    if(argument_count >= 2) {
        if(argument[1] == "keyboard") return ctrl_input.keyboard_up;
        else if(argument[1] == "gamepad") return ctrl_input.gamepad_up;
        else return ctrl_input.input_up;
    } else return ctrl_input.input_up;
}

// Return pressed input:
if(argument[0] == "pressed"){
    if(argument_count >= 2) {
        if(argument[1] == "keyboard") return ctrl_input.keyboard_up_pressed;
        else if(argument[1] == "gamepad") return ctrl_input.gamepad_up_pressed;
        else return ctrl_input.input_up_pressed;
    } else return ctrl_input.input_up_pressed;
}

// Return released input:
if(argument[0] == "released"){
    if(argument_count >= 2) {
        if(argument[1] == "keyboard") return ctrl_input.keyboard_up_released;
        else if(argument[1] == "gamepad") return ctrl_input.gamepad_up_released;
        else return ctrl_input.input_up_released;
    } else return ctrl_input.input_up_released;
}
