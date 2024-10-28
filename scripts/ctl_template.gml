/// ctl_template()

// Start animation/effect:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = noone;
    image_index = 0;
}

// Null/Change/Finish/Loop frame/effect/animation:
else if (ctl_position(15))
{
    ctl_time = 0;
}
