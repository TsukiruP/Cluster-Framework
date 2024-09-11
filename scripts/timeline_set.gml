/// timeline_set(timeline, [start])

// Set timeline:
ctl_index         = argument0;
ctl_time          = 0;
ctl_time_previous = 0;

// Set moment:
if (argument_count >= 2)
{
    ctl_time = argument[1];
}
