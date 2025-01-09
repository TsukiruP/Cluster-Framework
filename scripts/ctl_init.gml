/// ctl_init([timeline])
/* Initializes custom timeline variables. */

ctl_index = noone;
ctl_speed = 1;
ctl_moment = 0;
ctl_moment_previous = 0;

if (argument_count >= 1)
{
    ctl_index = argument[0];
}
