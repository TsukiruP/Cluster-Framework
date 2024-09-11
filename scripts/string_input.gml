/// string_input(input, [device])
// Returns a string depending on the input.

var input_id, input_device;

// Initialize:
input_id     = argument0;
input_device = DEV_USER;

// Any fix:
if (input_id == INP_ANY)
{
    input_id = irandom_range(INP_UP, INP_HELP);
}

// Set device:
if (argument_count >= 2)
{
    input_device = argument[1];
}

// Keyboard:
if (input_device == DEV_KEYBOARD)
{
    // Return:
    return string_key(global.input_key[input_id]);
}

// Joystick:
else if (input_device >= DEV_JOYSTICK0)
{
    var joystick_id;

    // Joystick offset:
    input_device -= DEV_JOYSTICK0;

    // Return:
    return char_joy(global.input_joy[input_device, input_id], global.input_style[input_device]);
}

// User:
else
{
    // Return joystick if it's connected:
    if (ctrl_input.joystick_device[0, 0] > -1)
    {
        return string_input(input_id, DEV_JOYSTICK0);
    }
    
    // Default to keyboard otherwise:
    else
    {
        return string_input(input_id, DEV_KEYBOARD);
    }
}
