/// ctl_position(step)
/* Returns whether or not the timeline position is past the given step. */

return floor(ctl_moment_previous) <= argument0 && floor(ctl_moment) > argument0;
