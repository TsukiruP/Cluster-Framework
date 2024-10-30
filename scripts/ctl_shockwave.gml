/// ctl_shockwave()

// Start effect:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_shockwave;
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

// Change frame:
else if (ctl_position(6))
{
    image_index = 3;
}

// Change frame:
else if (ctl_position(8))
{
    image_index = 4;
}

// Finish effect:
else if (ctl_position(11))
{
    instance_destroy();
}
