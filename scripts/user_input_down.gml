/// user_input_down(type, [device])

// Return held input:
if(argument[0] == "held"){
    if(argument_count >= 2) {
        if(argument[1] == "keyboard") return ctrl_input.keyboard_down;
        else if(argument[1] == "gamepad") return ctrl_input.gamepad_down;
        else return ctrl_input.input_down;
    } else return ctrl_input.input_down;
}

// Return pressed input:
if(argument[0] == "pressed"){
    if(argument_count >= 2) {
        if(argument[1] == "keyboard") return ctrl_input.keyboard_down_pressed;
        else if(argument[1] == "gamepad") return ctrl_input.gamepad_down_pressed;
        else return ctrl_input.input_down_pressed;
    } else return ctrl_input.input_down_pressed;
}

// Return released input:
if(argument[0] == "released"){
    if(argument_count >= 2) {
        if(argument[1] == "keyboard") return ctrl_input.keyboard_down_released;
        else if(argument[1] == "gamepad") return ctrl_input.gamepad_down_released;
        else return ctrl_input.input_down_released;
    } else return ctrl_input.input_down_released;
}
