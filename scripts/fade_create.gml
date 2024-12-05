/// fade_create([target, speed, depth, color])
// Returns a newly created fade object.

// Initialize:
fade = instance_create(0, 0, mgr_fade);
fade.depth = depth;

with (fade)
{
    // Set target:
    if (argument_count >= 1)
    {
        fade_target = argument[0];
    }

    // Set speed:
    if (argument_count >= 2)
    {
        fade_speed = argument[1];
    }

    // Set depth:
    if (argument_count >= 3)
    {
        depth = argument[2];
    }

    // Set color:
    if (argument_count >= 4)
    {
        fade_color = argument[3];
    }
}

// Return the fade:
return fade;
