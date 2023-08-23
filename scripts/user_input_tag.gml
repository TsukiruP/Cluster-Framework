/// user_input_tag(type, [device])

// Return held input:
if(argument[0] == "held"){
    if(argument_count >= 2) {
        if(argument[1] == "keyboard") return ctrl_input.keyboard_tag;
        else if(argument[1] == "gamepad") return ctrl_input.gamepad_tag;
        else return ctrl_input.input_tag;
    } else return ctrl_input.input_tag;
}

// Return pressed input:
if(argument[0] == "pressed"){
    if(argument_count >= 2) {
        if(argument[1] == "keyboard") return ctrl_input.keyboard_tag_pressed;
        else if(argument[1] == "gamepad") return ctrl_input.gamepad_tag_pressed;
        else return ctrl_input.input_tag_pressed;
    } else return ctrl_input.input_tag_pressed;
}

// Return released input:
if(argument[0] == "released"){
    if(argument_count >= 2) {
        if(argument[1] == "keyboard") return ctrl_input.keyboard_tag_released;
        else if(argument[1] == "gamepad") return ctrl_input.gamepad_tag_released;
        else return ctrl_input.input_tag_released;
    } else return ctrl_input.input_tag_released;
}
