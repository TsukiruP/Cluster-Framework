#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Input Initialization

// User inputs:
for(i = INP_LEFT; i <= INP_HELP; i += 1) {
    for(j = CHECK_HELD; j <= CHECK_RELEASED; j += 1) {
        user_input[i, j] = false;
    }
}

// Keyboard inputs:
for(i = INP_LEFT; i <= INP_HELP; i += 1) {
    for(j = CHECK_HELD; j <= CHECK_RELEASED; j += 1) {
        keyboard_input[i, j] = false;
    }
}

// Joystick inputs:
for(i = 0; i <= 1; i += 1) {
    for(j = INP_LEFT; j <= INP_HELP; j += 1) {
        for(k = CHECK_HELD; k <= CHECK_RELEASED; k += 1) {
            joystick_input[j, k + (i * 3)] = false;
        }
    }
}

// Input timers:
for(i = INP_LEFT; i <= INP_DOWN; i += 1) {
    input_timer[i] = 0;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Joystick Initialization

// Joystick max:
joystick_max = 2;

// Joystick devices:
for(i = 0; i < joystick_max; i += 1) {
    joystick_device[i, 0] = -1;
    joystick_device[i, 1] =  0;
}

// Joystick buttons:
for(i = 0; i <= JOY_DOWN; i += 1) {
    joystick_button[i] = -1;
}

// Dpad values:
for(i = INP_LEFT; i <= INP_DOWN; i += 1) {
    joystick_dpad[i] = false;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Button Initialization

// Xbox buttons:
joystick_button[JOY_FACE1, 0]    = 0;
joystick_button[JOY_FACE2, 0]    = 1;
joystick_button[JOY_FACE3, 0]    = 2;
joystick_button[JOY_FACE4, 0]    = 3;
joystick_button[JOY_BUMPERL, 0]  = 4;
joystick_button[JOY_BUMPERR, 0]  = 5;
joystick_button[JOY_TRIGGERL, 1] = 4;
joystick_button[JOY_TRIGGERR, 1] = 5;
joystick_button[JOY_SELECT, 0]   = 6;
joystick_button[JOY_START, 0]    = 7;
joystick_button[JOY_STICKL, 0]   = 8;
joystick_button[JOY_STICKR, 0]   = 9;

// Dualsense Buttons
joystick_button[JOY_FACE1, 1]    =  0;
joystick_button[JOY_FACE2, 1]    =  1;
joystick_button[JOY_FACE3, 1]    =  2;
joystick_button[JOY_FACE4, 1]    =  3;
joystick_button[JOY_BUMPERL, 1]  =  9;
joystick_button[JOY_BUMPERR, 1]  = 10;
joystick_button[JOY_TRIGGERL, 1] =  4;
joystick_button[JOY_TRIGGERR, 1] =  5;
joystick_button[JOY_SELECT, 1]   =  4;
joystick_button[JOY_START, 1]    =  6;
joystick_button[JOY_STICKL, 1]   =  7;
joystick_button[JOY_STICKR, 1]   =  8;
joystick_button[JOY_LEFT, 1]     = 13;
joystick_button[JOY_RIGHT, 1]    = 14;
joystick_button[JOY_UP, 1]       = 11;
joystick_button[JOY_DOWN, 1]     = 12;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Joystick Devices

// Update devices:
if(joystick_found()) {
    // Set seeking devices:
    for(i = 0; i < joystick_max; i += 1) {
        // Check if current device has been removed:
        if(joystick_device[i, 0] > joystick_count() - 1) {
            joystick_device[i, 0] = -1;
        }

        // Check current device is set to seeking:
        if(joystick_device[i, 0] == -1) {
            // Check there's enough joysticks:
            if(joystick_count() > 0) {
                // Iterate through currently connected joysticks:
                for(j = 0; j < joystick_count(); j += 1) {
                    // Iterate through every registered joysticks:
                    for(k = 0; k < joystick_max; k += 1) {
                        // If the device is already registered, move on:
                        if(joystick_device[k, 0] == j) break;
                        
                        // Register the device:
                        joystick_device[i, 0] = j;
                    }
                }
            }
        }
        
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Joystick Buttons

// Update device layout:
for(i = 0; i < joystick_max; i += 1) {
    // Check if the current joystick exists:
    if(joystick_exists(i)) {
        // Check if the current joustick has a POV/D-Pad:
        if(joystick_has_pov(i)) {
            // Set to Xbox configuration:
            joystick_device[i, 1] = 0;
        } else joystick_device[i, 1] = 1;
    }
}
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update Joystick D-pad

for(i = 0; i < joystick_max; i += 1) {

}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update Device Inputs

// User/player 1 inputs:
for(i = INP_LEFT; i <= INP_HELP; i += 1) {
    for(j = CHECK_HELD; j <= CHECK_RELEASED; j += 1) {
        user_input[i, j] = (keyboard_input[i, j] || joystick_input[i, j]);
    }
}

// Held keyboard inputs:
for(i = INP_LEFT; i <= INP_HELP; i += 1) {
    keyboard_input[i, CHECK_HELD] = keyboard_check(global.input_key[i]);
}

// Pressed keyboard inputs:
for(i = INP_LEFT; i <= INP_HELP; i += 1) {
    keyboard_input[i, CHECK_PRESSED] = keyboard_check_pressed(global.input_key[i]);
}

// Released keyboard inputs:
for(i = INP_LEFT; i <= INP_HELP; i += 1) {
    keyboard_input[i, CHECK_RELEASED] = keyboard_check_released(global.input_key[i]);
}

// Joystick inputs:
for(i = 0; i < joystick_max; i += 1) {
    if(joystick_exists(i)) {
        var device_id, button_id;

        device_id = joystick_device[i, 0];

        // Held inputs:
        joystick_input[INP_LEFT, CHECK_HELD]  = (joystick_pov_x(device_id) == -1 || (joystick_axis(device_id, 0) < -global.input_joy_deadzone));
        joystick_input[INP_RIGHT, CHECK_HELD] = (joystick_pov_x(device_id) == 1 || (joystick_axis(device_id, 0) > global.input_joy_deadzone));
        joystick_input[INP_UP, CHECK_HELD]    = (joystick_pov_y(device_id) == -1 || (joystick_axis(device_id, 1) < -global.input_joy_deadzone));
        joystick_input[INP_DOWN, CHECK_HELD]  = (joystick_pov_y(device_id) == 1 || (joystick_axis(device_id, 1) > global.input_joy_deadzone));

        for(j = INP_JUMP; j <= INP_ALT; j += 1) {
            button_id = joystick_button[global.input_joy[j - INP_JUMP], device_id];

            if(global.input_joy[j - INP_JUMP] == JOY_TRIGGERL || global.input_joy[j - INP_JUMP] == JOY_TRIGGERR) {
                joystick_input[j, CHECK_HELD + (i * 3)] = (joystick_axis(device_id, button_id) > 0)
            } else {
                if(button_id != -1) joystick_input[j, CHECK_HELD + (i * 3)] = joystick_check_button(device_id, button_id);
            }
        }
    }
}

/*
// Pressed joystick directions:
// This is because we're reliant on the status of the held check.
joystick_input[INP_LEFT, CHECK_PRESSED]  = (joystick_pov_x(0) == -1 || (joystick_axis(0, 0) < -global.input_joy_deadzone)) && (joystick_input[INP_LEFT, CHECK_HELD] == false);
joystick_input[INP_RIGHT, CHECK_PRESSED] = (joystick_pov_x(0) == 1 || (joystick_axis(0, 0) > global.input_joy_deadzone)) && (joystick_input[INP_RIGHT, CHECK_HELD] == false);
joystick_input[INP_UP, CHECK_PRESSED]    = (joystick_pov_y(0) == -1 || (joystick_axis(0, 1) < -global.input_joy_deadzone)) && (joystick_input[INP_UP, CHECK_HELD] == false);
joystick_input[INP_DOWN, CHECK_PRESSED]  = (joystick_pov_y(0) == 1 || (joystick_axis(0, 1) < -global.input_joy_deadzone)) && (joystick_input[INP_DOWN, CHECK_HELD] == false);

// Held joystick inputs:
joystick_input[INP_LEFT, CHECK_HELD]  = (joystick_pov_x(0) == -1 || (joystick_axis(0, 0) < -global.input_joy_deadzone));
joystick_input[INP_RIGHT, CHECK_HELD] = (joystick_pov_x(0) == 1 || (joystick_axis(0, 0) > global.input_joy_deadzone));
joystick_input[INP_UP, CHECK_HELD]    = (joystick_pov_y(0) == -1 || (joystick_axis(0, 1) < -global.input_joy_deadzone));
joystick_input[INP_DOWN, CHECK_HELD]  = (joystick_pov_y(0) == 1 || (joystick_axis(0, 1) > global.input_joy_deadzone));

for(i = INP_JUMP; i <= INP_HELP; i += 1) {
    joystick_input[i, CHECK_HELD] = joystick_check_button(0, global.input_joy[i - INP_JUMP]);
}

// Pressed joystick buttons:
for(i = INP_JUMP; i <= INP_HELP ; i += 1) {
    joystick_input[i, CHECK_PRESSED] = joystick_check_button_pressed(0, global.input_joy[i - INP_JUMP]);
}

// Released joystick inputs:
joystick_input[INP_LEFT, CHECK_RELEASED]  = (joystick_pov_x(0) == -1 || (joystick_axis(0, 0) < -global.input_joy_deadzone)) && (joystick_input[INP_LEFT, CHECK_HELD] == true);
joystick_input[INP_RIGHT, CHECK_RELEASED] = (joystick_pov_x(0) == 1 || (joystick_axis(0, 0) > global.input_joy_deadzone)) && (joystick_input[INP_RIGHT, CHECK_HELD] == true);
joystick_input[INP_UP, CHECK_RELEASED]    = (joystick_pov_y(0) == -1 || (joystick_axis(0, 1) < -global.input_joy_deadzone)) && (joystick_input[INP_UP, CHECK_HELD] == true);
joystick_input[INP_DOWN, CHECK_RELEASED]  = (joystick_pov_y(0) == 1 || (joystick_axis(0, 1) < -global.input_joy_deadzone)) && (joystick_input[INP_DOWN, CHECK_HELD] == true);

for(i = INP_JUMP; i <= INP_HELP; i += 1) {
    joystick_input[i, CHECK_RELEASED] = joystick_check_button_released(0, global.input_joy[i - INP_JUMP]);
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update Input Timer

for(i = INP_LEFT; i <= INP_DOWN; i += 1) {
    if(user_input[i, CHECK_HELD] == true) input_timer[i] += 1;
    else {
        if(input_timer[i] != 0) input_timer[i] = 0;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Conflicting Inputs

// Held left & right:
if(user_input[INP_LEFT, CHECK_HELD] == true && user_input[INP_RIGHT, CHECK_HELD] == true) {
    user_input[INP_LEFT, CHECK_HELD]  = false;
    user_input[INP_RIGHT, CHECK_HELD] = false;
}

// Pressed left & right:
if(user_input[INP_LEFT, CHECK_PRESSED] == true && user_input[INP_RIGHT, CHECK_PRESSED] == true) {
    user_input[INP_LEFT, CHECK_PRESSED]  = false;
    user_input[INP_RIGHT, CHECK_PRESSED] = false;
}

// Held up & down:
if(user_input[INP_UP, CHECK_HELD] == true && user_input[INP_DOWN, CHECK_HELD] == true) {
    user_input[INP_UP, CHECK_HELD]  = false;
    user_input[INP_DOWN, CHECK_HELD] = false;
}

// Pressed up & down:
if(user_input[INP_UP, CHECK_PRESSED] == true && user_input[INP_DOWN, CHECK_PRESSED] == true) {
    user_input[INP_UP, CHECK_PRESSED]  = false;
    user_input[INP_DOWN, CHECK_PRESSED] = false;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Input Prompts
