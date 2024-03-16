#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Input Initialization

// User & keyboard inputs:
for (i = INP_LEFT; i <= INP_HELP; i += 1) {
    for (j = CHECK_HELD; j <= CHECK_RELEASED; j += 1) {
        // User inputs:
        user_input[i, j]     = false;

        // Keyboard inputs:
        keyboard_input[i, j] = false;
    }
}

// Input timers:
for (i = INP_LEFT; i <= INP_DOWN; i += 1) {
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
for (i = 0; i < joystick_max; i += 1) {
    joystick_device[i, 0] = -1;
    joystick_device[i, 1] = -1;
}

// Joystick buttons:
for (i = JOY_FACE1; i <= JOY_DOWN; i += 1) {
    joystick_button[i] = -1;
}

// Joystick inputs::
for (i = 0; i < joystick_max; i += 1) {
    for (j = INP_LEFT; j <= INP_HELP; j += 1) {
        for (k = CHECK_HELD; k <= CHECK_RELEASED; k += 1) {
            // D-pad and analog inputs:
            if (j <= INP_DOWN) {
                // D-pad inputs:
                joystick_dpad[j, k + (i * 3)] = false;

                // Analog stick inputs:
                joystick_analog[j, k + (i * 3)] = false;
            }

            // Trigger inputs:
            if (j <= INP_RIGHT) {
                joystick_trigger[j, k + (i * 3)] = false;
            }

            // General inputs:
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
joystick_button[JOY_FACE1, 0]    =  0;
joystick_button[JOY_FACE2, 0]    =  1;
joystick_button[JOY_FACE3, 0]    =  2;
joystick_button[JOY_FACE4, 0]    =  3;
joystick_button[JOY_BUMPERL, 0]  =  4;
joystick_button[JOY_BUMPERR, 0]  =  5;
joystick_button[JOY_TRIGGERL, 0] =  4;
joystick_button[JOY_TRIGGERR, 0] =  5;
joystick_button[JOY_SELECT, 0]   =  6;
joystick_button[JOY_START, 0]    =  7;
joystick_button[JOY_STICKL, 0]   =  8;
joystick_button[JOY_STICKR, 0]   =  9;
joystick_button[JOY_HOME, 0]     = 10;
joystick_button[JOY_SHARE, 0]    = 11;

// DualSense buttons:
joystick_button[JOY_FACE1, 1]    =  0;
joystick_button[JOY_FACE2, 1]    =  1;
joystick_button[JOY_FACE3, 1]    =  2;
joystick_button[JOY_FACE4, 1]    =  3;
joystick_button[JOY_BUMPERL, 1]  =  9;
joystick_button[JOY_BUMPERR, 1]  = 10;
joystick_button[JOY_TRIGGERL, 1] =  4;
joystick_button[JOY_TRIGGERR, 1] =  5;
joystick_button[JOY_SELECT, 1]   = 15;
joystick_button[JOY_START, 1]    =  6;
joystick_button[JOY_STICKL, 1]   =  7;
joystick_button[JOY_STICKR, 1]   =  8;
joystick_button[JOY_LEFT, 1]     = 13;
joystick_button[JOY_RIGHT, 1]    = 14;
joystick_button[JOY_UP, 1]       = 11;
joystick_button[JOY_DOWN, 1]     = 12;
joystick_button[JOY_HOME, 1]     =  5;
joystick_button[JOY_SHARE, 1]    =  4;

// Pro Controller buttons:
joystick_button[JOY_FACE1, 2]    =  1;
joystick_button[JOY_FACE2, 2]    =  0;
joystick_button[JOY_FACE3, 2]    =  3;
joystick_button[JOY_FACE4, 2]    =  2;
joystick_button[JOY_BUMPERL, 2]  =  9;
joystick_button[JOY_BUMPERR, 2]  = 10;
joystick_button[JOY_TRIGGERL, 2] =  4;
joystick_button[JOY_TRIGGERR, 2] =  5;
joystick_button[JOY_SELECT, 2]   =  4;
joystick_button[JOY_START, 2]    =  6;
joystick_button[JOY_STICKL, 2]   =  7;
joystick_button[JOY_STICKR, 2]   =  8;
joystick_button[JOY_LEFT, 2]     = 13;
joystick_button[JOY_RIGHT, 2]    = 14;
joystick_button[JOY_UP, 2]       = 11;
joystick_button[JOY_DOWN, 2]     = 12;
joystick_button[JOY_HOME, 2]     =  5;
joystick_button[JOY_SHARE, 2]    = 15;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update Devices

// Find devices:
if (joystick_found()) {
    // Set seeking devices:
    for (i = 0; i < joystick_max; i += 1) {
        // Check if current device has been removed:
        if (joystick_device[i, 0] > joystick_count() - 1) {
            joystick_device[i, 0] = -1;
        }

        // Check current device is set to seeking:
        if (joystick_device[i, 0] == -1) {
            // Check there's enough joysticks:
            if (joystick_count() > 0) {
                // Iterate through currently connected joysticks:
                for (j = 0; j < joystick_count(); j += 1) {
                    var joystick_available;
                    
                    joystick_available = true;
                    
                    // Iterate through every registered joysticks:
                    for (k = 0; k < joystick_max; k += 1) {
                        
                        // If the device is already registered, move on:
                        if (joystick_device[k, 0] == j) joystick_available = false;
                    }
                    
                    // Register the device:
                    if (joystick_available = true) {
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
/// Update Buttons

// Update device buttons:
for (i = 0; i < joystick_max; i += 1) {
    // Check if the current joystick exists:
    if (joystick_device[i, 0] > -1) {
        // Check if the current joustick has a POV/D-Pad:
        if (joystick_has_pov(i)) {
            // Set to Xbox configuration:
            joystick_device[i, 1] = 0;
        }

        // Other configurations:
        else {
            switch (joystick_name(i)) {
                case "Nintendo Switch Pro Controller":
                    joystick_device[i, 1] = 2;
                    break;

                default:
                    joystick_device[i, 1] = 1;
            }
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update Accept

// Update accept format:
for (i = 0; i < joystick_max; i += 1) {
    // Nintendo accept:
    if (global.input_accept[i] == 1) {
        global.input_joy[INP_ACCEPT, i] = JOY_FACE2;
        global.input_joy[INP_CANCEL, i] = JOY_FACE1;
    }

    // Xbox accept:
    else {
        global.input_joy[INP_ACCEPT, i] = JOY_FACE1;
        global.input_joy[INP_CANCEL, i] = JOY_FACE2;
    }
}
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update D-pad

for (i = 0; i < joystick_max; i += 1) {
    var device_id;

    // Device id:
    device_id = joystick_device[i, 0];

    if (device_id > -1) {
        // Read POV values:
        if (joystick_has_pov(device_id)) {
            // Pressed:
            joystick_dpad[INP_LEFT, CHECK_PRESSED + (i * 3)]  = (joystick_pov_x(device_id) == -1 && joystick_dpad[INP_LEFT, CHECK_HELD + (i * 3)] == false);
            joystick_dpad[INP_RIGHT, CHECK_PRESSED + (i * 3)] = (joystick_pov_x(device_id) == 1 && joystick_dpad[INP_RIGHT, CHECK_HELD + (i * 3)] == false);
            joystick_dpad[INP_UP, CHECK_PRESSED + (i * 3)]    = (joystick_pov_y(device_id) == -1 && joystick_dpad[INP_UP, CHECK_HELD + (i * 3)] == false);
            joystick_dpad[INP_DOWN, CHECK_PRESSED + (i * 3)]  = (joystick_pov_y(device_id) == 1 && joystick_dpad[INP_DOWN, CHECK_HELD + (i * 3)] == false);

            // Released:
            joystick_dpad[INP_LEFT, CHECK_RELEASED + (i * 3)]  = (joystick_pov_x(device_id) != -1 && joystick_dpad[INP_LEFT, CHECK_HELD + (i * 3)] == true);
            joystick_dpad[INP_RIGHT, CHECK_RELEASED + (i * 3)] = (joystick_pov_x(device_id) != 1 && joystick_dpad[INP_RIGHT, CHECK_HELD + (i * 3)] == true);
            joystick_dpad[INP_UP, CHECK_RELEASED + (i * 3)]    = (joystick_pov_y(device_id) != -1 && joystick_dpad[INP_UP, CHECK_HELD + (i * 3)] == true);
            joystick_dpad[INP_DOWN, CHECK_RELEASED + (i * 3)]  = (joystick_pov_y(device_id) != 1 && joystick_dpad[INP_DOWN, CHECK_HELD + (i * 3)] == true);

            // Held:
            joystick_dpad[INP_LEFT, CHECK_HELD + (i * 3)]  = (joystick_pov_x(device_id) == -1);
            joystick_dpad[INP_RIGHT, CHECK_HELD + (i * 3)] = (joystick_pov_x(device_id) == 1);
            joystick_dpad[INP_UP, CHECK_HELD + (i * 3)]    = (joystick_pov_y(device_id) == -1);
            joystick_dpad[INP_DOWN, CHECK_HELD + (i * 3)]  = (joystick_pov_y(device_id) == 1);
        }

        // Read button values:
        else {
            for (j = INP_LEFT; j <= INP_DOWN; j += 1) {
                // Held:
                joystick_dpad[j, CHECK_HELD + (i * 3)] = joystick_check_button(device_id, joystick_button[JOY_LEFT + j, joystick_device[i, 1]]);

                // Pressed:
                joystick_dpad[j, CHECK_PRESSED + (i * 3)] = joystick_check_button_pressed(device_id, joystick_button[JOY_LEFT + j, joystick_device[i, 1]]);

                // Released:
                joystick_dpad[j, CHECK_RELEASED + (i * 3)] = joystick_check_button_released(device_id, joystick_button[JOY_LEFT + j, joystick_device[i, 1]]);
            }
        }
    }

    // Reset values:
    else {
        for (j = INP_LEFT; j <= INP_DOWN; j += 1) {
            for (k = CHECK_HELD; k <= CHECK_RELEASED; k += 1) {
                joystick_dpad[j, k + (i * 3)] = false;
            }
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update Analog Stick

for (i = 0; i < joystick_max; i += 1) {
    var device_id;

    // Device id:
    device_id = joystick_device[i, 0];

    // Read analog values:
    if (device_id > -1 && global.input_deadzone[i] != 0) {
        // Set deadzone:
        joystick_set_deadzone(global.input_deadzone[i]);

        // Pressed:
        joystick_analog[INP_LEFT, CHECK_PRESSED + (i * 3)]  = (sign(joystick_axis(device_id, 0)) == -1 && joystick_analog[INP_LEFT, CHECK_HELD + (i * 3)] == false);
        joystick_analog[INP_RIGHT, CHECK_PRESSED + (i * 3)] = (sign(joystick_axis(device_id, 0)) == 1 && joystick_analog[INP_RIGHT, CHECK_HELD + (i * 3)] == false);
        joystick_analog[INP_UP, CHECK_PRESSED + (i * 3)]    = (sign(joystick_axis(device_id, 1)) == -1 && joystick_analog[INP_UP, CHECK_HELD + (i * 3)] == false);
        joystick_analog[INP_DOWN, CHECK_PRESSED + (i * 3)]  = (sign(joystick_axis(device_id, 1)) == 1 && joystick_analog[INP_DOWN, CHECK_HELD + (i * 3)] == false);

        // Released:
        joystick_analog[INP_LEFT, CHECK_RELEASED + (i * 3)]  = (sign(joystick_axis(device_id, 0)) != -1 && joystick_analog[INP_LEFT, CHECK_HELD + (i * 3)] == true);
        joystick_analog[INP_RIGHT, CHECK_RELEASED + (i * 3)] = (sign(joystick_axis(device_id, 0)) != 1 && joystick_analog[INP_RIGHT, CHECK_HELD + (i * 3)] == true);
        joystick_analog[INP_UP, CHECK_RELEASED + (i * 3)]    = (sign(joystick_axis(device_id, 1)) != -1 && joystick_analog[INP_UP, CHECK_HELD + (i * 3)] == true);
        joystick_analog[INP_DOWN, CHECK_RELEASED + (i * 3)]  = (sign(joystick_axis(device_id, 1)) != 1 && joystick_analog[INP_DOWN, CHECK_HELD + (i * 3)] == true);

        // Held:
        joystick_analog[INP_LEFT, CHECK_HELD + (i * 3)]  = (sign(joystick_axis(device_id, 0)) == -1);
        joystick_analog[INP_RIGHT, CHECK_HELD + (i * 3)] = (sign(joystick_axis(device_id, 0)) == 1);
        joystick_analog[INP_UP, CHECK_HELD + (i * 3)]    = (sign(joystick_axis(device_id, 1)) == -1);
        joystick_analog[INP_DOWN, CHECK_HELD + (i * 3)]  = (sign(joystick_axis(device_id, 1)) == 1);
    }

    // Reset analog values:
    else {
        // Pressed:
        joystick_analog[INP_LEFT, CHECK_PRESSED + (i * 3)]  = false;
        joystick_analog[INP_RIGHT, CHECK_PRESSED + (i * 3)] = false;
        joystick_analog[INP_UP, CHECK_PRESSED + (i * 3)]    = false;
        joystick_analog[INP_DOWN, CHECK_PRESSED + (i * 3)]  = false;

        // Released:
        joystick_analog[INP_LEFT, CHECK_RELEASED + (i * 3)]  = false;
        joystick_analog[INP_RIGHT, CHECK_RELEASED + (i * 3)] = false;
        joystick_analog[INP_UP, CHECK_RELEASED + (i * 3)]    = false;
        joystick_analog[INP_DOWN, CHECK_RELEASED + (i * 3)]  = false;

        // Held:
        joystick_analog[INP_LEFT, CHECK_HELD + (i * 3)]  = false;
        joystick_analog[INP_RIGHT, CHECK_HELD + (i * 3)] = false;
        joystick_analog[INP_UP, CHECK_HELD + (i * 3)]    = false;
        joystick_analog[INP_DOWN, CHECK_HELD + (i * 3)]  = false;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update Triggers

for (i = 0; i < joystick_max; i += 1) {
    var device_id, trigger_left, trigger_right;

    // Device id:
    device_id = joystick_device[i, 0];

    if (device_id > -1) {
        // Triggers:
        trigger_left  = joystick_axis(device_id, joystick_button[JOY_TRIGGERL, joystick_device[i, 1]]);
        trigger_right = joystick_axis(device_id, joystick_button[JOY_TRIGGERR, joystick_device[i, 1]])

        // Pressed:
        joystick_trigger[INP_LEFT, CHECK_PRESSED + (i * 3)]  = (trigger_left > 0 && joystick_trigger[INP_LEFT, CHECK_HELD + (i * 3)] == false);
        joystick_trigger[INP_RIGHT, CHECK_PRESSED + (i * 3)] = (trigger_right > 0 && joystick_trigger[INP_RIGHT, CHECK_HELD + (i * 3)] == false);

        // Released:
        joystick_trigger[INP_LEFT, CHECK_RELEASED + (i * 3)]  = (trigger_left <= 0 && joystick_trigger[INP_LEFT, CHECK_HELD + (i * 3)] == true);
        joystick_trigger[INP_RIGHT, CHECK_RELEASED + (i * 3)] = (trigger_right <= 0 && joystick_trigger[INP_RIGHT, CHECK_HELD + (i * 3)] == true);

        // Held:
        joystick_trigger[INP_LEFT, CHECK_HELD + (i * 3)]  = trigger_left > 0;
        joystick_trigger[INP_RIGHT, CHECK_HELD + (i * 3)] = trigger_right > 0;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update Inputs

// Keyboard inputs:
for (i = INP_LEFT; i <= INP_HELP; i += 1) {
    // Held:
    keyboard_input[i, CHECK_HELD] = keyboard_check(global.input_key[i]);

    // Pressed:
    keyboard_input[i, CHECK_PRESSED] = keyboard_check_pressed(global.input_key[i]);

    // Released:
    keyboard_input[i, CHECK_RELEASED] = keyboard_check_released(global.input_key[i]);
}

// Joystick inputs:
for (i = 0; i < joystick_max; i += 1) {
    var device_id;

    // Device id:
    device_id = joystick_device[i, 0];

    if (device_id > -1) {
        for (j = INP_LEFT; j <= INP_HELP; j += 1) {
            // Directional inputs:
            if (j <= INP_DOWN) {
                // Held:
                joystick_input[j, CHECK_HELD + (i * 3)] = (joystick_check(i, global.input_joy[j, i]) || joystick_analog[j, CHECK_HELD + (i * 3)]);

                // Pressed:
                joystick_input[j, CHECK_PRESSED + (i * 3)] = (joystick_check_pressed(i, global.input_joy[j, i]) || joystick_analog[j, CHECK_PRESSED + (i * 3)]);

                // Released:
                joystick_input[j, CHECK_RELEASED + (i * 3)] = (joystick_check_released(i, global.input_joy[j, i]) || joystick_analog[j, CHECK_RELEASED + (i * 3)]);
            }

            // Other inputs:
            else {
                // Held:
                joystick_input[j, CHECK_HELD + (i * 3)] = joystick_check(i, global.input_joy[j, i]);

                // Pressed:
                joystick_input[j, CHECK_PRESSED + (i * 3)] = joystick_check_pressed(i, global.input_joy[j, i]);

                // Released:
                joystick_input[j, CHECK_RELEASED + (i * 3)] = joystick_check_released(i, global.input_joy[j, i]);
            }
        }
    }

    // Reset joystick input:
    else {
        for (j = INP_LEFT; j <= INP_HELP; j += 1) {
            // Held:
            joystick_input[j, CHECK_HELD + (i * 3)] = false;

            // Pressed:
            joystick_input[j, CHECK_PRESSED + (i * 3)] = false;

            // Released:
            joystick_input[j, CHECK_RELEASED + (i * 3)] = false;
        }
    }
}

// User/player 1 inputs:
for (i = INP_LEFT; i <= INP_HELP; i += 1) {
    // Held:
    user_input[i, CHECK_HELD] = (keyboard_input[i, CHECK_HELD] || joystick_input[i, CHECK_HELD]);

    // Pressed:
    user_input[i, CHECK_PRESSED] = ((keyboard_input[i, CHECK_PRESSED] && !joystick_input[i, CHECK_HELD]) || (joystick_input[i, CHECK_PRESSED] && !keyboard_input[i, CHECK_HELD]));

    // Released:
    user_input[i, CHECK_RELEASED] = ((keyboard_input[i, CHECK_RELEASED] && !joystick_input[i, CHECK_HELD]) || (joystick_input[i, CHECK_RELEASED] && !keyboard_input[i, CHECK_HELD]));
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update Input Timer

for (i = INP_LEFT; i <= INP_DOWN; i += 1) {
    if (user_input[i, CHECK_HELD] == true) input_timer[i] += 1;
    else {
        if (input_timer[i] != 0) input_timer[i] = 0;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Conflicting Inputs

// Held left & right:
if (user_input[INP_LEFT, CHECK_HELD] == true && user_input[INP_RIGHT, CHECK_HELD] == true) {
    user_input[INP_LEFT, CHECK_HELD]  = false;
    user_input[INP_RIGHT, CHECK_HELD] = false;
}

// Pressed left & right:
if (user_input[INP_LEFT, CHECK_PRESSED] == true && user_input[INP_RIGHT, CHECK_PRESSED] == true) {
    user_input[INP_LEFT, CHECK_PRESSED]  = false;
    user_input[INP_RIGHT, CHECK_PRESSED] = false;
}

// Held up & down:
if (user_input[INP_UP, CHECK_HELD] == true && user_input[INP_DOWN, CHECK_HELD] == true) {
    user_input[INP_UP, CHECK_HELD]  = false;
    user_input[INP_DOWN, CHECK_HELD] = false;
}

// Pressed up & down:
if (user_input[INP_UP, CHECK_PRESSED] == true && user_input[INP_DOWN, CHECK_PRESSED] == true) {
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
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Clear Partner Queues

ds_queue_clear(partner_input_up);
ds_queue_clear(partner_input_down);
ds_queue_clear(partner_input_jump);
