/// string_input(input, [device])
/* Returns a string depending on the input and device.
Defaults to user device. */

var input_id, input_device;

input_id = pick(argument0 == INP_ANY, argument0, irandom_range(INP_UP, INP_HIDE));
input_device = DEV_USER;
if (argument_count > 1) input_device = argument[1];

if (input_device == DEV_KEYBOARD) return string_key(game_config_get_key(input_id));
else if (input_device >= DEV_GAMEPAD0)
{
    input_device -= DEV_GAMEPAD0;
    return char_pad(game_config_get_btn(input_device, input_id), game_get_config("input_gamepad" + string(input_device) + "_style"));
}
else
{
    if (ctrl_input.gamepad_device[0, 0] > -1) return string_input(input_id, DEV_GAMEPAD0);
    return string_input(input_id, DEV_KEYBOARD);
}
