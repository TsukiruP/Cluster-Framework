/// sequence_spanner()

if (sequence_position(0))
{
    sprite_index = spr_spanner;
    image_index = 0;
    x_offset = 0;
    y_offset = 0;
}
else if (sequence_position(3)) image_index = 1;
else if (sequence_position(6)) image_index = 2;
else if (sequence_position(9))
{
    image_index = 3;
    y_offset = 1;
}
else if (sequence_position(12)) image_index = 4;
else if (sequence_position(15))
{
    image_index = 5;
    y_offset = 2;
}
else if (sequence_position(18)) image_index = 0;
else if (sequence_position(21))
{
    image_index = 1;
    y_offset = 3;
}
else if (sequence_position(24)) image_index = 2;
else if (sequence_position(27))
{
    image_index = 3;
    y_offset = 4;
}
else if (sequence_position(30)) image_index = 4;
else if (sequence_position(33))
{
    image_index = 5;
    y_offset = 5;
}
else if (sequence_position(36)) image_index = 0;
else if (sequence_position(39))
{
    image_index = 1;
    y_offset = 6;
}
else if (sequence_position(42)) image_index = 2;
else if (sequence_position(45))
{
    image_index = 0;
    x_offset = 0;
    y_offset = 4;
}
else if (sequence_position(47))
{
    x_offset = -3;
    y_offset = 0;
}
else if (sequence_position(49))
{
    x_offset = 3;
    y_offset = 3;
}
else if (sequence_position(51))
{
    x_offset = -2;
    y_offset = 1;
}
else if (sequence_position(53))
{
    x_offset = 2;
    y_offset = 2;
}
else if (sequence_position(55))
{
    x_offset = -1;
    y_offset = 2;
}
else if (sequence_position(57))
{
    x_offset = 1;
    y_offset = 2;
}
else if (sequence_position(59))
{
    x_offset = -1;
    y_offset = 2;
}
else if (sequence_position(61))
{
    x_offset = 1;
    y_offset = 2;
}
else if (sequence_position(63))
{
    x_offset = -1;
    y_offset = 2;
}
else if (sequence_position(65))
{
    x_offset = 1;
    y_offset = 2;
}
else if (sequence_position(67))
{
    x_offset = 0;
    y_offset = 2;
}
else if (sequence_position(69)) image_index = 1;
else if (sequence_position(75)) image_index = 2;
else if (sequence_position(81)) image_index = 3;
else if (sequence_position(87)) image_index = 4;
else if (sequence_position(93)) image_index = 5;
else if (sequence_position(99))
{
    image_index = 10;
    hitbox_set_hurtbox(9, 15, 7, 8);
    hitbox_set_attackbox(30, 30, 30, 22);
}
else if (sequence_position(101)) image_index = 11;
else if (sequence_position(103)) image_index = 12;
else if (sequence_position(105)) image_index = 13;
else if (sequence_position(107)) image_index = 14;
else if (sequence_position(109)) image_index = 15;
else if (sequence_position(111)) image_index = 10;
else if (sequence_position(113)) image_index = 11;
else if (sequence_position(115)) image_index = 12;
else if (sequence_position(117)) image_index = 13;
else if (sequence_position(119)) image_index = 14;
else if (sequence_position(121)) image_index = 15;
else if (sequence_position(123)) image_index = 10;
else if (sequence_position(125)) image_index = 11;
else if (sequence_position(127)) image_index = 12;
else if (sequence_position(129)) image_index = 13;
else if (sequence_position(131)) image_index = 14;
else if (sequence_position(133)) image_index = 15;
else if (sequence_position(135)) image_index = 10;
else if (sequence_position(137)) image_index = 11;
else if (sequence_position(139)) image_index = 12;
else if (sequence_position(141)) image_index = 13;
else if (sequence_position(143)) image_index = 14;
else if (sequence_position(145)) image_index = 15;
else if (sequence_position(147)) image_index = 10;
else if (sequence_position(149)) image_index = 11;
else if (sequence_position(151)) image_index = 12;
else if (sequence_position(153)) image_index = 13;
else if (sequence_position(155)) image_index = 14;
else if (sequence_position(157)) image_index = 15;
else if (sequence_position(159)) image_index = 10;
else if (sequence_position(161)) image_index = 11;
else if (sequence_position(163)) image_index = 12;
else if (sequence_position(165)) image_index = 13;
else if (sequence_position(167)) image_index = 14;
else if (sequence_position(169)) image_index = 15;
else if (sequence_position(171))
{
    image_index = 0;
    x_offset = 0;
    y_offset = 0;
    hitbox_set_hurtbox(20, 19, 20, 4);
    hitbox_set_attackbox(8, 18, 7, 4);
}
else if (sequence_position(173)) image_index = 16;
else if (sequence_position(174)) image_index = 1;
else if (sequence_position(176)) image_index = 16;
else if (sequence_position(177)) image_index = 2;
else if (sequence_position(179)) image_index = 16;
else if (sequence_position(180)) image_index = 3;
else if (sequence_position(182)) image_index = 16;
else if (sequence_position(183)) image_index = 4;
else if (sequence_position(185)) image_index = 16;
else if (sequence_position(186)) image_index = 5;
else if (sequence_position(187)) sequence_moment = 0;
