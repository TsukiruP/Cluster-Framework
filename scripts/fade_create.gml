/// fade_create([target, speed, depth, color])
/* Returns a newly created fade object. */

fade = instance_create(0, 0, ctrl_fade);
fade.depth = depth;

with (fade)
{
    if (argument_count > 0) fade_target = argument[0];
    if (argument_count > 1) fade_speed = argument[1];
    if (argument_count > 2) depth = argument[2];
    if (argument_count > 3) fade_color = argument[3];
}

return fade;
