/// ctl_reticle()

// Start effect:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_reticle;
    image_index = 0;
}

// Change frame:
else if (ctl_position(6))
{
    image_index = 1;
}

// Change frame:
else if (ctl_position(12))
{
    image_index = 2;
}

// Change frame:
else if (ctl_position(18))
{
    image_index = 3;
}

// Loop effect:
else if (ctl_position(23))
{
    ctl_moment = 0;
}
