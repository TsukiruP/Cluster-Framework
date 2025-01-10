/// ctl_spring_diagonal()

if (ctl_position(0))
{
    image_index = 1;
    hurtbox_set(6, 2, 4, 8, -4, 3);
}

else if (ctl_position(2))
{
    image_index = 2;
    hurtbox_set(6, 2, 4, 8, 7, -8);
}

else if (ctl_position(6))
{
    image_index = 3;
    hurtbox_set(6, 2, 4, 8, 3, -4);
}

else if (ctl_position(8))
{
    image_index = 4;
    hurtbox_set(6, 2, 4, 8, 6, -7);
}

else if (ctl_position(12))
{
    image_index = 5;
    hurtbox_set(6, 2, 4, 8, 3, -4);
}

else if (ctl_position(14))
{
    hurtbox_set(6, 2, 4, 8);

    activated = false;
}
