/// ctl_drop_dash()

// Start animation/effect:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_drop_dash;
    image_index = 0;
}

// Change frame:
else if (ctl_position(3))
{
    image_index = 1;
}

// Change frame:
else if (ctl_position(6))
{
    image_index = 2;
}

// Change frame:
else if (ctl_position(9))
{
    image_index = 3;
}

// Change frame:
else if (ctl_position(12))
{
    image_index = 4;
}

// Change frame:
else if (ctl_position(15))
{
    image_index = 5;
}

// Change frame:
else if (ctl_position(18))
{
    image_index = 6;
}

// Finish effect:
else if (ctl_position(21))
{
    instance_destroy();
}
