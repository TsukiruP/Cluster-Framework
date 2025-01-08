/// ctl_classic_wait_partner()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_classic_wait;
    image_index = 3;

    // Set collision:
    radii_set(6, 12, 3);
    hurtbox_set(6, 12, 6, 11);
    hitbox_set();
}

// Change frame:
else if (ctl_position(18))
{
    image_index = 4;
}

// Change frame:
else if (ctl_position(36))
{
    image_index = 5;
}

// Change frame:
else if (ctl_position(54))
{
    image_index = 4;
}

// Change frame:
else if (ctl_position(72))
{
    image_index = 3;
}

// Change frame:
else if (ctl_position(90))
{
    image_index = 4;
}

// Change frame:
else if (ctl_position(108))
{
    image_index = 5;
}

// Change frame:
else if (ctl_position(126))
{
    image_index = 4;
}

// Change frame:
else if (ctl_position(144))
{
    image_index = 3;
}

// Change frame:
else if (ctl_position(162))
{
    image_index = 4;
}

// Change frame:
else if (ctl_position(180))
{
    image_index = 5;
}

// Change frame:
else if (ctl_position(198))
{
    image_index = 4;
}

// Change frame:
else if (ctl_position(216))
{
    image_index = 6;
}

// Change frame:
else if (ctl_position(234))
{
    image_index = 7;
}

// Change frame:
else if (ctl_position(252))
{
    image_index = 8;
}

// Change frame:
else if (ctl_position(270))
{
    image_index = 7;
}

// Change frame:
else if (ctl_position(288))
{
    image_index = 6;
}

// Change frame:
else if (ctl_position(306))
{
    image_index = 7;
}

// Change frame:
else if (ctl_position(324))
{
    image_index = 8;
}

// Change frame:
else if (ctl_position(342))
{
    image_index = 7;
}

// Change frame:
else if (ctl_position(360))
{
    image_index = 6;
}

// Change frame:
else if (ctl_position(378))
{
    image_index = 7;
}

// Change frame:
else if (ctl_position(396))
{
    image_index = 8;
}

// Change frame:
else if (ctl_position(414))
{
    image_index = 7;
}

// Change frame:
else if (ctl_position(432))
{
    image_index = 9;
}

// Change frame:
else if (ctl_position(438))
{
    image_index = 10;
}

// Change frame:
else if (ctl_position(456))
{
    image_index = 11;
}

// Change frame:
else if (ctl_position(462))
{
    image_index = 12;
}

// Change frame:
else if (ctl_position(468))
{
    image_index = 13;
}

// Change frame:
else if (ctl_position(492))
{
    image_index = 14;
}

// Loop animation:
else if (ctl_position(497))
{
    ctl_moment = 0;
}
