/// ctl_sonic_stomp()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_sonic_stomp;
    image_index = 0;

    // Set collision:
    player_set_radii(6, 14, 3);
    set_hurtbox(6, 16, 6, 15);
    set_hitbox();
}

// Null/Change/Finish/Loop frame/effect/animation:
else if (ctl_position(15))
{
    ctl_time = 0;
}
