/// timeline_set(timeline, [start])

// Set timeline:
ctl_index = argument0;
ctl_moment = 0;
ctl_moment_previous = 0;

// Set moment:
if (argument_count >= 2)
{
    ctl_moment = argument[1];
}
