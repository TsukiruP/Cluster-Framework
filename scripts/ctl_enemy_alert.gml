/// ctl_enemy_alert()

if (ctl_position(0))
{
    sprite_index = spr_enemy_alert;
    image_index = 0;
}

else if (ctl_position(4))
{
    image_index = 1;
}

else if (ctl_position(8))
{
    image_index = 2;
}

else if (ctl_position(12))
{
    instance_destroy();
}
