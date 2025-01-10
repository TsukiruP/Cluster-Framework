/// ctl_init([timeline])
/* Initializes custom timeline variables. */

ctl_speed = 1;
ctl_set(noone);

if (argument_count >= 1)
{
    ctl_set(argument[0]);
}
