/// string_input(input, [device])
/* Returns a string depending on the input and device.
Defaults to user device. */

var input_id, input_device;

input_id = argument0;
input_device = DEV_USER;

if (argument_count >= 2)
{
    input_device = argument[1];
}

if (input_id == INP_ANY)
{
    input_id = irandom_range(INP_UP, INP_HIDE);
}

if (input_device == DEV_KEYBOARD)
{
    return string_key(game_config_get_key(input_id));
}

else if (input_device >= DEV_GAMEPAD0)
{
    var gamepad_id;

    input_device -= DEV_GAMEPAD0;
    return char_pad(game_config_get_btn(input_device, input_id), game_get_config("input_gamepad" + string(input_device) + "_style"));
}

// User:
else
{
    if (mgr_input.gamepad_device[0, 0] > -1)
    {
        return string_input(input_id, DEV_GAMEPAD0);
    }

    return string_input(input_id, DEV_KEYBOARD);
}
