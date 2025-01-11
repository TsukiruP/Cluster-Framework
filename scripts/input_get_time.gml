/// input_get_time(input, target)
/* Returns whether the input's time equals or surpasses the target. */

with (ctrl_input)
{
    return input_time[argument0] >= argument1;
}
