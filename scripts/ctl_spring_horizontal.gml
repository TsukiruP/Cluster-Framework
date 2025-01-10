/// ctl_spring_horizontal()

if (ctl_position(0))
{
    image_index = 1;
    hurtbox_set(16, 5, 2, 5);
}

else if (ctl_position(2))
{
    image_index = 2;
    hurtbox_set(16, 5, 17, 5);
}

else if (ctl_position(6))
{
    image_index = 3;
    hurtbox_set(16, 5, 13, 5);
}

else if (ctl_position(8))
{
    image_index = 4;
    hurtbox_set(16, 5, 16, 5);
}

else if (ctl_position(12))
{
    image_index = 5;
    hurtbox_set(16, 5, 13, 5);
}

else if (ctl_position(14))
{
    hurtbox_set(16, 5, 4, 5);
    activated = false;
}
