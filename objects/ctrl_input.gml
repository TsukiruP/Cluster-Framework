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
//for(i = 0; i <= 1; i += 1) {
    for(j = INP_LEFT; j <= INP_HELP; j += 1) {
        for(k = CHECK_HELD; k <= CHECK_RELEASED; k += 1) {
            joystick_input[j, k] = false;
        }
    }
//}

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

// Joystick total:
joystick_total = 2;

// Joystick devices:
for(i = 0; i < joystick_total; i += 1) {
    joystick_device[i] = -2;
}

//joystick_device[0] = 0;

// Dpad values:
for(i = INP_LEFT; i <= INP_DOWN; i += 1) {
    joystick_dpad[i] = false;
}

test = 0;
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
    for(i = 0; i < joystick_total; i += 1) {
        // Check if current device has been removed:
        if(joystick_device[i] > joystick_count() - 1) {
            joystick_device[i] = -2;
        }

        // Check current device is set to seeking:
        if(joystick_device[i] == -2) {
            // Check there's enough joysticks:
            if(joystick_count() > 0) {
                // Iterate through currently connected joysticks:
                for(j = 0; j < joystick_count(); j += 1) {
                    // Iterate through every registered joysticks:
                    for(k = 0; k < joystick_total; k += 1) {
                        // If the device is already registered, move on:
                        if(joystick_device[k] == j) break;
                        
                        // Register the device:
                        joystick_device[i] = j;
                    }
                }
            }
        }
        
    }
}

/*
if(joystick_found()) {
    for(i = 0; i < joystick_total; i += 1) {
        if(joystick_device[i] == -2) {
            // Iterate through every joystick currently connected:
            for(j = 0; j < joystick_count(); j += 1) {
                // Iterate through every device registered:
                for(k = 0; k <= joystick_total; k += 1) {
                    if(joystick_exists(j) && j != joystick_device[k]) joystick_device[i] = j;
                }
            }
        } else if(joystick_device[i] > joystick_count()) {
            // Check if there's enough joysticks:
            if(joystick_count() > 0) {
                // Iterate through every joystick currently connected:
                for(j = 0; j < joystick_count(); j += 1) {
                    // Iterate through every device registered:
                    for(k = 0; k <= joystick_total; k += 1) {
                        if(joystick_exists(j) && j != joystick_device[k]) joystick_device[i] = j;
                    }
                }
            } else {
                for(j = 0; j <= joystick_total; j += 1) {
                    // Set joysticks to auto detect:
                    joystick_device[j] = -2;
                }
            }
        }
    }
}
#define Step_1
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
