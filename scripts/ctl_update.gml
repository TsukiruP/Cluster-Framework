/// ctl_update()

ctl_time_previous = ctl_time;
ctl_time += ctl_speed;

// Floor time:
if (frac(ctl_speed) == 0)
{
    floor(ctl_time);
    floor(ctl_time_previous);
}
