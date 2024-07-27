/// input_get_timer(input, target)
// Returns whether the input's timer equals or surpasses the target.

with (ctrl_input) {
    return input_timer[argument0] >= argument1;
}
