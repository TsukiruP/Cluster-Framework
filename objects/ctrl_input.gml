#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Input Initialization

// Held inputs:
input_left    = false;
input_right   = false;
input_up      = false;
input_down    = false;

input_jump    = false;
input_special = false;
input_swap    = false;
input_tag     = false;
input_super   = false;

input_start   = false;
input_select  = false;
input_accept  = false;
input_cancel  = false;
input_help    = false;

// Pressed inputs:
input_left_pressed    = false;
input_right_pressed   = false;
input_up_pressed      = false;
input_down_pressed    = false;

input_jump_pressed    = false;
input_special_pressed = false;
input_swap_pressed    = false;
input_tag_pressed     = false;
input_super_pressed   = false;

input_start_pressed   = false;
input_select_pressed  = false;
input_accept_pressed  = false;
input_cancel_pressed  = false;
input_help_pressed    = false;

// Released inputs:
input_left_released    = false;
input_right_released   = false;
input_up_released      = false;
input_down_released    = false;

input_jump_released    = false;
input_special_released = false;
input_swap_released    = false;
input_tag_released     = false;
input_super_released   = false;

input_start_released   = false;
input_select_released  = false;
input_accept_released  = false;
input_cancel_released  = false;
input_help_released    = false;

// Input timers:
input_left_timer  = 0;
input_right_timer = 0;
input_up_timer    = 0;
input_down_timer  = 0;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Keyboard Initialization

// Held inputs:
keyboard_left    = false;
keyboard_right   = false;
keyboard_up      = false;
keyboard_down    = false;

keyboard_jump    = false;
keyboard_special = false;
keyboard_swap    = false;
keyboard_tag     = false;
keyboard_super   = false;

keyboard_start   = false;
keyboard_select  = false;
keyboard_accept  = false;
keyboard_cancel  = false;
keyboard_help    = false;

// Pressed inputs:
keyboard_left_pressed    = false;
keyboard_right_pressed   = false;
keyboard_up_pressed      = false;
keyboard_down_pressed    = false;

keyboard_jump_pressed    = false;
keyboard_special_pressed = false;
keyboard_swap_pressed    = false;
keyboard_tag_pressed     = false;
keyboard_super_pressed   = false;

keyboard_start_pressed   = false;
keyboard_select_pressed  = false;
keyboard_accept_pressed  = false;
keyboard_cancel_pressed  = false;
keyboard_help_pressed    = false;

// Released inputs:
keyboard_left_released    = false;
keyboard_right_released   = false;
keyboard_up_released      = false;
keyboard_down_released    = false;

keyboard_jump_released    = false;
keyboard_special_released = false;
keyboard_swap_released    = false;
keyboard_tag_released     = false;
keyboard_super_released   = false;

keyboard_start_released   = false;
keyboard_select_released  = false;
keyboard_accept_released  = false;
keyboard_cancel_released  = false;
keyboard_help_released    = false;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Gamepad Initialization

// Held inputs:
gamepad_left    = false;
gamepad_right   = false;
gamepad_up      = false;
gamepad_down    = false;

gamepad_jump    = false;
gamepad_special = false;
gamepad_swap    = false;
gamepad_tag     = false;
gamepad_super   = false;

gamepad_start   = false;
gamepad_select  = false;
gamepad_accept  = false;
gamepad_cancel  = false;
gamepad_help    = false;

// Pressed inputs:
gamepad_left_pressed    = false;
gamepad_right_pressed   = false;
gamepad_up_pressed      = false;
gamepad_down_pressed    = false;

gamepad_jump_pressed    = false;
gamepad_special_pressed = false;
gamepad_swap_pressed    = false;
gamepad_tag_pressed     = false;
gamepad_super_pressed   = false;

gamepad_start_pressed   = false;
gamepad_select_pressed  = false;
gamepad_accept_pressed  = false;
gamepad_cancel_pressed  = false;
gamepad_help_pressed    = false;

// Released inputs:
gamepad_left_released    = false;
gamepad_right_released   = false;
gamepad_up_released      = false;
gamepad_down_released    = false;

gamepad_jump_released    = false;
gamepad_special_released = false;
gamepad_swap_released    = false;
gamepad_tag_released     = false;
gamepad_super_released   = false;

gamepad_start_released   = false;
gamepad_select_released  = false;
gamepad_accept_released  = false;
gamepad_cancel_released  = false;
gamepad_help_released    = false;

// Joystick axis:
joystick_left  = false;
joystick_right = false;
joystick_up    = false;
joystick_down  = false;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Gamepad Accept
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update General Input

/*
if(global.gamepad_device != -1) {
    input_left    = (keyboard_left || gamepad_left);
    input_right   = (keyboard_right || gamepad_right);
    input_up      = (keyboard_up || gamepad_up);
    input_down    = (keyboard_down || gamepad_down);

    input_jump    = (keyboard_jump || gamepad_jump);
    input_special = (keyboard_special || gamepad_special);
    input_swap    = (keyboard_swap || gamepad_swap);
    input_tag     = (keyboard_tag || gamepad_tag);
    input_super   = (keyboard_super || gamepad_super);

    input_start   = (keyboard_start || gamepad_start);
    input_select  = (keyboard_select || gamepad_select);
    input_accept  = (keyboard_accept || gamepad_accept);
    input_cancel  = (keyboard_cancel || gamepad_cancel);
    input_help    = (keyboard_help || gamepad_help);

    // Pressed inputs:
    input_left_pressed    = (keyboard_left_pressed || gamepad_left_pressed);
    input_right_pressed   = (keyboard_right_pressed || gamepad_right_pressed);
    input_up_pressed      = (keyboard_up_pressed || gamepad_up_pressed);
    input_down_pressed    = (keyboard_down_pressed || gamepad_down_pressed);

    input_jump_pressed    = (keyboard_jump_pressed || gamepad_jump_pressed);
    input_special_pressed = (keyboard_special_pressed || gamepad_special_pressed);
    input_swap_pressed    = (keyboard_swap_pressed || gamepad_swap_pressed);
    input_tag_pressed     = (keyboard_tag_pressed || gamepad_tag_pressed);
    input_super_pressed   = (keyboard_super_pressed || gamepad_super_pressed);

    input_start_pressed   = (keyboard_start_pressed || gamepad_start_pressed);
    input_select_pressed  = (keyboard_select_pressed || gamepad_select_pressed);
    input_accept_pressed  = (keyboard_accept_pressed || gamepad_accept_pressed);
    input_cancel_pressed  = (keyboard_cancel_pressed || gamepad_cancel_pressed);
    input_help_pressed    = (keyboard_help_pressed || gamepad_help_pressed);

    // Released inputs:
    input_left_released    = (keyboard_left_released || gamepad_left_released);
    input_right_released   = (keyboard_right_released || gamepad_right_released);
    input_up_released      = (keyboard_up_released || gamepad_up_released);
    input_down_released    = (keyboard_down_released || gamepad_down_released);

    input_jump_released    = (keyboard_jump_released || gamepad_jump_released);
    input_special_released = (keyboard_special_released || gamepad_special_released);
    input_swap_released    = (keyboard_swap_released || gamepad_swap_released);
    input_tag_released     = (keyboard_tag_released || gamepad_tag_released);
    input_super_released   = (keyboard_super_released || gamepad_super_released);

    input_start_released   = (keyboard_start_released || gamepad_start_released);
    input_select_released  = (keyboard_select_released || gamepad_select_released);
    input_accept_released  = (keyboard_accept_released || gamepad_accept_released);
    input_cancel_released  = (keyboard_cancel_released || gamepad_cancel_released);
    input_help_released    = (keyboard_help_released || gamepad_help_released);
} else*/ {
    input_left    = keyboard_left;
    input_right   = keyboard_right;
    input_up      = keyboard_up;
    input_down    = keyboard_down;

    input_jump    = keyboard_jump;
    input_special = keyboard_special;
    input_swap    = keyboard_swap;
    input_tag     = keyboard_tag;
    input_super   = keyboard_super;

    input_start   = keyboard_start;
    input_select  = keyboard_select;
    input_accept  = keyboard_accept;
    input_cancel  = keyboard_cancel;
    input_help    = keyboard_help;

    // Pressed inputs:
    input_left_pressed    = keyboard_left_pressed;
    input_right_pressed   = keyboard_right_pressed;
    input_up_pressed      = keyboard_up_pressed;
    input_down_pressed    = keyboard_down_pressed;

    input_jump_pressed    = keyboard_jump_pressed;
    input_special_pressed = keyboard_special_pressed;
    input_swap_pressed    = keyboard_swap_pressed;
    input_tag_pressed     = keyboard_tag_pressed;
    input_super_pressed   = keyboard_super_pressed;

    input_start_pressed   = keyboard_start_pressed;
    input_select_pressed  = keyboard_select_pressed;
    input_accept_pressed  = keyboard_accept_pressed;
    input_cancel_pressed  = keyboard_cancel_pressed;
    input_help_pressed    = keyboard_help_pressed;

    // Released inputs:
    input_left_released    = keyboard_left_released;
    input_right_released   = keyboard_right_released;
    input_up_released      = keyboard_up_released;
    input_down_released    = keyboard_down_released;

    input_jump_released    = keyboard_jump_released;
    input_special_released = keyboard_special_released;
    input_swap_released    = keyboard_swap_released;
    input_tag_released     = keyboard_tag_released;
    input_super_released   = keyboard_super_released;

    input_start_released   = keyboard_start_released;
    input_select_released  = keyboard_select_released;
    input_accept_released  = keyboard_accept_released;
    input_cancel_released  = keyboard_cancel_released;
    input_help_released    = keyboard_help_released;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update Keyboard Input

// Held inputs:
keyboard_left    = keyboard_check(global.input_key_left);
keyboard_right   = keyboard_check(global.input_key_right);
keyboard_up      = keyboard_check(global.input_key_up);
keyboard_down    = keyboard_check(global.input_key_down);

keyboard_jump    = keyboard_check(global.input_key_jump);
keyboard_special = keyboard_check(global.input_key_special);
keyboard_swap    = keyboard_check(global.input_key_swap);
keyboard_tag     = keyboard_check(global.input_key_tag);
keyboard_super   = keyboard_check(global.input_key_super);

keyboard_start   = keyboard_check(global.input_key_start);
keyboard_select  = keyboard_check(global.input_key_select);
keyboard_accept  = keyboard_check(global.input_key_accept);
keyboard_cancel  = keyboard_check(global.input_key_cancel);
keyboard_help    = keyboard_check(global.input_key_help);

// Pressed inputs:
keyboard_left_pressed    = keyboard_check_pressed(global.input_key_left);
keyboard_right_pressed   = keyboard_check_pressed(global.input_key_right);
keyboard_up_pressed      = keyboard_check_pressed(global.input_key_up);
keyboard_down_pressed    = keyboard_check_pressed(global.input_key_down);

keyboard_jump_pressed    = keyboard_check_pressed(global.input_key_jump);
keyboard_special_pressed = keyboard_check_pressed(global.input_key_special);
keyboard_swap_pressed    = keyboard_check_pressed(global.input_key_swap);
keyboard_tag_pressed     = keyboard_check_pressed(global.input_key_tag);
keyboard_super_pressed   = keyboard_check_pressed(global.input_key_super);

keyboard_start_pressed   = keyboard_check_pressed(global.input_key_start);
keyboard_select_pressed  = keyboard_check_pressed(global.input_key_select);
keyboard_accept_pressed  = keyboard_check_pressed(global.input_key_accept);
keyboard_cancel_pressed  = keyboard_check_pressed(global.input_key_cancel);
keyboard_help_pressed    = keyboard_check_pressed(global.input_key_help);

// Released inputs:
keyboard_left_released    = keyboard_check_released(global.input_key_left);
keyboard_right_released   = keyboard_check_released(global.input_key_right);
keyboard_up_released      = keyboard_check_released(global.input_key_up);
keyboard_down_released    = keyboard_check_released(global.input_key_down);

keyboard_jump_released    = keyboard_check_released(global.input_key_jump);
keyboard_special_released = keyboard_check_released(global.input_key_special);
keyboard_swap_released    = keyboard_check_released(global.input_key_swap);
keyboard_tag_released     = keyboard_check_released(global.input_key_tag);
keyboard_super_released   = keyboard_check_released(global.input_key_super);

keyboard_start_released   = keyboard_check_released(global.input_key_start);
keyboard_select_released  = keyboard_check_released(global.input_key_select);
keyboard_accept_released  = keyboard_check_released(global.input_key_accept);
keyboard_cancel_released  = keyboard_check_released(global.input_key_cancel);
keyboard_help_released    = keyboard_check_released(global.input_key_help);
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update Gamepad Input
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update Input Timer

// Left timer:
if(input_left == true) input_left_timer += 1;
else input_left_timer = 0;

// Right timer:
if(input_right == true) input_right_timer += 1;
else input_right_timer = 0;

// Up timer:
if(input_up == true) input_up_timer += 1;
else input_up_timer = 0;

// Down timer:
if(input_down == true) input_down_timer += 1;
else input_down_timer = 0;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Conflicting Inputs

// Held left & right:
if(input_left == true && input_right == true) {
    input_left  = false;
    input_right = false;
}

// Pressed left & right:
if(input_left_pressed == true && input_right_pressed == true) {
    input_left_pressed  = false;
    input_right_pressed = false;
}

// Held up & down:
if(input_up == true && input_down == true) {
    input_up   = false;
    input_down = false;
}

// Pressed up & down:
if(input_up_pressed == true && input_down_pressed == true) {
    input_up_pressed   = false;
    input_down_pressed = false;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Input Prompts
#define KeyPress_82
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// "Restart" Game
// 8.2 extensions don't support game restart, so we just go back to the first room.

if(!instance_exists(ctrl_transition)) room_transition(rm_basic_test_2);
