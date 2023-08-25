/// user_get_input(input, check, [device])

switch(argument[0]) {
    // Left:
    case INP_LEFT:
        // Hold:
        if(argument[1] == CHECK_HELD) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_left;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_left;
            } else return ctrl_input.input_left;
        }

        // Press:
        if(argument[1] == CHECK_PRESSED) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_left_pressed;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_left_pressed;
            } else return ctrl_input.input_left_pressed;
        }

        // Release:
        if(argument[1] == CHECK_RELEASED) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_left_released;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_left_released;
            } else return ctrl_input.input_left_released;
        }
        break;

    // Right:
    case INP_RIGHT:
        // Hold:
        if(argument[1] == CHECK_HELD) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_right;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_right;
            } else return ctrl_input.input_right;
        }

        // Press:
        if(argument[1] == CHECK_PRESSED) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_right_pressed;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_right_pressed;
            } else return ctrl_input.input_right_pressed;
        }

        // Release:
        if(argument[1] == CHECK_RELEASED) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_right_released;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_right_released;
            } else return ctrl_input.input_right_released;
        }
        break;

    // Up:
    case INP_UP:
        // Hold:
        if(argument[1] == CHECK_HELD) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_up;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_up;
            } else return ctrl_input.input_up;
        }

        // Press:
        if(argument[1] == CHECK_PRESSED) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_up_pressed;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_up_pressed;
            } else return ctrl_input.input_up_pressed;
        }

        // Release:
        if(argument[1] == CHECK_RELEASED) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_up_released;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_up_released;
            } else return ctrl_input.input_up_released;
        }
        break;

    // Down:
    case INP_DOWN:
        // Hold:
        if(argument[1] == CHECK_HELD) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_down;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_down;
            } else return ctrl_input.input_down;
        }

        // Press:
        if(argument[1] == CHECK_PRESSED) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_down_pressed;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_down_pressed;
            } else return ctrl_input.input_down_pressed;
        }

        // Release:
        if(argument[1] == CHECK_RELEASED) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_down_released;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_down_released;
            } else return ctrl_input.input_down_released;
        }
        break;

    // Jump:
    case INP_JUMP:
        // Hold:
        if(argument[1] == CHECK_HELD) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_jump;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_jump;
            } else return ctrl_input.input_jump;
        }

        // Press:
        if(argument[1] == CHECK_PRESSED) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_jump_pressed;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_jump_pressed;
            } else return ctrl_input.input_jump_pressed;
        }

        // Release:
        if(argument[1] == CHECK_RELEASED) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_jump_released;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_jump_released;
            } else return ctrl_input.input_jump_released;
        }
        break;

    // Special:
    case INP_SPECIAL:
        // Hold:
        if(argument[1] == CHECK_HELD) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_special;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_special;
            } else return ctrl_input.input_special;
        }

        // Press:
        if(argument[1] == CHECK_PRESSED) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_special_pressed;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_special_pressed;
            } else return ctrl_input.input_special_pressed;
        }

        // Release:
        if(argument[1] == CHECK_RELEASED) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_special_released;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_special_released;
            } else return ctrl_input.input_special_released;
        }
        break;

    // Swap:
    case INP_SWAP:
        // Hold:
        if(argument[1] == CHECK_HELD) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_swap;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_swap;
            } else return ctrl_input.input_swap;
        }

        // Press:
        if(argument[1] == CHECK_PRESSED) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_swap_pressed;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_swap_pressed;
            } else return ctrl_input.input_swap_pressed;
        }

        // Release:
        if(argument[1] == CHECK_RELEASED) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_swap_released;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_swap_released;
            } else return ctrl_input.input_swap_released;
        }
        break;

    // Tag:
    case INP_TAG:
        // Hold:
        if(argument[1] == CHECK_HELD) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_tag;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_tag;
            } else return ctrl_input.input_tag;
        }

        // Press:
        if(argument[1] == CHECK_PRESSED) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_tag_pressed;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_tag_pressed;
            } else return ctrl_input.input_tag_pressed;
        }

        // Release:
        if(argument[1] == CHECK_RELEASED) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_tag_released;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_tag_released;
            } else return ctrl_input.input_tag_released;
        }
        break;

    // Super:
    case INP_SUPER:
        // Hold:
        if(argument[1] == CHECK_HELD) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_super;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_super;
            } else return ctrl_input.input_super;
        }

        // Press:
        if(argument[1] == CHECK_PRESSED) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_super_pressed;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_super_pressed;
            } else return ctrl_input.input_super_pressed;
        }

        // Release:
        if(argument[1] == CHECK_RELEASED) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_super_released;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_super_released;
            } else return ctrl_input.input_super_released;
        }
        break;

    // Start:
    case INP_START:
        // Hold:
        if(argument[1] == CHECK_HELD) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_start;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_start;
            } else return ctrl_input.input_start;
        }

        // Press:
        if(argument[1] == CHECK_PRESSED) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_start_pressed;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_start_pressed;
            } else return ctrl_input.input_start_pressed;
        }

        // Release:
        if(argument[1] == CHECK_RELEASED) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_start_released;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_start_released;
            } else return ctrl_input.input_start_released;
        }
        break;

    // Super:
    case INP_SUPER:
        // Hold:
        if(argument[1] == CHECK_HELD) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_super;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_super;
            } else return ctrl_input.input_super;
        }

        // Press:
        if(argument[1] == CHECK_PRESSED) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_super_pressed;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_super_pressed;
            } else return ctrl_input.input_super_pressed;
        }

        // Release:
        if(argument[1] == CHECK_RELEASED) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_super_released;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_super_released;
            } else return ctrl_input.input_super_released;
        }
        break;

    // Select:
    case INP_SELECT:
        // Hold:
        if(argument[1] == CHECK_HELD) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_select;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_select;
            } else return ctrl_input.input_select;
        }

        // Press:
        if(argument[1] == CHECK_PRESSED) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_select_pressed;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_select_pressed;
            } else return ctrl_input.input_select_pressed;
        }

        // Release:
        if(argument[1] == CHECK_RELEASED) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_select_released;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_select_released;
            } else return ctrl_input.input_select_released;
        }
        break;

    // Accept:
    case INP_ACCEPT:
        // Hold:
        if(argument[1] == CHECK_HELD) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_accept;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_accept;
            } else return ctrl_input.input_accept;
        }

        // Press:
        if(argument[1] == CHECK_PRESSED) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_accept_pressed;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_accept_pressed;
            } else return ctrl_input.input_accept_pressed;
        }

        // Release:
        if(argument[1] == CHECK_RELEASED) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_accept_released;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_accept_released;
            } else return ctrl_input.input_accept_released;
        }
        break;

    // Cancel:
    case INP_CANCEL:
        // Hold:
        if(argument[1] == CHECK_HELD) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_cancel;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_cancel;
            } else return ctrl_input.input_cancel;
        }

        // Press:
        if(argument[1] == CHECK_PRESSED) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_cancel_pressed;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_cancel_pressed;
            } else return ctrl_input.input_cancel_pressed;
        }

        // Release:
        if(argument[1] == CHECK_RELEASED) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_cancel_released;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_cancel_released;
            } else return ctrl_input.input_cancel_released;
        }
        break;

    // Help:
    case INP_HELP:
        // Hold:
        if(argument[1] == CHECK_HELD) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_help;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_help;
            } else return ctrl_input.input_help;
        }

        // Press:
        if(argument[1] == CHECK_PRESSED) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_help_pressed;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_help_pressed;
            } else return ctrl_input.input_help_pressed;
        }

        // Release:
        if(argument[1] == CHECK_RELEASED) {
            if(argument_count > 2) {
                if(argument[2] == DEV_KEYBOARD) return ctrl_input.keyboard_help_released;
                else if(argument[2] == DEV_GAMEPAD) return ctrl_input.gamepad_help_released;
            } else return ctrl_input.input_help_released;
        }
        break;
}
