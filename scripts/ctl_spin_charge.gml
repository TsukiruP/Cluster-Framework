/// ctl_spin_charge()

if (ctl_position(0))
{
    sprite_index = spr_spin_charge;
    image_index = 0;
}

else if (ctl_position(2))
{
    image_index = 1;
}

else if (ctl_position(4))
{
    image_index = 2;
}

else if (ctl_position(6))
{
    image_index = 3;
}

else if (ctl_position(7))
{
    ctl_moment = 0;
}
