/// ctl_shield_fire()

// Start effect:
if (ctl_position(0))
{
    sprite_index = spr_shield_fire;
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

// Change frame:
else if (ctl_position(16))
{
    image_index = 8;
}

// Change frame:
else if (ctl_position(18))
{
    image_index = 9;
}

// Change frame:
else if (ctl_position(20))
{
    image_index = 10;
}

// Change frame:
else if (ctl_position(22))
{
    image_index = 11;
}

// Change frame:
else if (ctl_position(24))
{
    image_index = 12;
}

// Change frame:
else if (ctl_position(26))
{
    image_index = 13;
}

// Change frame:
else if (ctl_position(28))
{
    image_index = 14;
}

// Change frame:
else if (ctl_position(30))
{
    image_index = 15;
}

// Change frame:
else if (ctl_position(32))
{
    image_index = 16;
}

// Change frame:
else if (ctl_position(34))
{
    image_index = 17;
}

// Null frame:
else if (ctl_position(35))
{
    ctl_time = 0;
}
