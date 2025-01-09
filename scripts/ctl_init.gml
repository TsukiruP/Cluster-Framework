/// ctl_init([timeline])
/* Initializes custom timeline variables. */

ctl_set(noone);
ctl_speed = 1;

if (argument_count >= 1)
{
    ctl_set(argument0);
}
