/// fade_create([target, speed, depth, color])
// Returns a newly created fade object.

fade = instance_create(0, 0, mgr_fade);

// Set target:
if (argument_count >= 1)
{
    fade.fade_target = argument[0];
}

// Set speed:
if (argument_count >= 2)
{
    fade.fade_speed = argument[1];
}

// Set depth:
if (argument_count >= 3)
{
    fade.depth = argument[2];
}
else
{
    fade.depth = depth + 1;
}

// Set color:
if (argument_count >= 4)
{
    fade.fade_color = argument[3];
}

// Return the fade manager:
return fade;
