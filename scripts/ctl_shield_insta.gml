/// ctl_shield_insta()

// Start effect:
if (ctl_position(0))
{
    sprite_index = spr_shield_insta;
    image_index  = 0;
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

// Change frame:
else if (ctl_position(10))
{
    image_index = 5;
}

// Change frame:
else if (ctl_position(12))
{
    image_index = 6;
}

// Change frame:
else if (ctl_position(14))
{
    image_index = 7;
}

// Finish effect:
else if (ctl_position(16))
{
    instance_destroy();
}
