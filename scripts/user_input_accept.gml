/// user_input_accept(type, [device])

// Return held input:
if(argument[0] == "held"){
    if(argument_count >= 2) {
        if(argument[1] == "keyboard") return ctrl_input.keyboard_accept;
        else if(argument[1] == "gamepad") return ctrl_input.gamepad_accept;
        else return ctrl_input.input_accept;
    } else return ctrl_input.input_accept;
}

// Return pressed input:
if(argument[0] == "pressed"){
    if(argument_count >= 2) {
        if(argument[1] == "keyboard") return ctrl_input.keyboard_accept_pressed;
        else if(argument[1] == "gamepad") return ctrl_input.gamepad_accept_pressed;
        else return ctrl_input.input_accept_pressed;
    } else return ctrl_input.input_accept_pressed;
}

// Return released input:
if(argument[0] == "released"){
    if(argument_count >= 2) {
        if(argument[1] == "keyboard") return ctrl_input.keyboard_accept_released;
        else if(argument[1] == "gamepad") return ctrl_input.gamepad_accept_released;
        else return ctrl_input.input_accept_released;
    } else return ctrl_input.input_accept_released;
}
