/// ctl_update()

ctl_moment_previous = ctl_moment;
ctl_moment += ctl_speed;

// Floor time:
if (frac(ctl_speed) == 0)
{
    floor(ctl_moment);
    floor(ctl_moment_previous);
}
