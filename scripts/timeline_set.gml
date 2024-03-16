/// timeline_set(timeline, [start])

var moment_target;

// Moment target:
if (argument_count >= 2) moment_target = argument[1];
else moment_target = 0;

// Update timeline:
timeline_index    = argument[0];
timeline_position = moment_target;
timeline_running  = true;
