/// sequence_classic_standby()

if (sequence_position(0))
{
    sprite_index = spr_classic_wait;
    image_index = 0;
    radii_set(6, 12, 3);
    hurtbox_set(6, 12, 6, 11);
    hitbox_set();
}
else if (sequence_position(6)) image_index = 1;
else if (sequence_position(12)) image_index = 2;
else if (sequence_position(18)) image_index = 1;
else if (sequence_position(24)) image_index = 0;
else if (sequence_position(30)) image_index = 1;
else if (sequence_position(36)) image_index = 2;
else if (sequence_position(42)) image_index = 1;
else if (sequence_position(48)) image_index = 0;
else if (sequence_position(54)) image_index = 1;
else if (sequence_position(60)) image_index = 2;
else if (sequence_position(66)) image_index = 1;
else if (sequence_position(72)) image_index = 9;
else if (sequence_position(96)) image_index = 10;
else if (sequence_position(120)) image_index = 11;
else if (sequence_position(126)) image_index = 12;
else if (sequence_position(132)) image_index = 13;
else if (sequence_position(144)) image_index = 14;
else if (sequence_position(150)) player_set_animation("stand");
