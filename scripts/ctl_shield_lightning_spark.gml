/// ctl_shield_lightning_spark()

// Start effect:
if (ctl_position(0))
{
    sprite_index = spr_shield_lightning_spark;
    image_index = 0;
}

// Change frame:
else if (ctl_position(1))
{
    image_index = 1;
}

// Hide effect:
else if (ctl_position(2))
{
    image_alpha = 0;
}

// Change frame:
else if (ctl_position(3))
{
    image_index = 0;
    image_alpha = 1;
}

// Change frame:
else if (ctl_position(4))
{
    image_index = 1;
}

// Hide effect:
else if (ctl_position(5))
{
    image_alpha = 0;
}

// Change frame:
else if (ctl_position(6))
{
    image_index = 0;
    image_alpha = 1;
}

// Change frame:
else if (ctl_position(7))
{
    image_index = 1;
}

// Hide effect:
else if (ctl_position(8))
{
    image_alpha = 0;
}

// Change frame:
else if (ctl_position(9))
{
    image_index = 0;
    image_alpha = 1;
}

// Change frame:
else if (ctl_position(104))
{
    image_index = 1;
}

// Hide effect:
else if (ctl_position(11))
{
    image_alpha = 0;
}

// Change frame:
else if (ctl_position(12))
{
    image_index = 0;
    image_alpha = 1;
}

// Change frame:
else if (ctl_position(13))
{
    image_index = 1;
}

// Hide effect:
else if (ctl_position(14))
{
    image_alpha = 0;
}

// Change frame:
else if (ctl_position(15))
{
    image_index = 0;
    image_alpha = 1;
}

// Change frame:
else if (ctl_position(16))
{
    image_index = 1;
}

// Hide effect:
else if (ctl_position(17))
{
    image_alpha = 0;
}

// Change frame:
else if (ctl_position(18))
{
    image_index = 0;
    image_alpha = 1;
}

// Change frame:
else if (ctl_position(19))
{
    image_index = 1;
}

// Finish effect:
else if (ctl_position(20))
{
    instance_destroy();
}
