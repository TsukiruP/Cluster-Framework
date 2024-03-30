/// ctl_position(step)
// Returns whether or not the timeline position is past the given step.

if (ctl_time >= ctl_time_previous) {
    return ctl_time_previous <= argument0 && ctl_time > argument0;
} else {
    return ctl_time_previous >= argument0 && ctl_time < argument0;
}
