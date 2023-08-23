/// user_input_cancel(type, [device])

// Return held input:
if(argument[0] == "held"){
    if(argument_count >= 2) {
        if(argument[1] == "keyboard") return ctrl_input.keyboard_cancel;
        else if(argument[1] == "gamepad") return ctrl_input.gamepad_cancel;
        else return ctrl_input.input_cancel;
    } else return ctrl_input.input_cancel;
}

// Return pressed input:
if(argument[0] == "pressed"){
    if(argument_count >= 2) {
        if(argument[1] == "keyboard") return ctrl_input.keyboard_cancel_pressed;
        else if(argument[1] == "gamepad") return ctrl_input.gamepad_cancel_pressed;
        else return ctrl_input.input_cancel_pressed;
    } else return ctrl_input.input_cancel_pressed;
}

// Return released input:
if(argument[0] == "released"){
    if(argument_count >= 2) {
        if(argument[1] == "keyboard") return ctrl_input.keyboard_cancel_released;
        else if(argument[1] == "gamepad") return ctrl_input.gamepad_cancel_released;
        else return ctrl_input.input_cancel_released;
    } else return ctrl_input.input_cancel_released;
}
