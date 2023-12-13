/// character_input_player()

// Held inputs:
input_left    = input_check(INP_LEFT, CHECK_HELD);
input_right   = input_check(INP_RIGHT, CHECK_HELD);
input_up      = input_check(INP_UP, CHECK_HELD);
input_down    = input_check(INP_DOWN, CHECK_HELD);

input_jump    = input_check(INP_JUMP, CHECK_HELD);
input_special = input_check(INP_SPECIAL, CHECK_HELD);
input_swap    = input_check(INP_SWAP, CHECK_HELD);
input_tag     = input_check(INP_TAG, CHECK_HELD);
input_super   = input_check(INP_SUPER, CHECK_HELD);

// Pressed inputs:
input_left_pressed    = input_check(INP_LEFT, CHECK_PRESSED);
input_right_pressed   = input_check(INP_RIGHT, CHECK_PRESSED);
input_up_pressed      = input_check(INP_UP, CHECK_PRESSED);
input_down_pressed    = input_check(INP_DOWN, CHECK_PRESSED);

input_jump_pressed    = input_check(INP_JUMP, CHECK_PRESSED);
input_special_pressed = input_check(INP_SPECIAL, CHECK_PRESSED);
input_swap_pressed    = input_check(INP_SWAP, CHECK_PRESSED);
input_tag_pressed     = input_check(INP_TAG, CHECK_PRESSED);
input_super_pressed   = input_check(INP_SUPER, CHECK_PRESSED);

// Released inputs:
input_left_released    = input_check(INP_LEFT, CHECK_RELEASED);
input_right_released   = input_check(INP_RIGHT, CHECK_RELEASED);
input_up_released      = input_check(INP_UP, CHECK_RELEASED);
input_down_released    = input_check(INP_DOWN, CHECK_RELEASED);

input_jump_released    = input_check(INP_JUMP, CHECK_RELEASED);
input_special_released = input_check(INP_SPECIAL, CHECK_RELEASED);
input_swap_released    = input_check(INP_SWAP, CHECK_RELEASED);
input_tag_released     = input_check(INP_TAG, CHECK_RELEASED);
input_super_released   = input_check(INP_SUPER, CHECK_RELEASED);
