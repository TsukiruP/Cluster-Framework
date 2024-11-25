/// ctl_debuff()

// Start effect:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_debuff;
    image_index = 0;
}

// Change frame:
else if (ctl_position(7))
{
    image_index = 1;
}

// Change frame:
else if (ctl_position(14))
{
    image_index = 2;
}

// Change frame:
else if (ctl_position(21))
{
    image_index = 3;
}

// Change frame:
else if (ctl_position(28))
{
    image_index = 4;
}

// Change frame:
else if (ctl_position(35))
{
    image_index = 5;
}

// Loop effect:
else if (ctl_position(41))
{
    ctl_moment = 0;
}
