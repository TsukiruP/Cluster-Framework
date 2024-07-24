/// timeline_set(timeline, [start])

var moment_target;

// Moment target:
if (argument_count >= 2) {
    moment_target = argument[1];
} else {
    moment_target = 0;
}

// Update timeline:
ctl_index         = argument[0];
ctl_time          = moment_target;
ctl_time_previous = 0;
