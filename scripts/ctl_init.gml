/// ctl_init([timeline])
// Initializes custom timeline variables.

ctl_index = noone;
ctl_speed = 1;
ctl_time = 0;
ctl_time_previous = 0;

// Set index:
if (argument_count >= 1)
{
    ctl_index = argument[0];
}
