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
for(i = 0; i < joystick_max; i += 1) {
    for(j = INP_LEFT; j <= INP_DOWN; j += 1) {
        for(k = CHECK_HELD; k <= CHECK_RELEASED; k += 1) {
            joystick_dpad[j, k + (i * 3)] = false;
        }
    }
}

// Analog stick values:
for(i = 0; i < joystick_max; i += 1) {
    for(j = INP_LEFT; j <= INP_DOWN; j += 1) {
        for(k = CHECK_HELD; k <= CHECK_RELEASED; k += 1) {
            joystick_analog[j, k + (i * 3)] = false;
        }
    }
}

// Joystick inputs:
for(i = 0; i < joystick_max; i += 1) {
    for(j = INP_LEFT; j <= INP_HELP; j += 1) {
        for(k = CHECK_HELD; k <= CHECK_RELEASED; k += 1) {
            joystick_input[j, k + (i * 3)] = false;
        }
    }
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
joystick_button[JOY_TRIGGERL, 0] = 4;
joystick_button[JOY_TRIGGERR, 0] = 5;
joystick_button[JOY_SELECT, 0]   = 6;
joystick_button[JOY_START, 0]    = 7;
joystick_button[JOY_STICKL, 0]   = 8;
joystick_button[JOY_STICKR, 0]   = 9;

// DualSense buttons:
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
                    var joystick_available;
                    
                    joystick_available = true;
                    
                    // Iterate through every registered joysticks:
                    for(k = 0; k < joystick_max; k += 1) {
                        
                        // If the device is already registered, move on:
                        if(joystick_device[k, 0] == j) joystick_available = false;
                    }
                    
                    // Register the device:
                    if(joystick_available = true) {
                        joystick_device[i, 0] = j;
                        break;
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
/// Joystick Configuration

// Update device layout:
for(i = 0; i < joystick_max; i += 1) {
    // Check if the current joystick exists:
    if(joystick_device[i, 0] > -1) {
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
    var device_id;

    device_id = joystick_device[i, 0];

    if(device_id > -1) {
        switch(joystick_device[i, 1]) {
            case 1:
                // Held inputs:
                for(j = INP_LEFT; j <= INP_DOWN; j += 1) {
                    joystick_dpad[j, CHECK_HELD + (i * 3)] = joystick_check_button(device_id, joystick_button[JOY_LEFT + j, joystick_device[i, 1]]);
                }

                // Pressed inputs:
                for(j = INP_LEFT; j <= INP_DOWN; j += 1) {
                    joystick_dpad[j, CHECK_PRESSED + (i * 3)] = joystick_check_button_pressed(device_id, joystick_button[JOY_LEFT + j, joystick_device[i, 1]]);
                }

                // Released inputs:
                for(j = INP_LEFT; j <= INP_DOWN; j += 1) {
                    joystick_dpad[j, CHECK_RELEASED + (i * 3)] = joystick_check_button_released(device_id, joystick_button[JOY_LEFT + j, joystick_device[i, 1]]);
                }
                break;

            default:
                // Pressed inputs:
                joystick_dpad[INP_LEFT, CHECK_PRESSED + (i * 3)]  = (joystick_pov_x(device_id) == -1 && joystick_dpad[INP_LEFT, CHECK_HELD + (i * 3)] == false);
                joystick_dpad[INP_RIGHT, CHECK_PRESSED + (i * 3)] = (joystick_pov_x(device_id) == 1 && joystick_dpad[INP_RIGHT, CHECK_HELD + (i * 3)] == false);
                joystick_dpad[INP_UP, CHECK_PRESSED + (i * 3)]    = (joystick_pov_y(device_id) == -1 && joystick_dpad[INP_UP, CHECK_HELD + (i * 3)] == false);
                joystick_dpad[INP_DOWN, CHECK_PRESSED + (i * 3)]  = (joystick_pov_y(device_id) == 1 && joystick_dpad[INP_DOWN, CHECK_HELD + (i * 3)] == false);

                // Released inputs:
                joystick_dpad[INP_LEFT, CHECK_RELEASED + (i * 3)]  = (joystick_pov_x(device_id) != -1 && joystick_dpad[INP_LEFT, CHECK_HELD + (i * 3)] == true);
                joystick_dpad[INP_RIGHT, CHECK_RELEASED + (i * 3)] = (joystick_pov_x(device_id) != 1 && joystick_dpad[INP_RIGHT, CHECK_HELD + (i * 3)] == true);
                joystick_dpad[INP_UP, CHECK_RELEASED + (i * 3)]    = (joystick_pov_y(device_id) != -1 && joystick_dpad[INP_UP, CHECK_HELD + (i * 3)] == true);
                joystick_dpad[INP_DOWN, CHECK_RELEASED + (i * 3)]  = (joystick_pov_y(device_id) != 1 && joystick_dpad[INP_DOWN, CHECK_HELD + (i * 3)] == true);

                // Held inputs:
                joystick_dpad[INP_LEFT, CHECK_HELD + (i * 3)]  = (joystick_pov_x(device_id) == -1);
                joystick_dpad[INP_RIGHT, CHECK_HELD + (i * 3)] = (joystick_pov_x(device_id) == 1);
                joystick_dpad[INP_UP, CHECK_HELD + (i * 3)]    = (joystick_pov_y(device_id) == -1);
                joystick_dpad[INP_DOWN, CHECK_HELD + (i * 3)]  = (joystick_pov_y(device_id) == 1);
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update Joystick Analog Stick

for(i = 0; i < joystick_max; i += 1) {
    var device_id;

    device_id = joystick_device[i, 0];

    if(device_id > -1) {
        if(global.input_joy_deadzone != 0) {
            // Pressed inputs:
            joystick_analog[INP_LEFT, CHECK_PRESSED + (i * 3)]  = (joystick_axis(device_id, 0) < -global.input_joy_deadzone && joystick_analog[INP_LEFT, CHECK_HELD + (i * 3)] == false);
            joystick_analog[INP_RIGHT, CHECK_PRESSED + (i * 3)] = (joystick_axis(device_id, 0) > global.input_joy_deadzone && joystick_analog[INP_RIGHT, CHECK_HELD + (i * 3)] == false);
            joystick_analog[INP_UP, CHECK_PRESSED + (i * 3)]    = (joystick_axis(device_id, 1) < -global.input_joy_deadzone && joystick_analog[INP_UP, CHECK_HELD + (i * 3)] == false);
            joystick_analog[INP_DOWN, CHECK_PRESSED + (i * 3)]  = (joystick_axis(device_id, 1) > global.input_joy_deadzone && joystick_analog[INP_DOWN, CHECK_HELD + (i * 3)] == false);

            // Released inputs:
            joystick_analog[INP_LEFT, CHECK_RELEASED + (i * 3)]  = (joystick_axis(device_id, 0) > -global.input_joy_deadzone && joystick_analog[INP_LEFT, CHECK_HELD + (i * 3)] == true);
            joystick_analog[INP_RIGHT, CHECK_RELEASED + (i * 3)] = (joystick_axis(device_id, 0) < global.input_joy_deadzone && joystick_analog[INP_RIGHT, CHECK_HELD + (i * 3)] == true);
            joystick_analog[INP_UP, CHECK_RELEASED + (i * 3)]    = (joystick_axis(device_id, 1) > -global.input_joy_deadzone && joystick_analog[INP_UP, CHECK_HELD + (i * 3)] == true);
            joystick_analog[INP_DOWN, CHECK_RELEASED + (i * 3)]  = (joystick_axis(device_id, 1) < global.input_joy_deadzone && joystick_analog[INP_DOWN, CHECK_HELD + (i * 3)] == true);

            // Held inputs:
            joystick_analog[INP_LEFT, CHECK_HELD + (i * 3)]  = (joystick_axis(device_id, 0) < -global.input_joy_deadzone);
            joystick_analog[INP_RIGHT, CHECK_HELD + (i * 3)] = (joystick_axis(device_id, 0) > global.input_joy_deadzone);
            joystick_analog[INP_UP, CHECK_HELD + (i * 3)]    = (joystick_axis(device_id, 1) < -global.input_joy_deadzone);
            joystick_analog[INP_DOWN, CHECK_HELD + (i * 3)]  = (joystick_axis(device_id, 1) > global.input_joy_deadzone);
        } else {
            // Pressed inputs:
            joystick_analog[INP_LEFT, CHECK_PRESSED + (i * 3)]  = false;
            joystick_analog[INP_RIGHT, CHECK_PRESSED + (i * 3)] = false;
            joystick_analog[INP_UP, CHECK_PRESSED + (i * 3)]    = false;
            joystick_analog[INP_DOWN, CHECK_PRESSED + (i * 3)]  = false;

            // Released inputs:
            joystick_analog[INP_LEFT, CHECK_RELEASED + (i * 3)]  = false;
            joystick_analog[INP_RIGHT, CHECK_RELEASED + (i * 3)] = false;
            joystick_analog[INP_UP, CHECK_RELEASED + (i * 3)]    = false;
            joystick_analog[INP_DOWN, CHECK_RELEASED + (i * 3)]  = false;

            // Held inputs:
            joystick_analog[INP_LEFT, CHECK_HELD + (i * 3)]  = false;
            joystick_analog[INP_RIGHT, CHECK_HELD + (i * 3)] = false;
            joystick_analog[INP_UP, CHECK_HELD + (i * 3)]    = false;
            joystick_analog[INP_DOWN, CHECK_HELD + (i * 3)]  = false;
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update Device Inputs

// User/player 1 held inputs:
for(i = INP_LEFT; i <= INP_HELP; i += 1) {
    user_input[i, CHECK_HELD] = (keyboard_input[i, CHECK_HELD] || joystick_input[i, CHECK_HELD]);
}


// User/player 1 pressed inputs:
for(i = INP_LEFT; i <= INP_HELP; i += 1) {
    user_input[i, CHECK_PRESSED] = ((keyboard_input[i, CHECK_PRESSED] && !joystick_input[i, CHECK_HELD]) || (joystick_input[i, CHECK_PRESSED] && !keyboard_input[i, CHECK_HELD]));
}

// User/player 1 released inputs:
for(i = INP_LEFT; i <= INP_HELP; i += 1) {
    user_input[i, CHECK_RELEASED] = ((keyboard_input[i, CHECK_RELEASED] && !joystick_input[i, CHECK_HELD]) || (joystick_input[i, CHECK_RELEASED] && !keyboard_input[i, CHECK_HELD]));
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
    var device_id;

    device_id = joystick_device[i, 0];

    if(device_id > -1) {
        var button_id;

        // Pressed joystick analog:
        for(j = INP_LEFT; j <= INP_DOWN; j += 1) {
            joystick_input[j, CHECK_PRESSED + (i * 3)] = ((joystick_dpad[j, CHECK_PRESSED + (i * 3)] && !joystick_analog[j, CHECK_HELD + (i * 3)]) || (joystick_analog[j, CHECK_PRESSED + (i * 3)] && !joystick_dpad[j, CHECK_HELD + (i * 3)]));
        }

        // Pressed joystick triggers:
        for(j = INP_JUMP; j <= INP_HELP; j += 1) {
            button_id = joystick_button[global.input_joy[j - INP_JUMP, i], joystick_device[i, 1]];

            if(button_id != -1) {
                if(global.input_joy[j - INP_JUMP, i] == JOY_TRIGGERL || global.input_joy[j - INP_JUMP, i] == JOY_TRIGGERR) {
                    joystick_input[j, CHECK_PRESSED + (i * 3)] = (joystick_axis(device_id, button_id) != -1 && joystick_input[j, CHECK_HELD + (i * 3)] == false);
                }
            }
        }

        // Released joystick analog:
        for(j = INP_LEFT; j <= INP_DOWN; j += 1) {
            joystick_input[j, CHECK_RELEASED + (i * 3)] = ((joystick_dpad[j, CHECK_RELEASED + (i * 3)] && !joystick_analog[j, CHECK_HELD + (i * 3)]) || (joystick_analog[j, CHECK_RELEASED + (i * 3)] && !joystick_dpad[j, CHECK_HELD + (i * 3)]));
        }


        // Released joystick triggers:
        for(j = INP_JUMP; j <= INP_HELP; j += 1) {
            button_id = joystick_button[global.input_joy[j - INP_JUMP, i], joystick_device[i, 1]];

            if(button_id != -1) {
                if(global.input_joy[j - INP_JUMP, i] == JOY_TRIGGERL || global.input_joy[j - INP_JUMP, i] == JOY_TRIGGERR) {
                    joystick_input[j, CHECK_RELEASED + (i * 3)] = (joystick_axis(device_id, button_id) == -1 && joystick_input[j, CHECK_HELD + (i * 3)] == true);
                }
            }
        }

        // Held joystick analog:
        for(j = INP_LEFT; j <= INP_DOWN; j += 1) {
            joystick_input[j, CHECK_HELD + (i * 3)] = (joystick_dpad[j, CHECK_HELD + (i * 3)] || joystick_analog[j, CHECK_HELD + (i * 3)]);
        }

        // Held joystick buttons & triggers:
        for(j = INP_JUMP; j <= INP_HELP; j += 1) {
            button_id = joystick_button[global.input_joy[j - INP_JUMP, i], joystick_device[i, 1]];

            if(button_id != -1) {
                if(global.input_joy[j - INP_JUMP, i] == JOY_TRIGGERL || global.input_joy[j - INP_JUMP, i] == JOY_TRIGGERR) {
                    joystick_input[j, CHECK_HELD + (i * 3)] = (joystick_axis(device_id, button_id) != -1);
                } else {
                    joystick_input[j, CHECK_HELD + (i * 3)] = joystick_check_button(device_id, button_id);
                }
            }
        }

        // Pressed joystick buttons:
        for(j = INP_JUMP; j <= INP_HELP; j += 1) {
            button_id = joystick_button[global.input_joy[j - INP_JUMP, i], joystick_device[i, 1]];

            if(button_id != -1) {
                if(global.input_joy[j - INP_JUMP, i] != JOY_TRIGGERL && global.input_joy[j - INP_JUMP, i] != JOY_TRIGGERR) {
                    joystick_input[j, CHECK_PRESSED + (i * 3)] = joystick_check_button_pressed(device_id, button_id);
                }
            }
        }

        // Released joystick buttons:
        for(j = INP_JUMP; j <= INP_HELP; j += 1) {
            button_id = joystick_button[global.input_joy[j - INP_JUMP, i], joystick_device[i, 1]];

            if(button_id != -1) {
                if(global.input_joy[j - INP_JUMP, i] != JOY_TRIGGERL && global.input_joy[j - INP_JUMP, i] != JOY_TRIGGERR) {
                    joystick_input[j, CHECK_RELEASED + (i * 3)] = joystick_check_button_released(device_id, button_id);
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
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Create Partner Queues

partner_input_up   = ds_queue_create();
partner_input_down = ds_queue_create();
partner_input_jump = ds_queue_create();

// Populate Queues:
repeat(16) {
    ds_queue_enqueue(partner_input_up, false);
    ds_queue_enqueue(partner_input_down, false);
    ds_queue_enqueue(partner_input_jump, false);
}
