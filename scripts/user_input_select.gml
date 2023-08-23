/// user_input_select(type, [device])

// Return held input:
if(argument[0] == "held"){
    if(argument_count >= 2) {
        if(argument[1] == "keyboard") return ctrl_input.keyboard_select;
        else if(argument[1] == "gamepad") return ctrl_input.gamepad_select;
        else return ctrl_input.input_select;
    } else return ctrl_input.input_select;
}

// Return pressed input:
if(argument[0] == "pressed"){
    if(argument_count >= 2) {
        if(argument[1] == "keyboard") return ctrl_input.keyboard_select_pressed;
        else if(argument[1] == "gamepad") return ctrl_input.gamepad_select_pressed;
        else return ctrl_input.input_select_pressed;
    } else return ctrl_input.input_select_pressed;
}

// Return released input:
if(argument[0] == "released"){
    if(argument_count >= 2) {
        if(argument[1] == "keyboard") return ctrl_input.keyboard_select_released;
        else if(argument[1] == "gamepad") return ctrl_input.gamepad_select_released;
        else return ctrl_input.input_select_released;
    } else return ctrl_input.input_select_released;
}
