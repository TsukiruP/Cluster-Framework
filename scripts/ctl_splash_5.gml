/// ctl_splash_5()

// Start effect:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_splash_5;
    image_index = 0;
}

// Change frame:
else if (ctl_position(2))
{
    image_index = 1;
}

// Change frame:
else if (ctl_position(4))
{
    image_index = 2;
}

// Loop effect:
else if (ctl_position(5))
{
    ctl_moment = 0;
}
