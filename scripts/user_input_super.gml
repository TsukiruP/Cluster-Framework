/// user_input_super(type, [device])

// Return held input:
if(argument[0] == "held"){
    if(argument_count >= 2) {
        if(argument[1] == "keyboard") return ctrl_input.keyboard_super;
        else if(argument[1] == "gamepad") return ctrl_input.gamepad_super;
        else return ctrl_input.input_super;
    } else return ctrl_input.input_super;
}

// Return pressed input:
if(argument[0] == "pressed"){
    if(argument_count >= 2) {
        if(argument[1] == "keyboard") return ctrl_input.keyboard_super_pressed;
        else if(argument[1] == "gamepad") return ctrl_input.gamepad_super_pressed;
        else return ctrl_input.input_super_pressed;
    } else return ctrl_input.input_super_pressed;
}

// Return released input:
if(argument[0] == "released"){
    if(argument_count >= 2) {
        if(argument[1] == "keyboard") return ctrl_input.keyboard_super_released;
        else if(argument[1] == "gamepad") return ctrl_input.gamepad_super_released;
        else return ctrl_input.input_super_released;
    } else return ctrl_input.input_super_released;
}
