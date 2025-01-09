/// ctl_set(timeline, [start])
/* Sets the index to the given timeline */

ctl_index = argument0;
ctl_moment = 0;
ctl_moment_previous = 0;

if (argument_count >= 2)
{
    ctl_moment = argument[1];
}
