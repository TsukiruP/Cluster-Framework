/// user_input_special(type, [device])

// Return held input:
if(argument[0] == "held"){
    if(argument_count >= 2) {
        if(argument[1] == "keyboard") return ctrl_input.keyboard_special;
        else if(argument[1] == "gamepad") return ctrl_input.gamepad_special;
        else return ctrl_input.input_special;
    } else return ctrl_input.input_special;
}

// Return pressed input:
if(argument[0] == "pressed"){
    if(argument_count >= 2) {
        if(argument[1] == "keyboard") return ctrl_input.keyboard_special_pressed;
        else if(argument[1] == "gamepad") return ctrl_input.gamepad_special_pressed;
        else return ctrl_input.input_special_pressed;
    } else return ctrl_input.input_special_pressed;
}

// Return released input:
if(argument[0] == "released"){
    if(argument_count >= 2) {
        if(argument[1] == "keyboard") return ctrl_input.keyboard_special_released;
        else if(argument[1] == "gamepad") return ctrl_input.gamepad_special_released;
        else return ctrl_input.input_special_released;
    } else return ctrl_input.input_special_released;
}
