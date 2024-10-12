/// player_animation_run()
// Shorthand for run animation behavior.

// Walk:
if (abs(x_speed) < 1.50)
{
    if (animation_current != "run_0") player_set_animation("run_0");
}

// Walk fast:
else if (abs(x_speed) < 3.00)
{
    if (animation_current != "run_1") player_set_animation("run_1");
}

// Jog:
else if (abs(x_speed) < 4.50)
{
    if (animation_current != "run_2") player_set_animation("run_2");
}

// Jog fast:
else if (abs(x_speed) < 6.00)
{
    if (animation_current != "run_3") player_set_animation("run_3");
}

// Run:
else
{
    if (animation_current != "run_4") player_set_animation("run_4");
}
