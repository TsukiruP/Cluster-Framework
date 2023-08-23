/// user_input_swap(type, [device])

// Return held input:
if(argument[0] == "held"){
    if(argument_count >= 2) {
        if(argument[1] == "keyboard") return ctrl_input.keyboard_swap;
        else if(argument[1] == "gamepad") return ctrl_input.gamepad_swap;
        else return ctrl_input.input_swap;
    } else return ctrl_input.input_swap;
}

// Return pressed input:
if(argument[0] == "pressed"){
    if(argument_count >= 2) {
        if(argument[1] == "keyboard") return ctrl_input.keyboard_swap_pressed;
        else if(argument[1] == "gamepad") return ctrl_input.gamepad_swap_pressed;
        else return ctrl_input.input_swap_pressed;
    } else return ctrl_input.input_swap_pressed;
}

// Return released input:
if(argument[0] == "released"){
    if(argument_count >= 2) {
        if(argument[1] == "keyboard") return ctrl_input.keyboard_swap_released;
        else if(argument[1] == "gamepad") return ctrl_input.gamepad_swap_released;
        else return ctrl_input.input_swap_released;
    } else return ctrl_input.input_swap_released;
}
