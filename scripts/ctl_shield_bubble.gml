/// ctl_shield_bubble()

// Start effect:
if (ctl_position(0))
{
    sprite_index = spr_shield_bubble_wave;
    image_index  = 0;
}

// Change frame:
else if (ctl_position(12))
{
    image_index = 1;
}

// Change frame:
else if (ctl_position(24))
{
    image_index = 2;
}

// Change frame:
else if (ctl_position(36))
{
    image_index = 3;
}

// Change frame:
else if (ctl_position(48))
{
    image_index = 4;
}

// Change frame:
else if (ctl_position(60))
{
    image_index = 5;
}

// Change frame:
else if (ctl_position(72))
{
    image_index = 6;
}

// Change frame:
else if (ctl_position(84))
{
    image_index = 7;
}

// Change frame:
else if (ctl_position(96))
{
    image_index = 8;
}

// Null frame:
else if (ctl_position(107))
{
    ctl_time = 0;
}
