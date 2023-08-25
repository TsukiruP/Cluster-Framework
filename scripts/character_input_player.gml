/// character_input_player()

// Held inputs:
input_left    = user_get_input(INP_LEFT, CHECK_HELD);
input_right   = user_get_input(INP_RIGHT, CHECK_HELD);
input_up      = user_get_input(INP_UP, CHECK_HELD);
input_down    = user_get_input(INP_DOWN, CHECK_HELD);

input_jump    = user_get_input(INP_JUMP, CHECK_HELD);
input_special = user_get_input(INP_SPECIAL, CHECK_HELD);
input_swap    = user_get_input(INP_SWAP, CHECK_HELD);
input_tag     = user_get_input(INP_TAG, CHECK_HELD);
input_super   = user_get_input(INP_SUPER, CHECK_HELD);

// Pressed inputs:
input_left_pressed    = user_get_input(INP_LEFT, CHECK_PRESSED);
input_right_pressed   = user_get_input(INP_RIGHT, CHECK_PRESSED);
input_up_pressed      = user_get_input(INP_UP, CHECK_PRESSED);
input_down_pressed    = user_get_input(INP_DOWN, CHECK_PRESSED);

input_jump_pressed    = user_get_input(INP_JUMP, CHECK_PRESSED);
input_special_pressed = user_get_input(INP_SPECIAL, CHECK_PRESSED);
input_swap_pressed    = user_get_input(INP_SWAP, CHECK_PRESSED);
input_tag_pressed     = user_get_input(INP_TAG, CHECK_PRESSED);
input_super_pressed   = user_get_input(INP_SUPER, CHECK_PRESSED);

// Released inputs:
input_left_released    = user_get_input(INP_LEFT, CHECK_RELEASED);
input_right_released   = user_get_input(INP_RIGHT, CHECK_RELEASED);
input_up_released      = user_get_input(INP_UP, CHECK_RELEASED);
input_down_released    = user_get_input(INP_DOWN, CHECK_RELEASED);

input_jump_released    = user_get_input(INP_JUMP, CHECK_RELEASED);
input_special_released = user_get_input(INP_SPECIAL, CHECK_RELEASED);
input_swap_released    = user_get_input(INP_SWAP, CHECK_RELEASED);
input_tag_released     = user_get_input(INP_TAG, CHECK_RELEASED);
input_super_released   = user_get_input(INP_SUPER, CHECK_RELEASED);
