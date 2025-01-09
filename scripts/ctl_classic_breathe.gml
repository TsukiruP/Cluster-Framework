/// ctl_classic_breathe()

if (ctl_position(0))
{
    sprite_index = spr_classic_misc;
    image_index = 2;

    radii_set(6, 12, 3);
    hurtbox_set(6, 12, 6, 11);
    hitbox_set();
}
